; Auto-generated. Do not edit!


(cl:in-package global_planer-srv)


;//! \htmlinclude nav-request.msg.html

(cl:defclass <nav-request> (roslisp-msg-protocol:ros-message)
  ((currentTime
    :reader currentTime
    :initarg :currentTime
    :type cl:integer
    :initform 0)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass nav-request (<nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name global_planer-srv:<nav-request> is deprecated: use global_planer-srv:nav-request instead.")))

(cl:ensure-generic-function 'currentTime-val :lambda-list '(m))
(cl:defmethod currentTime-val ((m <nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader global_planer-srv:currentTime-val is deprecated.  Use global_planer-srv:currentTime instead.")
  (currentTime m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader global_planer-srv:pose-val is deprecated.  Use global_planer-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav-request>) ostream)
  "Serializes a message object of type '<nav-request>"
  (cl:let* ((signed (cl:slot-value msg 'currentTime)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav-request>) istream)
  "Deserializes a message object of type '<nav-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'currentTime) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav-request>)))
  "Returns string type for a service object of type '<nav-request>"
  "global_planer/navRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav-request)))
  "Returns string type for a service object of type 'nav-request"
  "global_planer/navRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav-request>)))
  "Returns md5sum for a message object of type '<nav-request>"
  "dc45d88fed60392a91694173e2278679")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav-request)))
  "Returns md5sum for a message object of type 'nav-request"
  "dc45d88fed60392a91694173e2278679")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav-request>)))
  "Returns full string definition for message of type '<nav-request>"
  (cl:format cl:nil "# Client ~%int32 currentTime~%geometry_msgs/PoseStamped pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav-request)))
  "Returns full string definition for message of type 'nav-request"
  (cl:format cl:nil "# Client ~%int32 currentTime~%geometry_msgs/PoseStamped pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'nav-request
    (cl:cons ':currentTime (currentTime msg))
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude nav-response.msg.html

(cl:defclass <nav-response> (roslisp-msg-protocol:ros-message)
  ((twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:TwistStamped
    :initform (cl:make-instance 'geometry_msgs-msg:TwistStamped)))
)

(cl:defclass nav-response (<nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name global_planer-srv:<nav-response> is deprecated: use global_planer-srv:nav-response instead.")))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader global_planer-srv:twist-val is deprecated.  Use global_planer-srv:twist instead.")
  (twist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav-response>) ostream)
  "Serializes a message object of type '<nav-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav-response>) istream)
  "Deserializes a message object of type '<nav-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav-response>)))
  "Returns string type for a service object of type '<nav-response>"
  "global_planer/navResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav-response)))
  "Returns string type for a service object of type 'nav-response"
  "global_planer/navResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav-response>)))
  "Returns md5sum for a message object of type '<nav-response>"
  "dc45d88fed60392a91694173e2278679")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav-response)))
  "Returns md5sum for a message object of type 'nav-response"
  "dc45d88fed60392a91694173e2278679")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav-response>)))
  "Returns full string definition for message of type '<nav-response>"
  (cl:format cl:nil "# Server~%geometry_msgs/TwistStamped twist~%~%~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav-response)))
  "Returns full string definition for message of type 'nav-response"
  (cl:format cl:nil "# Server~%geometry_msgs/TwistStamped twist~%~%~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'nav-response
    (cl:cons ':twist (twist msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'nav)))
  'nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'nav)))
  'nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav)))
  "Returns string type for a service object of type '<nav>"
  "global_planer/nav")