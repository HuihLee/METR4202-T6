;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::DesJointState)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'DesJointState (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::DESJOINTSTATE")
  (make-package "CONTROL_LOGIC_NODE::DESJOINTSTATE"))

(in-package "ROS")
;;//! \htmlinclude DesJointState.msg.html


(defclass control_logic_node::DesJointState
  :super ros::object
  :slots (_thetas ))

(defmethod control_logic_node::DesJointState
  (:init
   (&key
    ((:thetas __thetas) (make-array 5 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _thetas __thetas)
   self)
  (:thetas
   (&optional __thetas)
   (if __thetas (setq _thetas __thetas)) _thetas)
  (:serialization-length
   ()
   (+
    ;; float32[5] _thetas
    (* 4    5)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[5] _thetas
     (dotimes (i 5)
       (sys::poke (elt _thetas i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[5] _thetas
   (dotimes (i (length _thetas))
     (setf (elt _thetas i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get control_logic_node::DesJointState :md5sum-) "dcf2dca9789fea2e3dbb6efc5dedb2ad")
(setf (get control_logic_node::DesJointState :datatype-) "control_logic_node/DesJointState")
(setf (get control_logic_node::DesJointState :definition-)
      "float32[5] thetas

")



(provide :control_logic_node/DesJointState "dcf2dca9789fea2e3dbb6efc5dedb2ad")

