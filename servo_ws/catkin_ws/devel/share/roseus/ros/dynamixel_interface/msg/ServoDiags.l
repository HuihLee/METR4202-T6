;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_interface::ServoDiags)
  (if (not (find-package "DYNAMIXEL_INTERFACE"))
    (make-package "DYNAMIXEL_INTERFACE"))
  (shadow 'ServoDiags (find-package "DYNAMIXEL_INTERFACE")))
(unless (find-package "DYNAMIXEL_INTERFACE::SERVODIAGS")
  (make-package "DYNAMIXEL_INTERFACE::SERVODIAGS"))

(in-package "ROS")
;;//! \htmlinclude ServoDiags.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dynamixel_interface::ServoDiags
  :super ros::object
  :slots (_header _diagnostics ))

(defmethod dynamixel_interface::ServoDiags
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:diagnostics __diagnostics) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _diagnostics __diagnostics)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:diagnostics
   (&rest __diagnostics)
   (if (keywordp (car __diagnostics))
       (send* _diagnostics __diagnostics)
     (progn
       (if __diagnostics (setq _diagnostics (car __diagnostics)))
       _diagnostics)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; dynamixel_interface/ServoDiag[] _diagnostics
    (apply #'+ (send-all _diagnostics :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; dynamixel_interface/ServoDiag[] _diagnostics
     (write-long (length _diagnostics) s)
     (dolist (elem _diagnostics)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; dynamixel_interface/ServoDiag[] _diagnostics
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _diagnostics (let (r) (dotimes (i n) (push (instance dynamixel_interface::ServoDiag :init) r)) r))
     (dolist (elem- _diagnostics)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dynamixel_interface::ServoDiags :md5sum-) "e0c439c1a732520d1c71cd95240a273a")
(setf (get dynamixel_interface::ServoDiags :datatype-) "dynamixel_interface/ServoDiags")
(setf (get dynamixel_interface::ServoDiags :definition-)
      "Header header
ServoDiag[] diagnostics #array of diagnostics messages for all dynamixels on bus
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
MSG: dynamixel_interface/ServoDiag
string name #name of joint
uint8 id  #id on bus
string model_name #model name
uint8 error_code # error code
float64 voltage #current voltage
float64 temperature #current temperature
")



(provide :dynamixel_interface/ServoDiags "e0c439c1a732520d1c71cd95240a273a")


