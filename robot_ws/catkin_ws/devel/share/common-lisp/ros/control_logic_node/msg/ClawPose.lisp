; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude ClawPose.msg.html

(cl:defclass <ClawPose> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ClawPose (<ClawPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClawPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClawPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<ClawPose> is deprecated: use control_logic_node-msg:ClawPose instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <ClawPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:position-val is deprecated.  Use control_logic_node-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClawPose>) ostream)
  "Serializes a message object of type '<ClawPose>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClawPose>) istream)
  "Deserializes a message object of type '<ClawPose>"
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClawPose>)))
  "Returns string type for a message object of type '<ClawPose>"
  "control_logic_node/ClawPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClawPose)))
  "Returns string type for a message object of type 'ClawPose"
  "control_logic_node/ClawPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClawPose>)))
  "Returns md5sum for a message object of type '<ClawPose>"
  "63a407737199add49d16d66d097d869e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClawPose)))
  "Returns md5sum for a message object of type 'ClawPose"
  "63a407737199add49d16d66d097d869e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClawPose>)))
  "Returns full string definition for message of type '<ClawPose>"
  (cl:format cl:nil "float32[4] position ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClawPose)))
  "Returns full string definition for message of type 'ClawPose"
  (cl:format cl:nil "float32[4] position ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClawPose>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClawPose>))
  "Converts a ROS message object to a list"
  (cl:list 'ClawPose
    (cl:cons ':position (position msg))
))
