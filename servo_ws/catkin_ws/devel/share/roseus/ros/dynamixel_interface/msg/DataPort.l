;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_interface::DataPort)
  (if (not (find-package "DYNAMIXEL_INTERFACE"))
    (make-package "DYNAMIXEL_INTERFACE"))
  (shadow 'DataPort (find-package "DYNAMIXEL_INTERFACE")))
(unless (find-package "DYNAMIXEL_INTERFACE::DATAPORT")
  (make-package "DYNAMIXEL_INTERFACE::DATAPORT"))

(in-package "ROS")
;;//! \htmlinclude DataPort.msg.html


(defclass dynamixel_interface::DataPort
  :super ros::object
  :slots (_name _port_values ))

(defmethod dynamixel_interface::DataPort
  (:init
   (&key
    ((:name __name) "")
    ((:port_values __port_values) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _port_values __port_values)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:port_values
   (&optional __port_values)
   (if __port_values (setq _port_values __port_values)) _port_values)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint16[] _port_values
    (* 2    (length _port_values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint16[] _port_values
     (write-long (length _port_values) s)
     (dotimes (i (length _port_values))
       (write-word (elt _port_values i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16[] _port_values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _port_values (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _port_values i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get dynamixel_interface::DataPort :md5sum-) "8b6c6004f40f6ef774b6478f360fb7d1")
(setf (get dynamixel_interface::DataPort :datatype-) "dynamixel_interface/DataPort")
(setf (get dynamixel_interface::DataPort :definition-)
      "string name #name of joint
uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog
")



(provide :dynamixel_interface/DataPort "8b6c6004f40f6ef774b6478f360fb7d1")


