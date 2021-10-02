; Auto-generated. Do not edit!


(cl:in-package ximea_ros_cam-msg)


;//! \htmlinclude XiImageInfo.msg.html

(cl:defclass <XiImageInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0)
   (bp_size
    :reader bp_size
    :initarg :bp_size
    :type cl:integer
    :initform 0)
   (frm
    :reader frm
    :initarg :frm
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (nframe
    :reader nframe
    :initarg :nframe
    :type cl:integer
    :initform 0)
   (tsSec
    :reader tsSec
    :initarg :tsSec
    :type cl:integer
    :initform 0)
   (tsUSec
    :reader tsUSec
    :initarg :tsUSec
    :type cl:integer
    :initform 0)
   (GPI_level
    :reader GPI_level
    :initarg :GPI_level
    :type cl:integer
    :initform 0)
   (black_level
    :reader black_level
    :initarg :black_level
    :type cl:integer
    :initform 0)
   (padding_x
    :reader padding_x
    :initarg :padding_x
    :type cl:integer
    :initform 0)
   (AbsoluteOffsetX
    :reader AbsoluteOffsetX
    :initarg :AbsoluteOffsetX
    :type cl:integer
    :initform 0)
   (AbsoluteOffsetY
    :reader AbsoluteOffsetY
    :initarg :AbsoluteOffsetY
    :type cl:integer
    :initform 0)
   (exposure_time_us
    :reader exposure_time_us
    :initarg :exposure_time_us
    :type cl:integer
    :initform 0)
   (gain_db
    :reader gain_db
    :initarg :gain_db
    :type cl:float
    :initform 0.0)
   (acq_nframe
    :reader acq_nframe
    :initarg :acq_nframe
    :type cl:integer
    :initform 0)
   (image_user_data
    :reader image_user_data
    :initarg :image_user_data
    :type cl:integer
    :initform 0))
)

(cl:defclass XiImageInfo (<XiImageInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XiImageInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XiImageInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ximea_ros_cam-msg:<XiImageInfo> is deprecated: use ximea_ros_cam-msg:XiImageInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:header-val is deprecated.  Use ximea_ros_cam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:size-val is deprecated.  Use ximea_ros_cam-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'bp_size-val :lambda-list '(m))
(cl:defmethod bp_size-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:bp_size-val is deprecated.  Use ximea_ros_cam-msg:bp_size instead.")
  (bp_size m))

(cl:ensure-generic-function 'frm-val :lambda-list '(m))
(cl:defmethod frm-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:frm-val is deprecated.  Use ximea_ros_cam-msg:frm instead.")
  (frm m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:width-val is deprecated.  Use ximea_ros_cam-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:height-val is deprecated.  Use ximea_ros_cam-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'nframe-val :lambda-list '(m))
(cl:defmethod nframe-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:nframe-val is deprecated.  Use ximea_ros_cam-msg:nframe instead.")
  (nframe m))

(cl:ensure-generic-function 'tsSec-val :lambda-list '(m))
(cl:defmethod tsSec-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:tsSec-val is deprecated.  Use ximea_ros_cam-msg:tsSec instead.")
  (tsSec m))

(cl:ensure-generic-function 'tsUSec-val :lambda-list '(m))
(cl:defmethod tsUSec-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:tsUSec-val is deprecated.  Use ximea_ros_cam-msg:tsUSec instead.")
  (tsUSec m))

(cl:ensure-generic-function 'GPI_level-val :lambda-list '(m))
(cl:defmethod GPI_level-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:GPI_level-val is deprecated.  Use ximea_ros_cam-msg:GPI_level instead.")
  (GPI_level m))

(cl:ensure-generic-function 'black_level-val :lambda-list '(m))
(cl:defmethod black_level-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:black_level-val is deprecated.  Use ximea_ros_cam-msg:black_level instead.")
  (black_level m))

(cl:ensure-generic-function 'padding_x-val :lambda-list '(m))
(cl:defmethod padding_x-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:padding_x-val is deprecated.  Use ximea_ros_cam-msg:padding_x instead.")
  (padding_x m))

(cl:ensure-generic-function 'AbsoluteOffsetX-val :lambda-list '(m))
(cl:defmethod AbsoluteOffsetX-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:AbsoluteOffsetX-val is deprecated.  Use ximea_ros_cam-msg:AbsoluteOffsetX instead.")
  (AbsoluteOffsetX m))

(cl:ensure-generic-function 'AbsoluteOffsetY-val :lambda-list '(m))
(cl:defmethod AbsoluteOffsetY-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:AbsoluteOffsetY-val is deprecated.  Use ximea_ros_cam-msg:AbsoluteOffsetY instead.")
  (AbsoluteOffsetY m))

(cl:ensure-generic-function 'exposure_time_us-val :lambda-list '(m))
(cl:defmethod exposure_time_us-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:exposure_time_us-val is deprecated.  Use ximea_ros_cam-msg:exposure_time_us instead.")
  (exposure_time_us m))

(cl:ensure-generic-function 'gain_db-val :lambda-list '(m))
(cl:defmethod gain_db-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:gain_db-val is deprecated.  Use ximea_ros_cam-msg:gain_db instead.")
  (gain_db m))

(cl:ensure-generic-function 'acq_nframe-val :lambda-list '(m))
(cl:defmethod acq_nframe-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:acq_nframe-val is deprecated.  Use ximea_ros_cam-msg:acq_nframe instead.")
  (acq_nframe m))

(cl:ensure-generic-function 'image_user_data-val :lambda-list '(m))
(cl:defmethod image_user_data-val ((m <XiImageInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ximea_ros_cam-msg:image_user_data-val is deprecated.  Use ximea_ros_cam-msg:image_user_data instead.")
  (image_user_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XiImageInfo>) ostream)
  "Serializes a message object of type '<XiImageInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'bp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'bp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'bp_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frm)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tsSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tsSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tsSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsUSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tsUSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tsUSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tsUSec)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GPI_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'GPI_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'GPI_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'GPI_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'black_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'black_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'black_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'black_level)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'padding_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'padding_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'padding_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'padding_x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AbsoluteOffsetX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'AbsoluteOffsetX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'AbsoluteOffsetX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'AbsoluteOffsetX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AbsoluteOffsetY)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'AbsoluteOffsetY)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'AbsoluteOffsetY)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'AbsoluteOffsetY)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exposure_time_us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'exposure_time_us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'exposure_time_us)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'exposure_time_us)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gain_db))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'acq_nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'acq_nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'acq_nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'acq_nframe)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_user_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_user_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_user_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_user_data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XiImageInfo>) istream)
  "Deserializes a message object of type '<XiImageInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'bp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'bp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'bp_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frm)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tsSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tsSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tsSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tsUSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'tsUSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'tsUSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'tsUSec)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GPI_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'GPI_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'GPI_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'GPI_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'black_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'black_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'black_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'black_level)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'padding_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'padding_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'padding_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'padding_x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AbsoluteOffsetX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'AbsoluteOffsetX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'AbsoluteOffsetX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'AbsoluteOffsetX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'AbsoluteOffsetY)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'AbsoluteOffsetY)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'AbsoluteOffsetY)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'AbsoluteOffsetY)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'exposure_time_us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'exposure_time_us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'exposure_time_us)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'exposure_time_us)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gain_db) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'acq_nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'acq_nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'acq_nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'acq_nframe)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_user_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_user_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_user_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_user_data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XiImageInfo>)))
  "Returns string type for a message object of type '<XiImageInfo>"
  "ximea_ros_cam/XiImageInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XiImageInfo)))
  "Returns string type for a message object of type 'XiImageInfo"
  "ximea_ros_cam/XiImageInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XiImageInfo>)))
  "Returns md5sum for a message object of type '<XiImageInfo>"
  "1e504126cf849c6656990d903d08e2ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XiImageInfo)))
  "Returns md5sum for a message object of type 'XiImageInfo"
  "1e504126cf849c6656990d903d08e2ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XiImageInfo>)))
  "Returns full string definition for message of type '<XiImageInfo>"
  (cl:format cl:nil "Header header~%uint32 size~%uint32 bp_size~%uint32 frm~%uint32 width~%uint32 height~%uint32 nframe~%uint32 tsSec~%uint32 tsUSec~%uint32 GPI_level~%uint32 black_level~%uint32 padding_x~%uint32 AbsoluteOffsetX~%uint32 AbsoluteOffsetY~%uint32 exposure_time_us~%float32 gain_db~%uint32 acq_nframe~%uint32 image_user_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XiImageInfo)))
  "Returns full string definition for message of type 'XiImageInfo"
  (cl:format cl:nil "Header header~%uint32 size~%uint32 bp_size~%uint32 frm~%uint32 width~%uint32 height~%uint32 nframe~%uint32 tsSec~%uint32 tsUSec~%uint32 GPI_level~%uint32 black_level~%uint32 padding_x~%uint32 AbsoluteOffsetX~%uint32 AbsoluteOffsetY~%uint32 exposure_time_us~%float32 gain_db~%uint32 acq_nframe~%uint32 image_user_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XiImageInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XiImageInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'XiImageInfo
    (cl:cons ':header (header msg))
    (cl:cons ':size (size msg))
    (cl:cons ':bp_size (bp_size msg))
    (cl:cons ':frm (frm msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':nframe (nframe msg))
    (cl:cons ':tsSec (tsSec msg))
    (cl:cons ':tsUSec (tsUSec msg))
    (cl:cons ':GPI_level (GPI_level msg))
    (cl:cons ':black_level (black_level msg))
    (cl:cons ':padding_x (padding_x msg))
    (cl:cons ':AbsoluteOffsetX (AbsoluteOffsetX msg))
    (cl:cons ':AbsoluteOffsetY (AbsoluteOffsetY msg))
    (cl:cons ':exposure_time_us (exposure_time_us msg))
    (cl:cons ':gain_db (gain_db msg))
    (cl:cons ':acq_nframe (acq_nframe msg))
    (cl:cons ':image_user_data (image_user_data msg))
))
