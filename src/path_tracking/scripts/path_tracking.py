#! /usr/bin/env python

import os
import csv
import math

from geometry_msgs.msg import Quaternion, PoseStamped, TwistStamped, Twist

from styx_msgs.msg import Lane, Waypoint
from styx_msgs.srv import NavRequest,NavResponse,Nav
from std_msgs.msg import Float32
from gazebo_msgs.msg import ModelStates
from collections import deque

import tf
import rospy
import numpy as np
import matplotlib.pyplot as plt

FREQ = 500
K = 0.15

class PathTracking:
    def __init__(self):

        rospy.init_node("vehicle_longtitude_lateral_controller",log_level=rospy.DEBUG)

        rospy.Subscriber("/smart/center_pose",PoseStamped,self.pose_cb,queue_size=1)
        rospy.Subscriber("/smart/velocity",TwistStamped,self.vel_cb,queue_size=1)
        rospy.Subscriber("/final_waypoints",Lane,self.lane_cb,queue_size=1)
        rospy.Subscriber("/base_waypoints",Lane,self.global_lane_cb,queue_size=1)
        self.client_path = rospy.ServiceProxy("/target_compute",Nav)

        self.target_vel = []
        self.tracking_vel = []
        self.target_y = []
        self.tracking_y = []
        self.target_x = []
        self.tracking_x = []
        
        self.dt = 1 / FREQ
        # self.longtitude_controller = Longtitude_PID(K_P=1.0 , K_I=0.1, K_D=0.0 ,dt = 1 / FREQ)
        self.longtitude_controller = Incremental_PID(K_P=1.0 , K_I=0.1, K_D=0.0 ,dt = 1 / FREQ)

        # self.lateral_controller = PurePersuit()
        self.lateral_controller = Stanley()
        self.twist_pub = rospy.Publisher("/smart/cmd_vel",Twist, queue_size = 1)

        self.currentPose = None
        self.currentVelocity = None
        self.currentWaypoints = None
        self.globalWaypoints = None
        self.lastCurrentX = 0
        self.lastTargetX = 0
        self.rate = rospy.Rate(FREQ)

        self.startTime = rospy.get_time()
        while rospy.get_time() < 1.0:
            self.startTime = rospy.get_time()

        print("startTime Time is ",  rospy.get_time())

        self.loop()

    def loop(self):

        
        rospy.logwarn("Stanley Pid starts.")
        while not rospy.is_shutdown():

            if self.currentPose and self.currentVelocity and self.currentWaypoints and self.globalWaypoints:
                twistCommand, finish = self.calculateTwistCommand()
                self.twist_pub.publish(twistCommand)
                if finish: 
                    t = np.linspace(0,10,len(self.target_x))
                    plt.subplot(1,3,1)
                    plt.title("x")
                    y11 = np.array(self.target_x)
                    y12 = np.array(self.tracking_x)
                    plt.plot(t,y11,t,y12)
                    plt.plot()
                    plt.subplot(1,3,2)
                    plt.title("y")
                    y21 = np.array(self.target_y)
                    y22 = np.array(self.tracking_y)
                    plt.plot(t,y21,t,y22)
                    plt.plot()
                    plt.subplot(1,3,3)
                    plt.title("velocity")
                    y31 = np.array(self.target_vel)
                    y32 = np.array(self.tracking_vel)
                    plt.plot(t,y31,t,y32)
                    plt.plot()
                    plt.show()
                    return 
                    
            self.rate.sleep()

    def pose_cb(self,data):
        self.currentPose = data
    
    def vel_cb(self,data):
        self.currentVelocity = data

    def lane_cb(self,data):
        self.currentWaypoints = data

    def global_lane_cb(self,data):
        self.globalWaypoints = data

    def calculateTwistCommand(self):
        lad = 0.0 #look ahead distance accumulator
        targetIndex = len(self.currentWaypoints.waypoints) - 1

        currentSpeedX = self.currentVelocity.twist.linear.x
        currentSpeedY = self.currentVelocity.twist.linear.y

        currentSpeed = math.sqrt(math.pow(currentSpeedX, 2) + math.pow(currentSpeedY,2)) # m/s

        currentX = self.currentPose.pose.position.x
        currentY = self.currentPose.pose.position.y
        current_e = np.inf
        for i in range(len(self.currentWaypoints.waypoints) - 1):
            this_x = self.currentWaypoints.waypoints[i].pose.pose.position.x
            this_y = self.currentWaypoints.waypoints[i].pose.pose.position.y
            current_e_temp = math.hypot(this_x - currentX, this_y - currentY)
            if(current_e_temp < current_e):
                current_e  = current_e_temp
                targetIndex = i+1

        currentTime = rospy.get_time() - self.startTime
        print("current Time is ", currentTime)
       

        navReq = NavRequest()
        navReq.currentTime = currentTime
        navReq.currentPose = PoseStamped()
        navReq.currentTwist = TwistStamped()

        self.client_path.wait_for_service()
        navResponse = self.client_path.call(navReq)
        
        
        targetX = navResponse.targetPose.pose.position.x
        targetY = navResponse.targetPose.pose.position.y
        targetQuanternion = (navResponse.targetPose.pose.orientation.x, navResponse.targetPose.pose.orientation.y, navResponse.targetPose.pose.orientation.z,navResponse.targetPose.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(targetQuanternion)
        targetYaw = euler[2]
        targetSpeedX = navResponse.targetTwist.twist.linear.x
        targetSpeedY = navResponse.targetTwist.twist.linear.y

        targetSpeed = math.sqrt(math.pow(targetSpeedX, 2) +  math.pow(targetSpeedY,2)) # m/s
        # targetSpeed = targetSpeedX
        lonTargetWaypoint2D= [targetX, targetY, targetYaw, targetSpeed]

        dervCurrentSpeed = (currentX - self.lastCurrentX) * FREQ
        dervTargetSpeed = (targetX - self.lastTargetX) * FREQ
        self.lastCurrentX = currentX
        self.lastTargetX = targetX

        self.target_vel.append(targetSpeed) # blue
        self.tracking_vel.append(currentSpeed) # orange
        
        self.target_x.append(targetX)
        self.tracking_x.append(currentX)

        self.target_y.append(targetY)
        self.tracking_y.append(currentY)

        closestWaypoint = self.currentWaypoints.waypoints[targetIndex]
        closestSpeed = closestWaypoint.twist.twist.linear.x
        closestX = closestWaypoint.pose.pose.position.x
        closestY = closestWaypoint.pose.pose.position.y
        closestQuanternion = (closestWaypoint.pose.pose.orientation.x, closestWaypoint.pose.pose.orientation.y, closestWaypoint.pose.pose.orientation.z,closestWaypoint.pose.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(closestQuanternion)
        closesYaw = euler[2]
        latTargetState= [closestX, closestY, closesYaw, closestSpeed]

        currentX = self.currentPose.pose.position.x
        currentY = self.currentPose.pose.position.y
        quanternion = (self.currentPose.pose.orientation.x, self.currentPose.pose.orientation.y, self.currentPose.pose.orientation.z, self.currentPose.pose.orientation.w)
        euler = tf.transformations.euler_from_quaternion(quanternion)
        currnetYaw = euler[2]

        lonCurrentWaypoint2D = [currentX, currentY, currnetYaw, currentSpeed]
        latCurrentState = [currentX, currentY, currnetYaw, currentSpeed]

        speed = self.longtitude_controller.run_step(lonTargetWaypoint2D, lonCurrentWaypoint2D)
  
        theta = self.lateral_controller.run_step(latTargetState, latCurrentState)

        if (currentTime < 19.9):
            twistCmd = Twist()
            twistCmd.linear.x = speed
            twistCmd.angular.z = theta
            finish = False
        else:
            twistCmd = Twist()
            twistCmd.linear.x = 0
            twistCmd.angular.z = 0
            finish = True
            print("targetIndex",targetIndex)
        
        return twistCmd, finish
    

class Incremental_PID(object):

    def __init__(self, K_P, K_I, K_D, dt):

        self.pidPositionPutput =0.0 
        self.pidVelocityPutput =0.0          
 
        self.lastPositionError = 0.0
        self.lastLastPositionError = 0.0

        self.lastVelocityError = 0.0
        self.lastLastVelocityError = 0.0
    
    def run_step(self,targetWaypoint2D, currentWaypoint2D):
        targetX = targetWaypoint2D[0]
        targetY = targetWaypoint2D[1]
        targetYaw = targetWaypoint2D[2]

        currentX = currentWaypoint2D[0]
        currentY = currentWaypoint2D[1]
        d_err = np.matrix([currentX - targetX, currentY - targetY])
        tor = np.matrix([np.cos(targetYaw), np.sin(targetYaw)])

        es = - float(np.dot(d_err, tor.T))
        es = es - 0.5 * self.lastLastPositionError# fileter

        positionIncrement = 8.0* (es - self.lastPositionError) + 0.001 * es + 0.00 * (es - 2*self.lastPositionError + self.lastLastPositionError)
        self.pidPositionPutput += positionIncrement

        self.lastLastPositionError = self.lastPositionError
        self.lastPositionError = es
        
        
        targetSpeed = targetWaypoint2D[3]
        currentSpeed = currentWaypoint2D[3]

        ev = targetSpeed - currentSpeed + self.pidPositionPutput
        # ev = targetSpeed - currentSpeed + 0
        ev = ev - 0.5 * self.lastLastVelocityError# fileter
        velocityIncrement = 0.3 * (ev - self.lastVelocityError) + 0.00 * es + 0.00 * (es - 2*self.lastVelocityError + self.lastLastVelocityError)
        self.pidVelocityPutput +=velocityIncrement
        pid_velocity_output = np.clip(self.pidVelocityPutput, -1.0, 1.0)
        
        self.lastLastVelocityError = self.lastVelocityError
        self.lastVelocityError = ev

        return pid_velocity_output
    

# class LQR:
#     def __init__(self) -> None:
#         pass

#     def run_step()
#     pass

class Stanley(object):
    def __init__(self) -> None:
        pass

    def run_step(self,targetState,currentState):

        targetX = targetState[0]
        targetY = targetState[1]
        targetYaw = targetState[2]

        currentX = currentState[0]
        currentY = currentState[1]
        currentYaw = currentState[2]

        targetSpeed = targetState[3]
        currentSpeed = currentState[3]

        d_err = np.matrix([currentX - targetX, currentY - targetY])
        tor = np.matrix([np.cos(targetYaw), np.sin(targetYaw)])

        es = - float(np.dot(d_err, tor.T))

        delta_theta_yaw = targetYaw - currentYaw
        delta_theta_e = math.atan2(K * es , currentSpeed)

        theta = delta_theta_yaw + delta_theta_e

        return theta


class Longtitude_PID(object):

    def __init__(self, K_P, K_I, K_D, dt):

        self._k_p = K_P
        self._k_i = K_I
        self._k_d = K_D
        self._dt = dt
        self._es_buffer = deque(maxlen=10)
        self._ev_buffer = deque(maxlen=10)
    
    def run_step(self,targetWaypoint2D, currentWaypoint2D):
        targetX = targetWaypoint2D[0]
        targetY = targetWaypoint2D[1]
        targetYaw = targetWaypoint2D[2]

        currentX = currentWaypoint2D[0]
        currentY = currentWaypoint2D[1]
        d_err = np.matrix([currentX - targetX, currentY - targetY])
        tor = np.matrix([np.cos(targetYaw), np.sin(targetYaw)])

        es = - float(np.dot(d_err, tor.T))

        if len(self._es_buffer) >= 2:
            _ke = es - 0.5 * self._es_buffer[-2] # fileter
            # _ke = es
            _de = (self._es_buffer[-1] - self._es_buffer[-2]) / self._dt
            _ie = sum(self._es_buffer) * self._dt
        else:
            _ke = 0.0
            _de = 0.0
            _ie = 0.0
        
        pidPositionOutput = (0.2 * _ke) + (0.0 * _de) + (0.0  * _ie)
        self._es_buffer.append(_ke)
        targetSpeed = targetWaypoint2D[3]
        currentSpeed = currentWaypoint2D[3]

        ev = targetSpeed - currentSpeed + pidPositionOutput

        if len(self._ev_buffer) >= 2:
            _ke = ev
            _de = (self._ev_buffer[-1] - self._ev_buffer[-2]) / self._dt
            _ie = sum(self._ev_buffer) * self._dt
        else:
            _ke = 0.0
            _de = 0.0
            _ie = 0.0

        pid_velocity_output = np.clip((0.1 * _ke) + (0.0 * _de) + (0.0 * _ie), -2.0, 2.0)
        self._ev_buffer.append(_ke)
        
        return pid_velocity_output
    

class PurePersuit(object):
    def __init__(self):

        pass

    def run_step(self,targetWaypoint2D,currentWaypoint2D):
        targetX = targetWaypoint2D[0]
        targetY = targetWaypoint2D[1]
        targetYaw = targetWaypoint2D[2]

        currentX = currentWaypoint2D[0]
        currentY = currentWaypoint2D[1]
        currentYaw = currentWaypoint2D[2]

        alpha = math.atan2(targetY - currentY, targetX - currentX) - currentYaw
        l = math.sqrt(math.pow(currentX - targetX, 2) + math.pow(currentY - targetY, 2))

        if (l > 0.5):
            # vehicle length :1.868
            theta = math.atan(2 * 1.868 * math.sin(alpha) / l)
        else:
            theta = 0.
        return theta
    


if __name__ == "__main__":

    # PurePersuit()
    # Stanley()
    PathTracking()
  