// Generated by gencpp from file styx_msgs/NavRequest.msg
// DO NOT EDIT!


#ifndef STYX_MSGS_MESSAGE_NAVREQUEST_H
#define STYX_MSGS_MESSAGE_NAVREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TwistStamped.h>

namespace styx_msgs
{
template <class ContainerAllocator>
struct NavRequest_
{
  typedef NavRequest_<ContainerAllocator> Type;

  NavRequest_()
    : currentTime(0.0)
    , currentPose()
    , currentTwist()  {
    }
  NavRequest_(const ContainerAllocator& _alloc)
    : currentTime(0.0)
    , currentPose(_alloc)
    , currentTwist(_alloc)  {
  (void)_alloc;
    }



   typedef float _currentTime_type;
  _currentTime_type currentTime;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _currentPose_type;
  _currentPose_type currentPose;

   typedef  ::geometry_msgs::TwistStamped_<ContainerAllocator>  _currentTwist_type;
  _currentTwist_type currentTwist;





  typedef boost::shared_ptr< ::styx_msgs::NavRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::styx_msgs::NavRequest_<ContainerAllocator> const> ConstPtr;

}; // struct NavRequest_

typedef ::styx_msgs::NavRequest_<std::allocator<void> > NavRequest;

typedef boost::shared_ptr< ::styx_msgs::NavRequest > NavRequestPtr;
typedef boost::shared_ptr< ::styx_msgs::NavRequest const> NavRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::styx_msgs::NavRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::styx_msgs::NavRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::styx_msgs::NavRequest_<ContainerAllocator1> & lhs, const ::styx_msgs::NavRequest_<ContainerAllocator2> & rhs)
{
  return lhs.currentTime == rhs.currentTime &&
    lhs.currentPose == rhs.currentPose &&
    lhs.currentTwist == rhs.currentTwist;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::styx_msgs::NavRequest_<ContainerAllocator1> & lhs, const ::styx_msgs::NavRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace styx_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::styx_msgs::NavRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::styx_msgs::NavRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::styx_msgs::NavRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::styx_msgs::NavRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::styx_msgs::NavRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::styx_msgs::NavRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::styx_msgs::NavRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "105471b4ec03125dccde71d28fbfdb8e";
  }

  static const char* value(const ::styx_msgs::NavRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x105471b4ec03125dULL;
  static const uint64_t static_value2 = 0xccde71d28fbfdb8eULL;
};

template<class ContainerAllocator>
struct DataType< ::styx_msgs::NavRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "styx_msgs/NavRequest";
  }

  static const char* value(const ::styx_msgs::NavRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::styx_msgs::NavRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Client \n"
"float32 currentTime\n"
"geometry_msgs/PoseStamped currentPose\n"
"geometry_msgs/TwistStamped currentTwist\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseStamped\n"
"# A Pose with reference coordinate frame and timestamp\n"
"Header header\n"
"Pose pose\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/TwistStamped\n"
"# A twist with reference coordinate frame and timestamp\n"
"Header header\n"
"Twist twist\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3  linear\n"
"Vector3  angular\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::styx_msgs::NavRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::styx_msgs::NavRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.currentTime);
      stream.next(m.currentPose);
      stream.next(m.currentTwist);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::styx_msgs::NavRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::styx_msgs::NavRequest_<ContainerAllocator>& v)
  {
    s << indent << "currentTime: ";
    Printer<float>::stream(s, indent + "  ", v.currentTime);
    s << indent << "currentPose: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.currentPose);
    s << indent << "currentTwist: ";
    s << std::endl;
    Printer< ::geometry_msgs::TwistStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.currentTwist);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STYX_MSGS_MESSAGE_NAVREQUEST_H