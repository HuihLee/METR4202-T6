;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::ClawPose)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'ClawPose (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::CLAWPOSE")
  (make-package "CONTROL_LOGIC_NODE::CLAWPOSE"))

(in-package "ROS")
;;//! \htmlinclude ClawPose.msg.html


(defclass control_logic_node::ClawPose
  :super ros::object
  :slots (_position ))

(defmethod control_logic_node::ClawPose
  (:init
   (&key
    ((:position __position) (make-array 4 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float32[4] _position
    (* 4    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _position
     (dotimes (i 4)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get control_logic_node::ClawPose :md5sum-) "63a407737199add49d16d66d097d869e")
(setf (get control_logic_node::ClawPose :datatype-) "control_logic_node/ClawPose")
(setf (get control_logic_node::ClawPose :definition-)
      "float32[4] position 
")



(provide :control_logic_node/ClawPose "63a407737199add49d16d66d097d869e")


