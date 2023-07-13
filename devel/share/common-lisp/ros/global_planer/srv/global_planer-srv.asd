
(cl:in-package :asdf)

(defsystem "global_planer-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Nav" :depends-on ("_package_Nav"))
    (:file "_package_Nav" :depends-on ("_package"))
  ))