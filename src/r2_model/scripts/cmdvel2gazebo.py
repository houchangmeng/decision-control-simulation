#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64
from geometry_msgs.msg import Twist
import math

class Cmdvel2Gazebo:
    """
    This Class create a subscriber and four publisher.
    The subscirber is used for receiving user motion command. 
    Four publisher are used for converting subscirber msgs to actuator command and sending actuator command to gazebo controller.
    """
    def __init__(self) -> None:
        rospy.init_node('cmdvel2gazebo', anonymous=True)
        
        rospy.Subscriber('/smart/cmd_vel', Twist, self.callback, queue_size=1)

        self.pub_steerL = rospy.Publisher('/smart/front_left_steering_position_controller/command', Float64, queue_size=1)
        self.pub_steerR = rospy.Publisher('/smart/front_right_steering_position_controller/command', Float64, queue_size=1)
        self.pub_rearL = rospy.Publisher('/smart/rear_left_velocity_controller/command', Float64, queue_size=1)
        self.pub_rearR = rospy.Publisher('/smart/rear_right_velocity_controller/command', Float64, queue_size=1)

        # Initial velocity and tire angle are 0
        self.x = 0
        self.z = 0

        # car Wheelbase (in m)
        L = rospy.get_param('~axle_length')
        self.L = L
        

        # car Tread
        W = rospy.get_param('~axle_weight')
        self.T_front = W
        self.T_rear = W

        # how many seconds delay for the dead man's switch
        self.timeout = rospy.Duration.from_sec(0.2)
        self.lastMsg = rospy.Time.now()

        # maximum steer angle of the "inside" tire
        self.maxsteerInside = rospy.get_param('~max_steer_angle')
        # self.maxsteerInside=0.6;

        self.r = 0.0125
        
        # turning radius for maximum steer angle just with the inside tire
        # tan(maxsteerInside) = wheelbase/radius --> solve for max radius at this angle
        rMax = self.L/math.tan(self.maxsteerInside);
    
        # radius of inside tire is rMax, so radius of the ideal middle tire (rIdeal) is rMax+treadwidth/2
        rIdeal = rMax+(self.T_front/2.0)

        # maximum steering angle for ideal middle tire
        # tan(angle) = wheelbase/radius
        self.maxsteer=math.atan2(self.L,rIdeal)

        # loop

        rate = rospy.Rate(10) # run at 10Hz
        while not rospy.is_shutdown():
            self.publish()
            rate.sleep()


    def callback(self,data):
        # w = v / r
        self.x = data.linear.x / self.r
        # constrain the ideal steering angle such that the ackermann steering is maxed out
        self.z = max(-self.maxsteer,min(self.maxsteer,data.angular.z))
        self.lastMsg = rospy.Time.now()

    def publish(self):
        # now that these values are published, we
        # reset the velocity, so that if we don't hear new
        # ones for the next timestep that we time out; note
        # that the tire angle will not change
        # NOTE: we only set self.x to be 0 after 200ms of timeout
        
        delta_last_msg_time = rospy.Time.now() - self.lastMsg
        msgs_too_old = delta_last_msg_time > self.timeout
        if msgs_too_old:
            self.x = 0
            msgRear = Float64()
            msgRear.data = self.x
            self.pub_rearL.publish(msgRear)
            self.pub_rearR.publish(msgRear)
            msgSteer = Float64()
            msgSteer.data = 0
            self.pub_steerL.publish(msgSteer)
            self.pub_steerR.publish(msgSteer)

            return
        
        if self.z != 0:
            T_rear = self.T_rear
            T_front = self.T_front
            L=self.L
            # self.v is the linear *velocity*
            r = L/math.fabs(math.tan(self.z))
            rL_rear = r-(math.copysign(1,self.z)*(T_rear/2.0))
            rR_rear = r+(math.copysign(1,self.z)*(T_rear/2.0))
            # rL_front = r-(math.copysign(1,self.z)*(T_front/2.0))
            # rR_front = r+(math.copysign(1,self.z)*(T_front/2.0))
            msgRearR = Float64()
            # the right tire will go a little faster when we turn left (positive angle)
            # amount is proportional to the radius of the outside/ideal
            msgRearR.data = self.x*rR_rear/r
            msgRearL = Float64()
            # the left tire will go a little slower when we turn left (positive angle)
            # amount is proportional to the radius of the inside/ideal
            msgRearL.data = self.x*rL_rear/r
        
            self.pub_rearL.publish(msgRearL)
            self.pub_rearR.publish(msgRearR)

            msgSteerL = Float64()
            msgSteerR = Float64()
            # the left tire's angle is solved directly from ackerman geometry
            msgSteerL.data = math.atan2(L*math.tan(self.z), L-0.5*T_rear*math.tan(self.z)*math.copysign(1,self.z))
            # msgSteerL.data = math.atan2(L,rL_front)*math.copysign(1,self.z)
            self.pub_steerL.publish(msgSteerL)
    
            # the right tire's angle is solved directly from ackerman geometry
            msgSteerR.data = math.atan2(L*math.tan(self.z), L+0.5*T_rear*math.tan(self.z)*math.copysign(1,self.z))
            # msgSteerR.data = math.atan2(L,rR_front)*math.copysign(1,self.z)
            self.pub_steerR.publish(msgSteerR)

        else:
            msgRear = Float64()
            msgRear.data = self.x
            self.pub_rearL.publish(msgRear)
            self.pub_rearR.publish(msgRear)

            msgSteer = Float64()
            msgSteer.data = self.z
            self.pub_steerL.publish(msgSteer)
            self.pub_steerR.publish(msgSteer)

if __name__=="__main__":
    try:
        Cmdvel2Gazebo()
    except rospy.ROSInterruptException:
        print("------ cmd_vel2gazebo node exit by user!")

