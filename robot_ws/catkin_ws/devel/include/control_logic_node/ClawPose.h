// Generated by gencpp from file control_logic_node/ClawPose.msg
// DO NOT EDIT!


#ifndef CONTROL_LOGIC_NODE_MESSAGE_CLAWPOSE_H
#define CONTROL_LOGIC_NODE_MESSAGE_CLAWPOSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace control_logic_node
{
template <class ContainerAllocator>
struct ClawPose_
{
  typedef ClawPose_<ContainerAllocator> Type;

  ClawPose_()
    : position()  {
      position.assign(0.0);
  }
  ClawPose_(const ContainerAllocator& _alloc)
    : position()  {
  (void)_alloc;
      position.assign(0.0);
  }



   typedef boost::array<float, 4>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::control_logic_node::ClawPose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::control_logic_node::ClawPose_<ContainerAllocator> const> ConstPtr;

}; // struct ClawPose_

typedef ::control_logic_node::ClawPose_<std::allocator<void> > ClawPose;

typedef boost::shared_ptr< ::control_logic_node::ClawPose > ClawPosePtr;
typedef boost::shared_ptr< ::control_logic_node::ClawPose const> ClawPoseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::control_logic_node::ClawPose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::control_logic_node::ClawPose_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::control_logic_node::ClawPose_<ContainerAllocator1> & lhs, const ::control_logic_node::ClawPose_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::control_logic_node::ClawPose_<ContainerAllocator1> & lhs, const ::control_logic_node::ClawPose_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace control_logic_node

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::control_logic_node::ClawPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_logic_node::ClawPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_logic_node::ClawPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_logic_node::ClawPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_logic_node::ClawPose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_logic_node::ClawPose_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::control_logic_node::ClawPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "63a407737199add49d16d66d097d869e";
  }

  static const char* value(const ::control_logic_node::ClawPose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x63a407737199add4ULL;
  static const uint64_t static_value2 = 0x9d16d66d097d869eULL;
};

template<class ContainerAllocator>
struct DataType< ::control_logic_node::ClawPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "control_logic_node/ClawPose";
  }

  static const char* value(const ::control_logic_node::ClawPose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::control_logic_node::ClawPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[4] position \n"
;
  }

  static const char* value(const ::control_logic_node::ClawPose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::control_logic_node::ClawPose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ClawPose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::control_logic_node::ClawPose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::control_logic_node::ClawPose_<ContainerAllocator>& v)
  {
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.position[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROL_LOGIC_NODE_MESSAGE_CLAWPOSE_H
