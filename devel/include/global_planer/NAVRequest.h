// Generated by gencpp from file global_planer/NAVRequest.msg
// DO NOT EDIT!


#ifndef GLOBAL_PLANER_MESSAGE_NAVREQUEST_H
#define GLOBAL_PLANER_MESSAGE_NAVREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>

namespace global_planer
{
template <class ContainerAllocator>
struct NAVRequest_
{
  typedef NAVRequest_<ContainerAllocator> Type;

  NAVRequest_()
    : currentTime(0)
    , pose()  {
    }
  NAVRequest_(const ContainerAllocator& _alloc)
    : currentTime(0)
    , pose(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _currentTime_type;
  _currentTime_type currentTime;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _pose_type;
  _pose_type pose;





  typedef boost::shared_ptr< ::global_planer::NAVRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::global_planer::NAVRequest_<ContainerAllocator> const> ConstPtr;

}; // struct NAVRequest_

typedef ::global_planer::NAVRequest_<std::allocator<void> > NAVRequest;

typedef boost::shared_ptr< ::global_planer::NAVRequest > NAVRequestPtr;
typedef boost::shared_ptr< ::global_planer::NAVRequest const> NAVRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::global_planer::NAVRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::global_planer::NAVRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::global_planer::NAVRequest_<ContainerAllocator1> & lhs, const ::global_planer::NAVRequest_<ContainerAllocator2> & rhs)
{
  return lhs.currentTime == rhs.currentTime &&
    lhs.pose == rhs.pose;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::global_planer::NAVRequest_<ContainerAllocator1> & lhs, const ::global_planer::NAVRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace global_planer

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::global_planer::NAVRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::global_planer::NAVRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::global_planer::NAVRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::global_planer::NAVRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::global_planer::NAVRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::global_planer::NAVRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::global_planer::NAVRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "37c6ae066e99ce621e10b6cb77f6217f";
  }

  static const char* value(const ::global_planer::NAVRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x37c6ae066e99ce62ULL;
  static const uint64_t static_value2 = 0x1e10b6cb77f6217fULL;
};

template<class ContainerAllocator>
struct DataType< ::global_planer::NAVRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "global_planer/NAVRequest";
  }

  static const char* value(const ::global_planer::NAVRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::global_planer::NAVRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Client \n"
"int32 currentTime\n"
"geometry_msgs/PoseStamped pose\n"
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
;
  }

  static const char* value(const ::global_planer::NAVRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::global_planer::NAVRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.currentTime);
      stream.next(m.pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NAVRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::global_planer::NAVRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::global_planer::NAVRequest_<ContainerAllocator>& v)
  {
    s << indent << "currentTime: ";
    Printer<int32_t>::stream(s, indent + "  ", v.currentTime);
    s << indent << "pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GLOBAL_PLANER_MESSAGE_NAVREQUEST_H