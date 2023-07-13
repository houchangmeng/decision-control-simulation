;; Auto-generated. Do not edit!


(when (boundp 'styx_msgs::Nav)
  (if (not (find-package "STYX_MSGS"))
    (make-package "STYX_MSGS"))
  (shadow 'Nav (find-package "STYX_MSGS")))
(unless (find-package "STYX_MSGS::NAV")
  (make-package "STYX_MSGS::NAV"))
(unless (find-package "STYX_MSGS::NAVREQUEST")
  (make-package "STYX_MSGS::NAVREQUEST"))
(unless (find-package "STYX_MSGS::NAVRESPONSE")
  (make-package "STYX_MSGS::NAVRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass styx_msgs::NavRequest
  :super ros::object
  :slots (_currentTime _currentPose _currentTwist ))

(defmethod styx_msgs::NavRequest
  (:init
   (&key
    ((:currentTime __currentTime) 0.0)
    ((:currentPose __currentPose) (instance geometry_msgs::PoseStamped :init))
    ((:currentTwist __currentTwist) (instance geometry_msgs::TwistStamped :init))
    )
   (send-super :init)
   (setq _currentTime (float __currentTime))
   (setq _currentPose __currentPose)
   (setq _currentTwist __currentTwist)
   self)
  (:currentTime
   (&optional __currentTime)
   (if __currentTime (setq _currentTime __currentTime)) _currentTime)
  (:currentPose
   (&rest __currentPose)
   (if (keywordp (car __currentPose))
       (send* _currentPose __currentPose)
     (progn
       (if __currentPose (setq _currentPose (car __currentPose)))
       _currentPose)))
  (:currentTwist
   (&rest __currentTwist)
   (if (keywordp (car __currentTwist))
       (send* _currentTwist __currentTwist)
     (progn
       (if __currentTwist (setq _currentTwist (car __currentTwist)))
       _currentTwist)))
  (:serialization-length
   ()
   (+
    ;; float32 _currentTime
    4
    ;; geometry_msgs/PoseStamped _currentPose
    (send _currentPose :serialization-length)
    ;; geometry_msgs/TwistStamped _currentTwist
    (send _currentTwist :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _currentTime
       (sys::poke _currentTime (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/PoseStamped _currentPose
       (send _currentPose :serialize s)
     ;; geometry_msgs/TwistStamped _currentTwist
       (send _currentTwist :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _currentTime
     (setq _currentTime (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/PoseStamped _currentPose
     (send _currentPose :deserialize buf ptr-) (incf ptr- (send _currentPose :serialization-length))
   ;; geometry_msgs/TwistStamped _currentTwist
     (send _currentTwist :deserialize buf ptr-) (incf ptr- (send _currentTwist :serialization-length))
   ;;
   self)
  )

(defclass styx_msgs::NavResponse
  :super ros::object
  :slots (_targetPose _targetTwist _kappa ))

(defmethod styx_msgs::NavResponse
  (:init
   (&key
    ((:targetPose __targetPose) (instance geometry_msgs::PoseStamped :init))
    ((:targetTwist __targetTwist) (instance geometry_msgs::TwistStamped :init))
    ((:kappa __kappa) 0.0)
    )
   (send-super :init)
   (setq _targetPose __targetPose)
   (setq _targetTwist __targetTwist)
   (setq _kappa (float __kappa))
   self)
  (:targetPose
   (&rest __targetPose)
   (if (keywordp (car __targetPose))
       (send* _targetPose __targetPose)
     (progn
       (if __targetPose (setq _targetPose (car __targetPose)))
       _targetPose)))
  (:targetTwist
   (&rest __targetTwist)
   (if (keywordp (car __targetTwist))
       (send* _targetTwist __targetTwist)
     (progn
       (if __targetTwist (setq _targetTwist (car __targetTwist)))
       _targetTwist)))
  (:kappa
   (&optional __kappa)
   (if __kappa (setq _kappa __kappa)) _kappa)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _targetPose
    (send _targetPose :serialization-length)
    ;; geometry_msgs/TwistStamped _targetTwist
    (send _targetTwist :serialization-length)
    ;; float32 _kappa
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _targetPose
       (send _targetPose :serialize s)
     ;; geometry_msgs/TwistStamped _targetTwist
       (send _targetTwist :serialize s)
     ;; float32 _kappa
       (sys::poke _kappa (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _targetPose
     (send _targetPose :deserialize buf ptr-) (incf ptr- (send _targetPose :serialization-length))
   ;; geometry_msgs/TwistStamped _targetTwist
     (send _targetTwist :deserialize buf ptr-) (incf ptr- (send _targetTwist :serialization-length))
   ;; float32 _kappa
     (setq _kappa (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass styx_msgs::Nav
  :super ros::object
  :slots ())

(setf (get styx_msgs::Nav :md5sum-) "4c1397c5940b771e71cd0ee42abe5307")
(setf (get styx_msgs::Nav :datatype-) "styx_msgs/Nav")
(setf (get styx_msgs::Nav :request) styx_msgs::NavRequest)
(setf (get styx_msgs::Nav :response) styx_msgs::NavResponse)

(defmethod styx_msgs::NavRequest
  (:response () (instance styx_msgs::NavResponse :init)))

(setf (get styx_msgs::NavRequest :md5sum-) "4c1397c5940b771e71cd0ee42abe5307")
(setf (get styx_msgs::NavRequest :datatype-) "styx_msgs/NavRequest")
(setf (get styx_msgs::NavRequest :definition-)
      "# Client 
float32 currentTime
geometry_msgs/PoseStamped currentPose
geometry_msgs/TwistStamped currentTwist

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistStamped
# A twist with reference coordinate frame and timestamp
Header header
Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
# Server
geometry_msgs/PoseStamped targetPose
geometry_msgs/TwistStamped targetTwist
float32 kappa


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistStamped
# A twist with reference coordinate frame and timestamp
Header header
Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get styx_msgs::NavResponse :md5sum-) "4c1397c5940b771e71cd0ee42abe5307")
(setf (get styx_msgs::NavResponse :datatype-) "styx_msgs/NavResponse")
(setf (get styx_msgs::NavResponse :definition-)
      "# Client 
float32 currentTime
geometry_msgs/PoseStamped currentPose
geometry_msgs/TwistStamped currentTwist

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistStamped
# A twist with reference coordinate frame and timestamp
Header header
Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
---
# Server
geometry_msgs/PoseStamped targetPose
geometry_msgs/TwistStamped targetTwist
float32 kappa


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistStamped
# A twist with reference coordinate frame and timestamp
Header header
Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :styx_msgs/Nav "4c1397c5940b771e71cd0ee42abe5307")


