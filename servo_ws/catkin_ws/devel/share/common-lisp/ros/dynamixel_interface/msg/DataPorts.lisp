; Auto-generated. Do not edit!


(cl:in-package dynamixel_interface-msg)


;//! \htmlinclude DataPorts.msg.html

(cl:defclass <DataPorts> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (states
    :reader states
    :initarg :states
    :type (cl:vector dynamixel_interface-msg:DataPort)
   :initform (cl:make-array 0 :element-type 'dynamixel_interface-msg:DataPort :initial-element (cl:make-instance 'dynamixel_interface-msg:DataPort))))
)

(cl:defclass DataPorts (<DataPorts>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataPorts>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataPorts)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_interface-msg:<DataPorts> is deprecated: use dynamixel_interface-msg:DataPorts instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DataPorts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:header-val is deprecated.  Use dynamixel_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <DataPorts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:states-val is deprecated.  Use dynamixel_interface-msg:states instead.")
  (states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataPorts>) ostream)
  "Serializes a message object of type '<DataPorts>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataPorts>) istream)
  "Deserializes a message object of type '<DataPorts>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dynamixel_interface-msg:DataPort))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataPorts>)))
  "Returns string type for a message object of type '<DataPorts>"
  "dynamixel_interface/DataPorts")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataPorts)))
  "Returns string type for a message object of type 'DataPorts"
  "dynamixel_interface/DataPorts")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataPorts>)))
  "Returns md5sum for a message object of type '<DataPorts>"
  "919597efe48a88349da09d8f46847ef6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataPorts)))
  "Returns md5sum for a message object of type 'DataPorts"
  "919597efe48a88349da09d8f46847ef6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataPorts>)))
  "Returns full string definition for message of type '<DataPorts>"
  (cl:format cl:nil "Header header~%DataPort[] states #array of Dataport messages for all dynamixels on bus~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamixel_interface/DataPort~%string name #name of joint~%uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataPorts)))
  "Returns full string definition for message of type 'DataPorts"
  (cl:format cl:nil "Header header~%DataPort[] states #array of Dataport messages for all dynamixels on bus~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamixel_interface/DataPort~%string name #name of joint~%uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataPorts>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataPorts>))
  "Converts a ROS message object to a list"
  (cl:list 'DataPorts
    (cl:cons ':header (header msg))
    (cl:cons ':states (states msg))
))
