;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::CubePose)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'CubePose (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::CUBEPOSE")
  (make-package "CONTROL_LOGIC_NODE::CUBEPOSE"))

(in-package "ROS")
;;//! \htmlinclude CubePose.msg.html


(defclass control_logic_node::CubePose
  :super ros::object
  :slots (_position _colour ))

(defmethod control_logic_node::CubePose
  (:init
   (&key
    ((:position __position) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:colour __colour) "")
    )
   (send-super :init)
   (setq _position __position)
   (setq _colour (string __colour))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:colour
   (&optional __colour)
   (if __colour (setq _colour __colour)) _colour)
  (:serialization-length
   ()
   (+
    ;; float32[4] _position
    (* 4    4)
    ;; string _colour
    4 (length _colour)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _position
     (dotimes (i 4)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _colour
       (write-long (length _colour) s) (princ _colour s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; string _colour
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _colour (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get control_logic_node::CubePose :md5sum-) "7da6dd3707216b2a7871c249c47975fa")
(setf (get control_logic_node::CubePose :datatype-) "control_logic_node/CubePose")
(setf (get control_logic_node::CubePose :definition-)
      "float32[4] position 
string colour
")



(provide :control_logic_node/CubePose "7da6dd3707216b2a7871c249c47975fa")


