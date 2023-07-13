// Generated by gencpp from file global_planer/NAV.msg
// DO NOT EDIT!


#ifndef GLOBAL_PLANER_MESSAGE_NAV_H
#define GLOBAL_PLANER_MESSAGE_NAV_H

#include <ros/service_traits.h>


#include <global_planer/NAVRequest.h>
#include <global_planer/NAVResponse.h>


namespace global_planer
{

struct NAV
{

typedef NAVRequest Request;
typedef NAVResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct NAV
} // namespace global_planer


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::global_planer::NAV > {
  static const char* value()
  {
    return "dc45d88fed60392a91694173e2278679";
  }

  static const char* value(const ::global_planer::NAV&) { return value(); }
};

template<>
struct DataType< ::global_planer::NAV > {
  static const char* value()
  {
    return "global_planer/NAV";
  }

  static const char* value(const ::global_planer::NAV&) { return value(); }
};


// service_traits::MD5Sum< ::global_planer::NAVRequest> should match
// service_traits::MD5Sum< ::global_planer::NAV >
template<>
struct MD5Sum< ::global_planer::NAVRequest>
{
  static const char* value()
  {
    return MD5Sum< ::global_planer::NAV >::value();
  }
  static const char* value(const ::global_planer::NAVRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::global_planer::NAVRequest> should match
// service_traits::DataType< ::global_planer::NAV >
template<>
struct DataType< ::global_planer::NAVRequest>
{
  static const char* value()
  {
    return DataType< ::global_planer::NAV >::value();
  }
  static const char* value(const ::global_planer::NAVRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::global_planer::NAVResponse> should match
// service_traits::MD5Sum< ::global_planer::NAV >
template<>
struct MD5Sum< ::global_planer::NAVResponse>
{
  static const char* value()
  {
    return MD5Sum< ::global_planer::NAV >::value();
  }
  static const char* value(const ::global_planer::NAVResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::global_planer::NAVResponse> should match
// service_traits::DataType< ::global_planer::NAV >
template<>
struct DataType< ::global_planer::NAVResponse>
{
  static const char* value()
  {
    return DataType< ::global_planer::NAV >::value();
  }
  static const char* value(const ::global_planer::NAVResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // GLOBAL_PLANER_MESSAGE_NAV_H