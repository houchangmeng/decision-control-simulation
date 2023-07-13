#! /usr/bin/env python

import rospy
from geometry_msgs.msg import PoseStamped
from styx_msgs.msg import Lane, Waypoint
from nav_msgs.msg import Path

import math
import numpy as np
from scipy.spatial import KDTree

LOOKAHEAD_WPS = 20 # Number of waypoints we will publish.


class WaypointUpdater(object):
    """
    This Class trunctate global path to local path with 20 meters length.
    """

    def __init__(self):
        rospy.init_node("waypoint_updater",log_level=rospy.DEBUG)

        rospy.Subscriber("/smart/rear_pose",PoseStamped, self.pose_cb)
        rospy.Subscriber("/base_waypoints",Lane, self.waypoints_cb)
        
        self.final_waypoints_pub = rospy.Publisher('final_waypoints', Lane, queue_size=1)
        self.final_path_pub = rospy.Publisher('final_path', Path, queue_size=1)

        self.base_waypoints = None
        self.waypoints_2d = None
        self.waypoints_tree = None
        self.pose = None

        rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            
            if self.pose and self.base_waypoints and self.waypoints_tree:
                # get the closest waypoint
                closet_waypoint_index = self.get_closet_waypoint_idx()
                self.publish_waypoints(closet_waypoint_index)
            rate.sleep()

    def pose_cb(self,msg):
        self.pose = msg

    def waypoints_cb(self,waypoints):
        self.base_waypoints = waypoints
        if not self.waypoints_2d:
            self.waypoints_2d = [[waypoint.pose.pose.position.x,waypoint.pose.pose.position.y] for waypoint in self.base_waypoints.waypoints]
            self.waypoints_tree = KDTree(self.waypoints_2d)

    def get_closet_waypoint_idx(self):
        x = self.pose.pose.position.x
        y = self.pose.pose.position.y

        closest_idx = self.waypoints_tree.query([x,y],1)[1]

        return closest_idx
    
    def publish_waypoints(self,closet_waypoint_index):
        # fill in final waypoints to publish
        lane =Lane()
        lane.header = self.base_waypoints.header
        closet_waypoint_index_start = max(0, closet_waypoint_index)
        closet_waypoint_index_end = min(closet_waypoint_index+LOOKAHEAD_WPS, len(self.base_waypoints.waypoints))
        lane.waypoints = self.base_waypoints.waypoints[closet_waypoint_index_start:closet_waypoint_index_end]

        # fill in path for visulization in Rviz
        path = Path()
        path.header.frame_id = "/world"
        for p in lane.waypoints:
            path_element = PoseStamped()
            path_element.pose.position.x = p.pose.pose.position.x
            path_element.pose.position.y = p.pose.pose.position.y
            path.poses.append(path_element)

        self.final_waypoints_pub.publish(lane)
        self.final_path_pub.publish(path)

        if closet_waypoint_index_end == len(self.base_waypoints.waypoints):
            print("final")
            input("11111111")


if __name__=="__main__":
    try:
        WaypointUpdater()
    except rospy.ROSInterruptException:
        rospy.logerr('Could not start waypoint updater node.')
        pass