; Auto-generated. Do not edit!


(cl:in-package styx_msgs-srv)


;//! \htmlinclude Nav-request.msg.html

(cl:defclass <Nav-request> (roslisp-msg-protocol:ros-message)
  ((currentTime
    :reader currentTime
    :initarg :currentTime
    :type cl:float
    :initform 0.0)
   (currentPose
    :reader currentPose
    :initarg :currentPose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (currentTwist
    :reader currentTwist
    :initarg :currentTwist
    :type geometry_msgs-msg:TwistStamped
    :initform (cl:make-instance 'geometry_msgs-msg:TwistStamped)))
)

(cl:defclass Nav-request (<Nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name styx_msgs-srv:<Nav-request> is deprecated: use styx_msgs-srv:Nav-request instead.")))

(cl:ensure-generic-function 'currentTime-val :lambda-list '(m))
(cl:defmethod currentTime-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:currentTime-val is deprecated.  Use styx_msgs-srv:currentTime instead.")
  (currentTime m))

(cl:ensure-generic-function 'currentPose-val :lambda-list '(m))
(cl:defmethod currentPose-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:currentPose-val is deprecated.  Use styx_msgs-srv:currentPose instead.")
  (currentPose m))

(cl:ensure-generic-function 'currentTwist-val :lambda-list '(m))
(cl:defmethod currentTwist-val ((m <Nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:currentTwist-val is deprecated.  Use styx_msgs-srv:currentTwist instead.")
  (currentTwist m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-request>) ostream)
  "Serializes a message object of type '<Nav-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'currentTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'currentPose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'currentTwist) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-request>) istream)
  "Deserializes a message object of type '<Nav-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'currentTime) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'currentPose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'currentTwist) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-request>)))
  "Returns string type for a service object of type '<Nav-request>"
  "styx_msgs/NavRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-request)))
  "Returns string type for a service object of type 'Nav-request"
  "styx_msgs/NavRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-request>)))
  "Returns md5sum for a message object of type '<Nav-request>"
  "4c1397c5940b771e71cd0ee42abe5307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-request)))
  "Returns md5sum for a message object of type 'Nav-request"
  "4c1397c5940b771e71cd0ee42abe5307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-request>)))
  "Returns full string definition for message of type '<Nav-request>"
  (cl:format cl:nil "# Client ~%float32 currentTime~%geometry_msgs/PoseStamped currentPose~%geometry_msgs/TwistStamped currentTwist~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-request)))
  "Returns full string definition for message of type 'Nav-request"
  (cl:format cl:nil "# Client ~%float32 currentTime~%geometry_msgs/PoseStamped currentPose~%geometry_msgs/TwistStamped currentTwist~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'currentPose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'currentTwist))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-request
    (cl:cons ':currentTime (currentTime msg))
    (cl:cons ':currentPose (currentPose msg))
    (cl:cons ':currentTwist (currentTwist msg))
))
;//! \htmlinclude Nav-response.msg.html

(cl:defclass <Nav-response> (roslisp-msg-protocol:ros-message)
  ((targetPose
    :reader targetPose
    :initarg :targetPose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (targetTwist
    :reader targetTwist
    :initarg :targetTwist
    :type geometry_msgs-msg:TwistStamped
    :initform (cl:make-instance 'geometry_msgs-msg:TwistStamped))
   (kappa
    :reader kappa
    :initarg :kappa
    :type cl:float
    :initform 0.0))
)

(cl:defclass Nav-response (<Nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name styx_msgs-srv:<Nav-response> is deprecated: use styx_msgs-srv:Nav-response instead.")))

(cl:ensure-generic-function 'targetPose-val :lambda-list '(m))
(cl:defmethod targetPose-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:targetPose-val is deprecated.  Use styx_msgs-srv:targetPose instead.")
  (targetPose m))

(cl:ensure-generic-function 'targetTwist-val :lambda-list '(m))
(cl:defmethod targetTwist-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:targetTwist-val is deprecated.  Use styx_msgs-srv:targetTwist instead.")
  (targetTwist m))

(cl:ensure-generic-function 'kappa-val :lambda-list '(m))
(cl:defmethod kappa-val ((m <Nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader styx_msgs-srv:kappa-val is deprecated.  Use styx_msgs-srv:kappa instead.")
  (kappa m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nav-response>) ostream)
  "Serializes a message object of type '<Nav-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'targetPose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'targetTwist) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'kappa))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nav-response>) istream)
  "Deserializes a message object of type '<Nav-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'targetPose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'targetTwist) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'kappa) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nav-response>)))
  "Returns string type for a service object of type '<Nav-response>"
  "styx_msgs/NavResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav-response)))
  "Returns string type for a service object of type 'Nav-response"
  "styx_msgs/NavResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nav-response>)))
  "Returns md5sum for a message object of type '<Nav-response>"
  "4c1397c5940b771e71cd0ee42abe5307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nav-response)))
  "Returns md5sum for a message object of type 'Nav-response"
  "4c1397c5940b771e71cd0ee42abe5307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nav-response>)))
  "Returns full string definition for message of type '<Nav-response>"
  (cl:format cl:nil "# Server~%geometry_msgs/PoseStamped targetPose~%geometry_msgs/TwistStamped targetTwist~%float32 kappa~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nav-response)))
  "Returns full string definition for message of type 'Nav-response"
  (cl:format cl:nil "# Server~%geometry_msgs/PoseStamped targetPose~%geometry_msgs/TwistStamped targetTwist~%float32 kappa~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nav-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'targetPose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'targetTwist))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Nav-response
    (cl:cons ':targetPose (targetPose msg))
    (cl:cons ':targetTwist (targetTwist msg))
    (cl:cons ':kappa (kappa msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Nav)))
  'Nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Nav)))
  'Nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nav)))
  "Returns string type for a service object of type '<Nav>"
  "styx_msgs/Nav")