// Generated by gencpp from file control_logic_node/TrajectoryComplete.msg
// DO NOT EDIT!


#ifndef CONTROL_LOGIC_NODE_MESSAGE_TRAJECTORYCOMPLETE_H
#define CONTROL_LOGIC_NODE_MESSAGE_TRAJECTORYCOMPLETE_H


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
struct TrajectoryComplete_
{
  typedef TrajectoryComplete_<ContainerAllocator> Type;

  TrajectoryComplete_()
    : complete(false)  {
    }
  TrajectoryComplete_(const ContainerAllocator& _alloc)
    : complete(false)  {
  (void)_alloc;
    }



   typedef uint8_t _complete_type;
  _complete_type complete;





  typedef boost::shared_ptr< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> const> ConstPtr;

}; // struct TrajectoryComplete_

typedef ::control_logic_node::TrajectoryComplete_<std::allocator<void> > TrajectoryComplete;

typedef boost::shared_ptr< ::control_logic_node::TrajectoryComplete > TrajectoryCompletePtr;
typedef boost::shared_ptr< ::control_logic_node::TrajectoryComplete const> TrajectoryCompleteConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::control_logic_node::TrajectoryComplete_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::control_logic_node::TrajectoryComplete_<ContainerAllocator1> & lhs, const ::control_logic_node::TrajectoryComplete_<ContainerAllocator2> & rhs)
{
  return lhs.complete == rhs.complete;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::control_logic_node::TrajectoryComplete_<ContainerAllocator1> & lhs, const ::control_logic_node::TrajectoryComplete_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace control_logic_node

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9d8061d2347621a6ed88451e28811cc7";
  }

  static const char* value(const ::control_logic_node::TrajectoryComplete_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9d8061d2347621a6ULL;
  static const uint64_t static_value2 = 0xed88451e28811cc7ULL;
};

template<class ContainerAllocator>
struct DataType< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
{
  static const char* value()
  {
    return "control_logic_node/TrajectoryComplete";
  }

  static const char* value(const ::control_logic_node::TrajectoryComplete_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool complete\n"
;
  }

  static const char* value(const ::control_logic_node::TrajectoryComplete_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.complete);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TrajectoryComplete_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::control_logic_node::TrajectoryComplete_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::control_logic_node::TrajectoryComplete_<ContainerAllocator>& v)
  {
    s << indent << "complete: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.complete);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROL_LOGIC_NODE_MESSAGE_TRAJECTORYCOMPLETE_H
