; Auto-generated. Do not edit!


(cl:in-package control_logic_node-msg)


;//! \htmlinclude TrajectoryComplete.msg.html

(cl:defclass <TrajectoryComplete> (roslisp-msg-protocol:ros-message)
  ((complete
    :reader complete
    :initarg :complete
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrajectoryComplete (<TrajectoryComplete>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryComplete>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryComplete)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_logic_node-msg:<TrajectoryComplete> is deprecated: use control_logic_node-msg:TrajectoryComplete instead.")))

(cl:ensure-generic-function 'complete-val :lambda-list '(m))
(cl:defmethod complete-val ((m <TrajectoryComplete>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_logic_node-msg:complete-val is deprecated.  Use control_logic_node-msg:complete instead.")
  (complete m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryComplete>) ostream)
  "Serializes a message object of type '<TrajectoryComplete>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'complete) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryComplete>) istream)
  "Deserializes a message object of type '<TrajectoryComplete>"
    (cl:setf (cl:slot-value msg 'complete) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryComplete>)))
  "Returns string type for a message object of type '<TrajectoryComplete>"
  "control_logic_node/TrajectoryComplete")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryComplete)))
  "Returns string type for a message object of type 'TrajectoryComplete"
  "control_logic_node/TrajectoryComplete")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryComplete>)))
  "Returns md5sum for a message object of type '<TrajectoryComplete>"
  "9d8061d2347621a6ed88451e28811cc7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryComplete)))
  "Returns md5sum for a message object of type 'TrajectoryComplete"
  "9d8061d2347621a6ed88451e28811cc7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryComplete>)))
  "Returns full string definition for message of type '<TrajectoryComplete>"
  (cl:format cl:nil "bool complete~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryComplete)))
  "Returns full string definition for message of type 'TrajectoryComplete"
  (cl:format cl:nil "bool complete~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryComplete>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryComplete>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryComplete
    (cl:cons ':complete (complete msg))
))
