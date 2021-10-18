; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude DesJointState.msg.html

(cl:defclass <DesJointState> (roslisp-msg-protocol:ros-message)
  ((thetas
    :reader thetas
    :initarg :thetas
    :type (cl:vector cl:float)
   :initform (cl:make-array 5 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass DesJointState (<DesJointState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesJointState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesJointState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<DesJointState> is deprecated: use control_logic_node-msg:DesJointState instead.")))

(cl:ensure-generic-function 'thetas-val :lambda-list '(m))
(cl:defmethod thetas-val ((m <DesJointState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:thetas-val is deprecated.  Use control_logic_node-msg:thetas instead.")
  (thetas m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesJointState>) ostream)
  "Serializes a message object of type '<DesJointState>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'thetas))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesJointState>) istream)
  "Deserializes a message object of type '<DesJointState>"
  (cl:setf (cl:slot-value msg 'thetas) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'thetas)))
    (cl:dotimes (i 5)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesJointState>)))
  "Returns string type for a message object of type '<DesJointState>"
  "control_logic_node/DesJointState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesJointState)))
  "Returns string type for a message object of type 'DesJointState"
  "control_logic_node/DesJointState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesJointState>)))
  "Returns md5sum for a message object of type '<DesJointState>"
  "dcf2dca9789fea2e3dbb6efc5dedb2ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesJointState)))
  "Returns md5sum for a message object of type 'DesJointState"
  "dcf2dca9789fea2e3dbb6efc5dedb2ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesJointState>)))
  "Returns full string definition for message of type '<DesJointState>"
  (cl:format cl:nil "float32[5] thetas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesJointState)))
  "Returns full string definition for message of type 'DesJointState"
  (cl:format cl:nil "float32[5] thetas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesJointState>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'thetas) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesJointState>))
  "Converts a ROS message object to a list"
  (cl:list 'DesJointState
    (cl:cons ':thetas (thetas msg))
))
