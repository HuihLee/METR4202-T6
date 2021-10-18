;; Auto-generated. Do not edit!


(when (boundp 'control_logic_node::TargetJointStateTrajectory)
  (if (not (find-package "CONTROL_LOGIC_NODE"))
    (make-package "CONTROL_LOGIC_NODE"))
  (shadow 'TargetJointStateTrajectory (find-package "CONTROL_LOGIC_NODE")))
(unless (find-package "CONTROL_LOGIC_NODE::TARGETJOINTSTATETRAJECTORY")
  (make-package "CONTROL_LOGIC_NODE::TARGETJOINTSTATETRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude TargetJointStateTrajectory.msg.html


(defclass control_logic_node::TargetJointStateTrajectory
  :super ros::object
  :slots (_thetasTarget _thetasCurrent _motionDuration ))

(defmethod control_logic_node::TargetJointStateTrajectory
  (:init
   (&key
    ((:thetasTarget __thetasTarget) (make-array 5 :initial-element 0.0 :element-type :float))
    ((:thetasCurrent __thetasCurrent) (make-array 5 :initial-element 0.0 :element-type :float))
    ((:motionDuration __motionDuration) 0.0)
    )
   (send-super :init)
   (setq _thetasTarget __thetasTarget)
   (setq _thetasCurrent __thetasCurrent)
   (setq _motionDuration (float __motionDuration))
   self)
  (:thetasTarget
   (&optional __thetasTarget)
   (if __thetasTarget (setq _thetasTarget __thetasTarget)) _thetasTarget)
  (:thetasCurrent
   (&optional __thetasCurrent)
   (if __thetasCurrent (setq _thetasCurrent __thetasCurrent)) _thetasCurrent)
  (:motionDuration
   (&optional __motionDuration)
   (if __motionDuration (setq _motionDuration __motionDuration)) _motionDuration)
  (:serialization-length
   ()
   (+
    ;; float32[5] _thetasTarget
    (* 4    5)
    ;; float32[5] _thetasCurrent
    (* 4    5)
    ;; float32 _motionDuration
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[5] _thetasTarget
     (dotimes (i 5)
       (sys::poke (elt _thetasTarget i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[5] _thetasCurrent
     (dotimes (i 5)
       (sys::poke (elt _thetasCurrent i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _motionDuration
       (sys::poke _motionDuration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[5] _thetasTarget
   (dotimes (i (length _thetasTarget))
     (setf (elt _thetasTarget i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[5] _thetasCurrent
   (dotimes (i (length _thetasCurrent))
     (setf (elt _thetasCurrent i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _motionDuration
     (setq _motionDuration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get control_logic_node::TargetJointStateTrajectory :md5sum-) "c4cbd25bd8b636d456c17a3edf6fce06")
(setf (get control_logic_node::TargetJointStateTrajectory :datatype-) "control_logic_node/TargetJointStateTrajectory")
(setf (get control_logic_node::TargetJointStateTrajectory :definition-)
      "float32[5] thetasTarget
float32[5] thetasCurrent
float32 motionDuration

")



(provide :control_logic_node/TargetJointStateTrajectory "c4cbd25bd8b636d456c17a3edf6fce06")


