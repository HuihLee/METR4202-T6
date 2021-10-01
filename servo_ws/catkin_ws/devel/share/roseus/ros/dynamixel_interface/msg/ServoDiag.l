;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_interface::ServoDiag)
  (if (not (find-package "DYNAMIXEL_INTERFACE"))
    (make-package "DYNAMIXEL_INTERFACE"))
  (shadow 'ServoDiag (find-package "DYNAMIXEL_INTERFACE")))
(unless (find-package "DYNAMIXEL_INTERFACE::SERVODIAG")
  (make-package "DYNAMIXEL_INTERFACE::SERVODIAG"))

(in-package "ROS")
;;//! \htmlinclude ServoDiag.msg.html


(defclass dynamixel_interface::ServoDiag
  :super ros::object
  :slots (_name _id _model_name _error_code _voltage _temperature ))

(defmethod dynamixel_interface::ServoDiag
  (:init
   (&key
    ((:name __name) "")
    ((:id __id) 0)
    ((:model_name __model_name) "")
    ((:error_code __error_code) 0)
    ((:voltage __voltage) 0.0)
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _id (round __id))
   (setq _model_name (string __model_name))
   (setq _error_code (round __error_code))
   (setq _voltage (float __voltage))
   (setq _temperature (float __temperature))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint8 _id
    1
    ;; string _model_name
    4 (length _model_name)
    ;; uint8 _error_code
    1
    ;; float64 _voltage
    8
    ;; float64 _temperature
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint8 _id
       (write-byte _id s)
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;; float64 _voltage
       (sys::poke _voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _voltage
     (setq _voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _temperature
     (setq _temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get dynamixel_interface::ServoDiag :md5sum-) "48b049f9561095b33c05b6a03bd01ae5")
(setf (get dynamixel_interface::ServoDiag :datatype-) "dynamixel_interface/ServoDiag")
(setf (get dynamixel_interface::ServoDiag :definition-)
      "string name #name of joint
uint8 id  #id on bus
string model_name #model name
uint8 error_code # error code
float64 voltage #current voltage
float64 temperature #current temperature
")



(provide :dynamixel_interface/ServoDiag "48b049f9561095b33c05b6a03bd01ae5")


