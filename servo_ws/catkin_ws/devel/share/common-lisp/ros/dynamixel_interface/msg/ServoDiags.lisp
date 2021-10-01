; Auto-generated. Do not edit!


(cl:in-package dynamixel_interface-msg)


;//! \htmlinclude ServoDiags.msg.html

(cl:defclass <ServoDiags> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (diagnostics
    :reader diagnostics
    :initarg :diagnostics
    :type (cl:vector dynamixel_interface-msg:ServoDiag)
   :initform (cl:make-array 0 :element-type 'dynamixel_interface-msg:ServoDiag :initial-element (cl:make-instance 'dynamixel_interface-msg:ServoDiag))))
)

(cl:defclass ServoDiags (<ServoDiags>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServoDiags>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServoDiags)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_interface-msg:<ServoDiags> is deprecated: use dynamixel_interface-msg:ServoDiags instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ServoDiags>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:header-val is deprecated.  Use dynamixel_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'diagnostics-val :lambda-list '(m))
(cl:defmethod diagnostics-val ((m <ServoDiags>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:diagnostics-val is deprecated.  Use dynamixel_interface-msg:diagnostics instead.")
  (diagnostics m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServoDiags>) ostream)
  "Serializes a message object of type '<ServoDiags>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'diagnostics))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'diagnostics))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServoDiags>) istream)
  "Deserializes a message object of type '<ServoDiags>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'diagnostics) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'diagnostics)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dynamixel_interface-msg:ServoDiag))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServoDiags>)))
  "Returns string type for a message object of type '<ServoDiags>"
  "dynamixel_interface/ServoDiags")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServoDiags)))
  "Returns string type for a message object of type 'ServoDiags"
  "dynamixel_interface/ServoDiags")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServoDiags>)))
  "Returns md5sum for a message object of type '<ServoDiags>"
  "e0c439c1a732520d1c71cd95240a273a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServoDiags)))
  "Returns md5sum for a message object of type 'ServoDiags"
  "e0c439c1a732520d1c71cd95240a273a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServoDiags>)))
  "Returns full string definition for message of type '<ServoDiags>"
  (cl:format cl:nil "Header header~%ServoDiag[] diagnostics #array of diagnostics messages for all dynamixels on bus~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamixel_interface/ServoDiag~%string name #name of joint~%uint8 id  #id on bus~%string model_name #model name~%uint8 error_code # error code~%float64 voltage #current voltage~%float64 temperature #current temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServoDiags)))
  "Returns full string definition for message of type 'ServoDiags"
  (cl:format cl:nil "Header header~%ServoDiag[] diagnostics #array of diagnostics messages for all dynamixels on bus~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamixel_interface/ServoDiag~%string name #name of joint~%uint8 id  #id on bus~%string model_name #model name~%uint8 error_code # error code~%float64 voltage #current voltage~%float64 temperature #current temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServoDiags>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'diagnostics) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServoDiags>))
  "Converts a ROS message object to a list"
  (cl:list 'ServoDiags
    (cl:cons ':header (header msg))
    (cl:cons ':diagnostics (diagnostics msg))
))
