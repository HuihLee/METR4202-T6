
(cl:in-package :asdf)

(defsystem "ximea_ros_cam-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "XiImageInfo" :depends-on ("_package_XiImageInfo"))
    (:file "_package_XiImageInfo" :depends-on ("_package"))
  ))