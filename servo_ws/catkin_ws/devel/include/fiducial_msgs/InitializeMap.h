// Generated by gencpp from file fiducial_msgs/InitializeMap.msg
// DO NOT EDIT!


#ifndef FIDUCIAL_MSGS_MESSAGE_INITIALIZEMAP_H
#define FIDUCIAL_MSGS_MESSAGE_INITIALIZEMAP_H

#include <ros/service_traits.h>


#include <fiducial_msgs/InitializeMapRequest.h>
#include <fiducial_msgs/InitializeMapResponse.h>


namespace fiducial_msgs
{

struct InitializeMap
{

typedef InitializeMapRequest Request;
typedef InitializeMapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct InitializeMap
} // namespace fiducial_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::fiducial_msgs::InitializeMap > {
  static const char* value()
  {
    return "af3be60cc8712d87e234a795a01490e4";
  }

  static const char* value(const ::fiducial_msgs::InitializeMap&) { return value(); }
};

template<>
struct DataType< ::fiducial_msgs::InitializeMap > {
  static const char* value()
  {
    return "fiducial_msgs/InitializeMap";
  }

  static const char* value(const ::fiducial_msgs::InitializeMap&) { return value(); }
};


// service_traits::MD5Sum< ::fiducial_msgs::InitializeMapRequest> should match
// service_traits::MD5Sum< ::fiducial_msgs::InitializeMap >
template<>
struct MD5Sum< ::fiducial_msgs::InitializeMapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::fiducial_msgs::InitializeMap >::value();
  }
  static const char* value(const ::fiducial_msgs::InitializeMapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::fiducial_msgs::InitializeMapRequest> should match
// service_traits::DataType< ::fiducial_msgs::InitializeMap >
template<>
struct DataType< ::fiducial_msgs::InitializeMapRequest>
{
  static const char* value()
  {
    return DataType< ::fiducial_msgs::InitializeMap >::value();
  }
  static const char* value(const ::fiducial_msgs::InitializeMapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::fiducial_msgs::InitializeMapResponse> should match
// service_traits::MD5Sum< ::fiducial_msgs::InitializeMap >
template<>
struct MD5Sum< ::fiducial_msgs::InitializeMapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::fiducial_msgs::InitializeMap >::value();
  }
  static const char* value(const ::fiducial_msgs::InitializeMapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::fiducial_msgs::InitializeMapResponse> should match
// service_traits::DataType< ::fiducial_msgs::InitializeMap >
template<>
struct DataType< ::fiducial_msgs::InitializeMapResponse>
{
  static const char* value()
  {
    return DataType< ::fiducial_msgs::InitializeMap >::value();
  }
  static const char* value(const ::fiducial_msgs::InitializeMapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // FIDUCIAL_MSGS_MESSAGE_INITIALIZEMAP_H
