#!/usr/bin/env python



import rospy
import tf2_ros
from geometry_msgs.msg import PoseStamped,TransformStamped


class transform_publisher():
    """
    This class create a subscriber and a broadcaster.
    The subscriber receives center_pose msgs from gazebo.
    The tf broadcaster send a tf of base_link and world.
    """
    def __init__(self) -> None:
        rospy.init_node("transform_publisher")
        rospy.Subscriber("/smart/center_pose",PoseStamped,self.pose_cb, queue_size=1)

        rospy.spin()


    def pose_cb(self,msg):
        pose = msg.pose.position
        orientation = msg.pose.orientation
        br = tf2_ros.TransformBroadcaster()

        tf_stamped = TransformStamped()
        tf_stamped.header.frame_id = "world"
        tf_stamped.header.stamp = rospy.Time.now()

        tf_stamped.child_frame_id = "base_link"
        tf_stamped.transform.translation.x = pose.x
        tf_stamped.transform.translation.y = pose.y
        tf_stamped.transform.translation.z = pose.z
        tf_stamped.transform.rotation.x = orientation.x
        tf_stamped.transform.rotation.y = orientation.y
        tf_stamped.transform.rotation.z = orientation.z
        tf_stamped.transform.rotation.w = orientation.w
        br.sendTransform(tf_stamped)


if __name__ == "__main__":
    try:
        transform_publisher();
    except:
        rospy.logwarn("cannot start transform publisher")