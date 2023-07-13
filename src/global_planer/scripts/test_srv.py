#! /usr/bin/env python

import os
import csv
import math
import numpy as np

import sys
sys.path.append('../../../devel/lib/python3/dist-packages')


from geometry_msgs.msg import Quaternion, PoseStamped, TwistStamped
from styx_msgs.msg import Lane, Waypoint
from nav_msgs.msg import Path
import tf_conversions
import rospy
from styx_msgs.srv import NavRequest,NavResponse,Nav

def cb(req):
    current_time = req.currentTime

    print("current_time is %d"%current_time)
    current_pose = req.currentPose
    print("current_pose is ",current_pose)
    Res = NavResponse()
    Res.kappa = 2.0
    return Res

if __name__ == "__main__":

    rospy.init_node("Server")
    server = rospy.Service("test_nav",Nav,cb)
    rospy.loginfo("Server has started!")
    rospy.spin()