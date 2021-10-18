;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::TrajectoryComplete)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'TrajectoryComplete (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::TRAJECTORYCOMPLETE")
  (make-package "CONTROL_LOGIC_NODE::TRAJECTORYCOMPLETE"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryComplete.msg.html


(defclass control_logic_node::TrajectoryComplete
  :super ros::object
  :slots (_complete ))

(defmethod control_logic_node::TrajectoryComplete
  (:init
   (&key
    ((:complete __complete) nil)
    )
   (send-super :init)
   (setq _complete __complete)
   self)
  (:complete
   (&optional (__complete :null))
   (if (not (eq __complete :null)) (setq _complete __complete)) _complete)
  (:serialization-length
   ()
   (+
    ;; bool _complete
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _complete
       (if _complete (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _complete
     (setq _complete (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get control_logic_node::TrajectoryComplete :md5sum-) "9d8061d2347621a6ed88451e28811cc7")
(setf (get control_logic_node::TrajectoryComplete :datatype-) "control_logic_node/TrajectoryComplete")
(setf (get control_logic_node::TrajectoryComplete :definition-)
      "bool complete

")



(provide :control_logic_node/TrajectoryComplete "9d8061d2347621a6ed88451e28811cc7")


