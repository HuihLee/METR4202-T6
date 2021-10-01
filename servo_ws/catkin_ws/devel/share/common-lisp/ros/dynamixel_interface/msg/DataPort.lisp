; Auto-generated. Do not edit!


(cl:in-package dynamixel_interface-msg)


;//! \htmlinclude DataPort.msg.html

(cl:defclass <DataPort> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (port_values
    :reader port_values
    :initarg :port_values
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass DataPort (<DataPort>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DataPort>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DataPort)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_interface-msg:<DataPort> is deprecated: use dynamixel_interface-msg:DataPort instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DataPort>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:name-val is deprecated.  Use dynamixel_interface-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'port_values-val :lambda-list '(m))
(cl:defmethod port_values-val ((m <DataPort>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_interface-msg:port_values-val is deprecated.  Use dynamixel_interface-msg:port_values instead.")
  (port_values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DataPort>) ostream)
  "Serializes a message object of type '<DataPort>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'port_values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'port_values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DataPort>) istream)
  "Deserializes a message object of type '<DataPort>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'port_values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'port_values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DataPort>)))
  "Returns string type for a message object of type '<DataPort>"
  "dynamixel_interface/DataPort")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DataPort)))
  "Returns string type for a message object of type 'DataPort"
  "dynamixel_interface/DataPort")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DataPort>)))
  "Returns md5sum for a message object of type '<DataPort>"
  "8b6c6004f40f6ef774b6478f360fb7d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DataPort)))
  "Returns md5sum for a message object of type 'DataPort"
  "8b6c6004f40f6ef774b6478f360fb7d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DataPort>)))
  "Returns full string definition for message of type '<DataPort>"
  (cl:format cl:nil "string name #name of joint~%uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DataPort)))
  "Returns full string definition for message of type 'DataPort"
  (cl:format cl:nil "string name #name of joint~%uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DataPort>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'port_values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DataPort>))
  "Converts a ROS message object to a list"
  (cl:list 'DataPort
    (cl:cons ':name (name msg))
    (cl:cons ':port_values (port_values msg))
))
