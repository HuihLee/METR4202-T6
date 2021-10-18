; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude TargetJointStateTrajectory.msg.html

(cl:defclass <TargetJointStateTrajectory> (roslisp-msg-protocol:ros-message)
  ((thetasTarget
    :reader thetasTarget
    :initarg :thetasTarget
    :type (cl:vector cl:float)
   :initform (cl:make-array 5 :element-type 'cl:float :initial-element 0.0))
   (thetasCurrent
    :reader thetasCurrent
    :initarg :thetasCurrent
    :type (cl:vector cl:float)
   :initform (cl:make-array 5 :element-type 'cl:float :initial-element 0.0))
   (motionDuration
    :reader motionDuration
    :initarg :motionDuration
    :type cl:float
    :initform 0.0))
)

(cl:defclass TargetJointStateTrajectory (<TargetJointStateTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetJointStateTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetJointStateTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<TargetJointStateTrajectory> is deprecated: use control_logic_node-msg:TargetJointStateTrajectory instead.")))

(cl:ensure-generic-function 'thetasTarget-val :lambda-list '(m))
(cl:defmethod thetasTarget-val ((m <TargetJointStateTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:thetasTarget-val is deprecated.  Use control_logic_node-msg:thetasTarget instead.")
  (thetasTarget m))

(cl:ensure-generic-function 'thetasCurrent-val :lambda-list '(m))
(cl:defmethod thetasCurrent-val ((m <TargetJointStateTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:thetasCurrent-val is deprecated.  Use control_logic_node-msg:thetasCurrent instead.")
  (thetasCurrent m))

(cl:ensure-generic-function 'motionDuration-val :lambda-list '(m))
(cl:defmethod motionDuration-val ((m <TargetJointStateTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:motionDuration-val is deprecated.  Use control_logic_node-msg:motionDuration instead.")
  (motionDuration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetJointStateTrajectory>) ostream)
  "Serializes a message object of type '<TargetJointStateTrajectory>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'thetasTarget))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'thetasCurrent))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'motionDuration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetJointStateTrajectory>) istream)
  "Deserializes a message object of type '<TargetJointStateTrajectory>"
  (cl:setf (cl:slot-value msg 'thetasTarget) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'thetasTarget)))
    (cl:dotimes (i 5)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'thetasCurrent) (cl:make-array 5))
  (cl:let ((vals (cl:slot-value msg 'thetasCurrent)))
    (cl:dotimes (i 5)
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
    (cl:setf (cl:slot-value msg 'motionDuration) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetJointStateTrajectory>)))
  "Returns string type for a message object of type '<TargetJointStateTrajectory>"
  "control_logic_node/TargetJointStateTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetJointStateTrajectory)))
  "Returns string type for a message object of type 'TargetJointStateTrajectory"
  "control_logic_node/TargetJointStateTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetJointStateTrajectory>)))
  "Returns md5sum for a message object of type '<TargetJointStateTrajectory>"
  "c4cbd25bd8b636d456c17a3edf6fce06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetJointStateTrajectory)))
  "Returns md5sum for a message object of type 'TargetJointStateTrajectory"
  "c4cbd25bd8b636d456c17a3edf6fce06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetJointStateTrajectory>)))
  "Returns full string definition for message of type '<TargetJointStateTrajectory>"
  (cl:format cl:nil "float32[5] thetasTarget~%float32[5] thetasCurrent~%float32 motionDuration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetJointStateTrajectory)))
  "Returns full string definition for message of type 'TargetJointStateTrajectory"
  (cl:format cl:nil "float32[5] thetasTarget~%float32[5] thetasCurrent~%float32 motionDuration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetJointStateTrajectory>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'thetasTarget) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'thetasCurrent) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetJointStateTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetJointStateTrajectory
    (cl:cons ':thetasTarget (thetasTarget msg))
    (cl:cons ':thetasCurrent (thetasCurrent msg))
    (cl:cons ':motionDuration (motionDuration msg))
))
