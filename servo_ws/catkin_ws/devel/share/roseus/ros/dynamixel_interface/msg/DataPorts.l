;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_interface::DataPorts)
  (if (not (find-package "DYNAMIXEL_INTERFACE"))
    (make-package "DYNAMIXEL_INTERFACE"))
  (shadow 'DataPorts (find-package "DYNAMIXEL_INTERFACE")))
(unless (find-package "DYNAMIXEL_INTERFACE::DATAPORTS")
  (make-package "DYNAMIXEL_INTERFACE::DATAPORTS"))

(in-package "ROS")
;;//! \htmlinclude DataPorts.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dynamixel_interface::DataPorts
  :super ros::object
  :slots (_header _states ))

(defmethod dynamixel_interface::DataPorts
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:states __states) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _states __states)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:states
   (&rest __states)
   (if (keywordp (car __states))
       (send* _states __states)
     (progn
       (if __states (setq _states (car __states)))
       _states)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; dynamixel_interface/DataPort[] _states
    (apply #'+ (send-all _states :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; dynamixel_interface/DataPort[] _states
     (write-long (length _states) s)
     (dolist (elem _states)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; dynamixel_interface/DataPort[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (let (r) (dotimes (i n) (push (instance dynamixel_interface::DataPort :init) r)) r))
     (dolist (elem- _states)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dynamixel_interface::DataPorts :md5sum-) "919597efe48a88349da09d8f46847ef6")
(setf (get dynamixel_interface::DataPorts :datatype-) "dynamixel_interface/DataPorts")
(setf (get dynamixel_interface::DataPorts :definition-)
      "Header header
DataPort[] states #array of Dataport messages for all dynamixels on bus
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: dynamixel_interface/DataPort
string name #name of joint
uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog
")



(provide :dynamixel_interface/DataPorts "919597efe48a88349da09d8f46847ef6")


