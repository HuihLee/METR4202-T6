; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude DesPosition.msg.html

(cl:defclass <DesPosition> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (orientation_z
    :reader orientation_z
    :initarg :orientation_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass DesPosition (<DesPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<DesPosition> is deprecated: use control_logic_node-msg:DesPosition instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <DesPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:position-val is deprecated.  Use control_logic_node-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation_z-val :lambda-list '(m))
(cl:defmethod orientation_z-val ((m <DesPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:orientation_z-val is deprecated.  Use control_logic_node-msg:orientation_z instead.")
  (orientation_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesPosition>) ostream)
  "Serializes a message object of type '<DesPosition>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orientation_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesPosition>) istream)
  "Deserializes a message object of type '<DesPosition>"
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orientation_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesPosition>)))
  "Returns string type for a message object of type '<DesPosition>"
  "control_logic_node/DesPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesPosition)))
  "Returns string type for a message object of type 'DesPosition"
  "control_logic_node/DesPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesPosition>)))
  "Returns md5sum for a message object of type '<DesPosition>"
  "0e2aade9b104799c49e86da7da995598")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesPosition)))
  "Returns md5sum for a message object of type 'DesPosition"
  "0e2aade9b104799c49e86da7da995598")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesPosition>)))
  "Returns full string definition for message of type '<DesPosition>"
  (cl:format cl:nil "float32[3] position~%float32 orientation_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesPosition)))
  "Returns full string definition for message of type 'DesPosition"
  (cl:format cl:nil "float32[3] position~%float32 orientation_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesPosition>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'DesPosition
    (cl:cons ':position (position msg))
    (cl:cons ':orientation_z (orientation_z msg))
))
