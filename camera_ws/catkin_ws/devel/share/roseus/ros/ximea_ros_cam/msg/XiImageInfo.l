;; Auto-generated. Do not edit!


(when (boundp 'ximea_ros_cam::XiImageInfo)
  (if (not (find-package "XIMEA_ROS_CAM"))
    (make-package "XIMEA_ROS_CAM"))
  (shadow 'XiImageInfo (find-package "XIMEA_ROS_CAM")))
(unless (find-package "XIMEA_ROS_CAM::XIIMAGEINFO")
  (make-package "XIMEA_ROS_CAM::XIIMAGEINFO"))

(in-package "ROS")
;;//! \htmlinclude XiImageInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ximea_ros_cam::XiImageInfo
  :super ros::object
  :slots (_header _size _bp_size _frm _width _height _nframe _tsSec _tsUSec _GPI_level _black_level _padding_x _AbsoluteOffsetX _AbsoluteOffsetY _exposure_time_us _gain_db _acq_nframe _image_user_data ))

(defmethod ximea_ros_cam::XiImageInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:size __size) 0)
    ((:bp_size __bp_size) 0)
    ((:frm __frm) 0)
    ((:width __width) 0)
    ((:height __height) 0)
    ((:nframe __nframe) 0)
    ((:tsSec __tsSec) 0)
    ((:tsUSec __tsUSec) 0)
    ((:GPI_level __GPI_level) 0)
    ((:black_level __black_level) 0)
    ((:padding_x __padding_x) 0)
    ((:AbsoluteOffsetX __AbsoluteOffsetX) 0)
    ((:AbsoluteOffsetY __AbsoluteOffsetY) 0)
    ((:exposure_time_us __exposure_time_us) 0)
    ((:gain_db __gain_db) 0.0)
    ((:acq_nframe __acq_nframe) 0)
    ((:image_user_data __image_user_data) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _size (round __size))
   (setq _bp_size (round __bp_size))
   (setq _frm (round __frm))
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _nframe (round __nframe))
   (setq _tsSec (round __tsSec))
   (setq _tsUSec (round __tsUSec))
   (setq _GPI_level (round __GPI_level))
   (setq _black_level (round __black_level))
   (setq _padding_x (round __padding_x))
   (setq _AbsoluteOffsetX (round __AbsoluteOffsetX))
   (setq _AbsoluteOffsetY (round __AbsoluteOffsetY))
   (setq _exposure_time_us (round __exposure_time_us))
   (setq _gain_db (float __gain_db))
   (setq _acq_nframe (round __acq_nframe))
   (setq _image_user_data (round __image_user_data))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:bp_size
   (&optional __bp_size)
   (if __bp_size (setq _bp_size __bp_size)) _bp_size)
  (:frm
   (&optional __frm)
   (if __frm (setq _frm __frm)) _frm)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:nframe
   (&optional __nframe)
   (if __nframe (setq _nframe __nframe)) _nframe)
  (:tsSec
   (&optional __tsSec)
   (if __tsSec (setq _tsSec __tsSec)) _tsSec)
  (:tsUSec
   (&optional __tsUSec)
   (if __tsUSec (setq _tsUSec __tsUSec)) _tsUSec)
  (:GPI_level
   (&optional __GPI_level)
   (if __GPI_level (setq _GPI_level __GPI_level)) _GPI_level)
  (:black_level
   (&optional __black_level)
   (if __black_level (setq _black_level __black_level)) _black_level)
  (:padding_x
   (&optional __padding_x)
   (if __padding_x (setq _padding_x __padding_x)) _padding_x)
  (:AbsoluteOffsetX
   (&optional __AbsoluteOffsetX)
   (if __AbsoluteOffsetX (setq _AbsoluteOffsetX __AbsoluteOffsetX)) _AbsoluteOffsetX)
  (:AbsoluteOffsetY
   (&optional __AbsoluteOffsetY)
   (if __AbsoluteOffsetY (setq _AbsoluteOffsetY __AbsoluteOffsetY)) _AbsoluteOffsetY)
  (:exposure_time_us
   (&optional __exposure_time_us)
   (if __exposure_time_us (setq _exposure_time_us __exposure_time_us)) _exposure_time_us)
  (:gain_db
   (&optional __gain_db)
   (if __gain_db (setq _gain_db __gain_db)) _gain_db)
  (:acq_nframe
   (&optional __acq_nframe)
   (if __acq_nframe (setq _acq_nframe __acq_nframe)) _acq_nframe)
  (:image_user_data
   (&optional __image_user_data)
   (if __image_user_data (setq _image_user_data __image_user_data)) _image_user_data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _size
    4
    ;; uint32 _bp_size
    4
    ;; uint32 _frm
    4
    ;; uint32 _width
    4
    ;; uint32 _height
    4
    ;; uint32 _nframe
    4
    ;; uint32 _tsSec
    4
    ;; uint32 _tsUSec
    4
    ;; uint32 _GPI_level
    4
    ;; uint32 _black_level
    4
    ;; uint32 _padding_x
    4
    ;; uint32 _AbsoluteOffsetX
    4
    ;; uint32 _AbsoluteOffsetY
    4
    ;; uint32 _exposure_time_us
    4
    ;; float32 _gain_db
    4
    ;; uint32 _acq_nframe
    4
    ;; uint32 _image_user_data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _size
       (write-long _size s)
     ;; uint32 _bp_size
       (write-long _bp_size s)
     ;; uint32 _frm
       (write-long _frm s)
     ;; uint32 _width
       (write-long _width s)
     ;; uint32 _height
       (write-long _height s)
     ;; uint32 _nframe
       (write-long _nframe s)
     ;; uint32 _tsSec
       (write-long _tsSec s)
     ;; uint32 _tsUSec
       (write-long _tsUSec s)
     ;; uint32 _GPI_level
       (write-long _GPI_level s)
     ;; uint32 _black_level
       (write-long _black_level s)
     ;; uint32 _padding_x
       (write-long _padding_x s)
     ;; uint32 _AbsoluteOffsetX
       (write-long _AbsoluteOffsetX s)
     ;; uint32 _AbsoluteOffsetY
       (write-long _AbsoluteOffsetY s)
     ;; uint32 _exposure_time_us
       (write-long _exposure_time_us s)
     ;; float32 _gain_db
       (sys::poke _gain_db (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _acq_nframe
       (write-long _acq_nframe s)
     ;; uint32 _image_user_data
       (write-long _image_user_data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _bp_size
     (setq _bp_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _frm
     (setq _frm (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _nframe
     (setq _nframe (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _tsSec
     (setq _tsSec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _tsUSec
     (setq _tsUSec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _GPI_level
     (setq _GPI_level (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _black_level
     (setq _black_level (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _padding_x
     (setq _padding_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _AbsoluteOffsetX
     (setq _AbsoluteOffsetX (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _AbsoluteOffsetY
     (setq _AbsoluteOffsetY (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _exposure_time_us
     (setq _exposure_time_us (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _gain_db
     (setq _gain_db (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _acq_nframe
     (setq _acq_nframe (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _image_user_data
     (setq _image_user_data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ximea_ros_cam::XiImageInfo :md5sum-) "1e504126cf849c6656990d903d08e2ea")
(setf (get ximea_ros_cam::XiImageInfo :datatype-) "ximea_ros_cam/XiImageInfo")
(setf (get ximea_ros_cam::XiImageInfo :definition-)
      "Header header
uint32 size
uint32 bp_size
uint32 frm
uint32 width
uint32 height
uint32 nframe
uint32 tsSec
uint32 tsUSec
uint32 GPI_level
uint32 black_level
uint32 padding_x
uint32 AbsoluteOffsetX
uint32 AbsoluteOffsetY
uint32 exposure_time_us
float32 gain_db
uint32 acq_nframe
uint32 image_user_data

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

")



(provide :ximea_ros_cam/XiImageInfo "1e504126cf849c6656990d903d08e2ea")


