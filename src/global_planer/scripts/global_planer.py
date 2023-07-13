#! /usr/bin/env python

import os
import csv
import math
import numpy as np

import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')

from geometry_msgs.msg import Quaternion, PoseStamped, Pose, Twist
from styx_msgs.msg import Lane, Waypoint
from styx_msgs.srv import NavRequest,NavResponse,Nav
from nav_msgs.msg import Path
import tf_conversions
import rospy


def mapping_servo_steer(steer):
    """Mapping steer angle to servo_angle."""
    if steer > 42.0 or steer < -30.0: 
        raise ValueError("Input steer is not in avaliable range [-30,42]")
    if steer > 0 :
        servo_angle = 42 / 60 * steer
    else:
        servo_angle = 30 / 60 * steer
    return servo_angle

def planning(start, end, time_start, time_end):
    """Calculate quintic polynomial."""
    b_start = start
    b_end = end
    tstart1 = time_start
    tend1 = time_end
    bstart = np.array([b_start,0,0])
    bend = np.array([b_end,0,0])

    a = np.zeros((1,6))
    b = np.zeros((1,6))
    tstart2 = tstart1 * tstart1
    tstart3 = tstart2 * tstart1
    tstart4 = tstart3 * tstart1
    tstart5 = tstart4 * tstart1
    tend2 = tend1 * tend1
    tend3 = tend2 * tend1
    tend4 = tend3 * tend1
    tend5 = tend4 * tend1
    A = np.array([[1, tstart1,   tstart2, tstart3,     tstart4,     tstart5],\
                  [0,       1, 2*tstart1, 3*tstart2,  4*tstart3,  5*tstart4],\
                  [0,       0,         2, 6*tstart1, 12*tstart2, 20*tstart3],\
                  [1,   tend1,     tend2,     tend3,      tend4,      tend5],\
                  [0,       1,   2*tend1,   3*tend2,    4*tend3,    5*tend4],\
                  [0,       0,         2,   6*tend1,   12*tend2,   20*tend3]])
    Bx = np.concatenate((bstart,bend),axis=0)
    coeff_x = np.dot(np.linalg.inv(A),Bx)
    a = coeff_x
    return a

def quintic_polynomial(a,x):
    y     =   a[0] +     a[1] * x +     a[2] * x*x +     a[3] * x*x*x +     a[4] * x*x*x*x +a[5] * x*x*x*x*x
    y_dot =   a[1] + 2 * a[2] * x + 3 * a[3] * x*x + 4 * a[4] * x*x*x + 5 * a[5] * x*x*x*x
    y_dot2= 2*a[2] + 6 * a[3] * x + 12* a[4] * x*x + 20* a[5] * x*x*x
    return y, y_dot,y_dot2


class GlobalPlaner(object):
    """This class load global path waypoint and publish."""
    
    def __init__(self):
        rospy.init_node("waypoint_loader",log_level=rospy.DEBUG)
        self.pub = rospy.Publisher("/base_waypoints",Lane,queue_size=1,latch=True)
        self.pub_path = rospy.Publisher("/base_path",Path,queue_size=1,latch=True)

        self.srv_path = rospy.Service("/target_compute",Nav,self.service_cb)

        t_start = rospy.get_param("~t_start")
        t_end = rospy.get_param("~t_end")
        x_start = rospy.get_param("~x_start")
        x_end = rospy.get_param("~x_end")
        y_start = rospy.get_param("~y_start")
        y_end = rospy.get_param("~y_end")
        num_waypoints = rospy.get_param("~num_waypoints")

        self.new_waypoint_loader(t_start, t_end, x_start,x_end, y_start, y_end, num_waypoints)

        rospy.spin()
    
    def new_waypoint_loader(self,t_start, t_end, x_start,x_end, y_start, y_end, num_waypoints):
        
        waypoints, base_path = self.load_waypoints(t_start, t_end, x_start,x_end, y_start, y_end, num_waypoints)
        self.publish(waypoints, base_path)
        rospy.loginfo("Waypoint Loaded")

    def quaternion_from_yaw(self,yaw):
        return tf_conversions.transformations.quaternion_from_euler(0.,0.,yaw)
    
    def kmph2mps(self, velocity_kmph):
        return (velocity_kmph * 1000.) / (60. * 60.)

    def load_waypoints(self,t_start, t_end, x_start, x_end, y_start, y_end, num_waypoints):

        Ax = planning(x_start, x_end, t_start, t_end)
        Ay = planning(y_start, y_end, x_start, x_end)
        self.Ax = Ax
        self.Ay = Ay

        tSequence = np.linspace(t_start,t_end,num_waypoints)

        waypoints = []
        base_path = Path()
        base_path.header.frame_id = 'world'

        for t in tSequence:
            x, x_dot,x_dot2  = quintic_polynomial(Ax,t)
            y, dy_dx,dy_ddx  = quintic_polynomial(Ay,x)
            yaw = np.arctan(dy_dx)
            y_dot = dy_dx * x_dot
            velocity = np.sqrt(x_dot*x_dot + y_dot*y_dot) # m/s

            p = Waypoint()
            p.pose.pose.position.x = float(x)
            p.pose.pose.position.y = float(y)
            q = self.quaternion_from_yaw(float(yaw))
            p.pose.pose.orientation = Quaternion(*q)
            p.twist.twist.linear.x = float(velocity)
            p.forward = True
            waypoints.append(p)

            path_element = PoseStamped()
            path_element.pose.position.x = p.pose.pose.position.x
            path_element.pose.position.y = p.pose.pose.position.y

            base_path.poses.append(path_element) 

        return waypoints, base_path
    
    def service_cb(self,navReq):
        currentTime = navReq.currentTime


        x, x_dot, x_dot2  = quintic_polynomial(self.Ax,currentTime)
        y, dy_dx, dy_ddx  = quintic_polynomial(self.Ay,x)
        yaw = np.arctan(dy_dx)
        y_dot = dy_dx * x_dot
        # velocity = np.sqrt(x_dot*x_dot + y_dot*y_dot) # m/s

        navRes = NavResponse()
        navRes.targetPose.pose.position.x = float(x)
        navRes.targetPose.pose.position.y = float(y)
        q = self.quaternion_from_yaw(float(yaw))
        navRes.targetPose.pose.orientation = Quaternion(*q)

        navRes.targetTwist.twist.linear.x = float(x_dot)
        navRes.targetTwist.twist.linear.y = float(y_dot)
        navRes.kappa = 0

        return navRes

    def distance(self, p1, p2):
        x, y, z = p1.x - p2.x, p1.y - p2.y, p1.z - p2.z
        return math.sqrt(x*x + y*y + z*z)


    def publish(self,waypoints, base_path):
        lane = Lane()
        lane.header.frame_id = "world"
        lane.header.stamp = rospy.Time(0)
        lane.waypoints = waypoints
        self.pub.publish(lane)
        self.pub_path.publish(base_path)


if __name__ == "__main__":
    try:
        GlobalPlaner()
    except rospy.ROSInterruptException:
        rospy.logerr('Could not start waypoint node.')






        