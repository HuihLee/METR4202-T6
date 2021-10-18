;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::DesPosition)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'DesPosition (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::DESPOSITION")
  (make-package "CONTROL_LOGIC_NODE::DESPOSITION"))

(in-package "ROS")
;;//! \htmlinclude DesPosition.msg.html


(defclass control_logic_node::DesPosition
  :super ros::object
  :slots (_position _orientation_z ))

(defmethod control_logic_node::DesPosition
  (:init
   (&key
    ((:position __position) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:orientation_z __orientation_z) 0.0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _orientation_z (float __orientation_z))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:orientation_z
   (&optional __orientation_z)
   (if __orientation_z (setq _orientation_z __orientation_z)) _orientation_z)
  (:serialization-length
   ()
   (+
    ;; float32[3] _position
    (* 4    3)
    ;; float32 _orientation_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _position
     (dotimes (i 3)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _orientation_z
       (sys::poke _orientation_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _orientation_z
     (setq _orientation_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get control_logic_node::DesPosition :md5sum-) "0e2aade9b104799c49e86da7da995598")
(setf (get control_logic_node::DesPosition :datatype-) "control_logic_node/DesPosition")
(setf (get control_logic_node::DesPosition :definition-)
      "float32[3] position
float32 orientation_z

")



(provide :control_logic_node/DesPosition "0e2aade9b104799c49e86da7da995598")


