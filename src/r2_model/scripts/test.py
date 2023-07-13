#!/usr/bin/env python

import rospy

if __name__ == "__main__":
    rospy.init_node('cmdvel2gazebo', anonymous=True)
    for i in range(10):
        rospy.loginfo("hello test")
        rospy.Rate(1).sleep()