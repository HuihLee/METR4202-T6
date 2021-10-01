
(cl:in-package :asdf)

(defsystem "dynamixel_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DataPort" :depends-on ("_package_DataPort"))
    (:file "_package_DataPort" :depends-on ("_package"))
    (:file "DataPorts" :depends-on ("_package_DataPorts"))
    (:file "_package_DataPorts" :depends-on ("_package"))
    (:file "ServoDiag" :depends-on ("_package_ServoDiag"))
    (:file "_package_ServoDiag" :depends-on ("_package"))
    (:file "ServoDiags" :depends-on ("_package_ServoDiags"))
    (:file "_package_ServoDiags" :depends-on ("_package"))
  ))