; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude CubePose.msg.html

(cl:defclass <CubePose> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (colour
    :reader colour
    :initarg :colour
    :type cl:string
    :initform ""))
)

(cl:defclass CubePose (<CubePose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CubePose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CubePose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<CubePose> is deprecated: use control_logic_node-msg:CubePose instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <CubePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:position-val is deprecated.  Use control_logic_node-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'colour-val :lambda-list '(m))
(cl:defmethod colour-val ((m <CubePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:colour-val is deprecated.  Use control_logic_node-msg:colour instead.")
  (colour m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CubePose>) ostream)
  "Serializes a message object of type '<CubePose>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'colour))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'colour))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CubePose>) istream)
  "Deserializes a message object of type '<CubePose>"
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'colour) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'colour) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CubePose>)))
  "Returns string type for a message object of type '<CubePose>"
  "control_logic_node/CubePose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CubePose)))
  "Returns string type for a message object of type 'CubePose"
  "control_logic_node/CubePose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CubePose>)))
  "Returns md5sum for a message object of type '<CubePose>"
  "7da6dd3707216b2a7871c249c47975fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CubePose)))
  "Returns md5sum for a message object of type 'CubePose"
  "7da6dd3707216b2a7871c249c47975fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CubePose>)))
  "Returns full string definition for message of type '<CubePose>"
  (cl:format cl:nil "float32[4] position ~%string colour~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CubePose)))
  "Returns full string definition for message of type 'CubePose"
  (cl:format cl:nil "float32[4] position ~%string colour~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CubePose>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'colour))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CubePose>))
  "Converts a ROS message object to a list"
  (cl:list 'CubePose
    (cl:cons ':position (position msg))
    (cl:cons ':colour (colour msg))
))
