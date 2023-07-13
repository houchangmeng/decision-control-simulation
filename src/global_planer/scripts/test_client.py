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

if __name__ == "__main__":

    rospy.init_node("Client")
    client = rospy.ServiceProxy("/target_compute",Nav)
    rospy.loginfo("Client has started!")


    client.wait_for_service()
    navReq = NavRequest()
    navReq.currentTime = rospy.Time.now().to_sec() + 0.1
    navReq.currentPose = PoseStamped()
    navReq.currentTwist = TwistStamped()
    res = client.call(navReq)

    print("response kappa is ", res.kappa)


 

    