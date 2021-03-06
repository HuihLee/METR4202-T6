// Generated by gencpp from file ximea_ros_cam/XiImageInfo.msg
// DO NOT EDIT!


#ifndef XIMEA_ROS_CAM_MESSAGE_XIIMAGEINFO_H
#define XIMEA_ROS_CAM_MESSAGE_XIIMAGEINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace ximea_ros_cam
{
template <class ContainerAllocator>
struct XiImageInfo_
{
  typedef XiImageInfo_<ContainerAllocator> Type;

  XiImageInfo_()
    : header()
    , size(0)
    , bp_size(0)
    , frm(0)
    , width(0)
    , height(0)
    , nframe(0)
    , tsSec(0)
    , tsUSec(0)
    , GPI_level(0)
    , black_level(0)
    , padding_x(0)
    , AbsoluteOffsetX(0)
    , AbsoluteOffsetY(0)
    , exposure_time_us(0)
    , gain_db(0.0)
    , acq_nframe(0)
    , image_user_data(0)  {
    }
  XiImageInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , size(0)
    , bp_size(0)
    , frm(0)
    , width(0)
    , height(0)
    , nframe(0)
    , tsSec(0)
    , tsUSec(0)
    , GPI_level(0)
    , black_level(0)
    , padding_x(0)
    , AbsoluteOffsetX(0)
    , AbsoluteOffsetY(0)
    , exposure_time_us(0)
    , gain_db(0.0)
    , acq_nframe(0)
    , image_user_data(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _size_type;
  _size_type size;

   typedef uint32_t _bp_size_type;
  _bp_size_type bp_size;

   typedef uint32_t _frm_type;
  _frm_type frm;

   typedef uint32_t _width_type;
  _width_type width;

   typedef uint32_t _height_type;
  _height_type height;

   typedef uint32_t _nframe_type;
  _nframe_type nframe;

   typedef uint32_t _tsSec_type;
  _tsSec_type tsSec;

   typedef uint32_t _tsUSec_type;
  _tsUSec_type tsUSec;

   typedef uint32_t _GPI_level_type;
  _GPI_level_type GPI_level;

   typedef uint32_t _black_level_type;
  _black_level_type black_level;

   typedef uint32_t _padding_x_type;
  _padding_x_type padding_x;

   typedef uint32_t _AbsoluteOffsetX_type;
  _AbsoluteOffsetX_type AbsoluteOffsetX;

   typedef uint32_t _AbsoluteOffsetY_type;
  _AbsoluteOffsetY_type AbsoluteOffsetY;

   typedef uint32_t _exposure_time_us_type;
  _exposure_time_us_type exposure_time_us;

   typedef float _gain_db_type;
  _gain_db_type gain_db;

   typedef uint32_t _acq_nframe_type;
  _acq_nframe_type acq_nframe;

   typedef uint32_t _image_user_data_type;
  _image_user_data_type image_user_data;





  typedef boost::shared_ptr< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> const> ConstPtr;

}; // struct XiImageInfo_

typedef ::ximea_ros_cam::XiImageInfo_<std::allocator<void> > XiImageInfo;

typedef boost::shared_ptr< ::ximea_ros_cam::XiImageInfo > XiImageInfoPtr;
typedef boost::shared_ptr< ::ximea_ros_cam::XiImageInfo const> XiImageInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator1> & lhs, const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.size == rhs.size &&
    lhs.bp_size == rhs.bp_size &&
    lhs.frm == rhs.frm &&
    lhs.width == rhs.width &&
    lhs.height == rhs.height &&
    lhs.nframe == rhs.nframe &&
    lhs.tsSec == rhs.tsSec &&
    lhs.tsUSec == rhs.tsUSec &&
    lhs.GPI_level == rhs.GPI_level &&
    lhs.black_level == rhs.black_level &&
    lhs.padding_x == rhs.padding_x &&
    lhs.AbsoluteOffsetX == rhs.AbsoluteOffsetX &&
    lhs.AbsoluteOffsetY == rhs.AbsoluteOffsetY &&
    lhs.exposure_time_us == rhs.exposure_time_us &&
    lhs.gain_db == rhs.gain_db &&
    lhs.acq_nframe == rhs.acq_nframe &&
    lhs.image_user_data == rhs.image_user_data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator1> & lhs, const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ximea_ros_cam

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1e504126cf849c6656990d903d08e2ea";
  }

  static const char* value(const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1e504126cf849c66ULL;
  static const uint64_t static_value2 = 0x56990d903d08e2eaULL;
};

template<class ContainerAllocator>
struct DataType< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ximea_ros_cam/XiImageInfo";
  }

  static const char* value(const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"uint32 size\n"
"uint32 bp_size\n"
"uint32 frm\n"
"uint32 width\n"
"uint32 height\n"
"uint32 nframe\n"
"uint32 tsSec\n"
"uint32 tsUSec\n"
"uint32 GPI_level\n"
"uint32 black_level\n"
"uint32 padding_x\n"
"uint32 AbsoluteOffsetX\n"
"uint32 AbsoluteOffsetY\n"
"uint32 exposure_time_us\n"
"float32 gain_db\n"
"uint32 acq_nframe\n"
"uint32 image_user_data\n"
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
;
  }

  static const char* value(const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.size);
      stream.next(m.bp_size);
      stream.next(m.frm);
      stream.next(m.width);
      stream.next(m.height);
      stream.next(m.nframe);
      stream.next(m.tsSec);
      stream.next(m.tsUSec);
      stream.next(m.GPI_level);
      stream.next(m.black_level);
      stream.next(m.padding_x);
      stream.next(m.AbsoluteOffsetX);
      stream.next(m.AbsoluteOffsetY);
      stream.next(m.exposure_time_us);
      stream.next(m.gain_db);
      stream.next(m.acq_nframe);
      stream.next(m.image_user_data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct XiImageInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ximea_ros_cam::XiImageInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ximea_ros_cam::XiImageInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "size: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.size);
    s << indent << "bp_size: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.bp_size);
    s << indent << "frm: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.frm);
    s << indent << "width: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.width);
    s << indent << "height: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.height);
    s << indent << "nframe: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.nframe);
    s << indent << "tsSec: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.tsSec);
    s << indent << "tsUSec: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.tsUSec);
    s << indent << "GPI_level: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.GPI_level);
    s << indent << "black_level: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.black_level);
    s << indent << "padding_x: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.padding_x);
    s << indent << "AbsoluteOffsetX: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.AbsoluteOffsetX);
    s << indent << "AbsoluteOffsetY: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.AbsoluteOffsetY);
    s << indent << "exposure_time_us: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.exposure_time_us);
    s << indent << "gain_db: ";
    Printer<float>::stream(s, indent + "  ", v.gain_db);
    s << indent << "acq_nframe: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.acq_nframe);
    s << indent << "image_user_data: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.image_user_data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // XIMEA_ROS_CAM_MESSAGE_XIIMAGEINFO_H
