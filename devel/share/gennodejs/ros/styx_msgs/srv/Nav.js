// Auto-generated. Do not edit!

// (in-package styx_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class NavRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.currentTime = null;
      this.currentPose = null;
      this.currentTwist = null;
    }
    else {
      if (initObj.hasOwnProperty('currentTime')) {
        this.currentTime = initObj.currentTime
      }
      else {
        this.currentTime = 0.0;
      }
      if (initObj.hasOwnProperty('currentPose')) {
        this.currentPose = initObj.currentPose
      }
      else {
        this.currentPose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('currentTwist')) {
        this.currentTwist = initObj.currentTwist
      }
      else {
        this.currentTwist = new geometry_msgs.msg.TwistStamped();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavRequest
    // Serialize message field [currentTime]
    bufferOffset = _serializer.float32(obj.currentTime, buffer, bufferOffset);
    // Serialize message field [currentPose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.currentPose, buffer, bufferOffset);
    // Serialize message field [currentTwist]
    bufferOffset = geometry_msgs.msg.TwistStamped.serialize(obj.currentTwist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavRequest
    let len;
    let data = new NavRequest(null);
    // Deserialize message field [currentTime]
    data.currentTime = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [currentPose]
    data.currentPose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [currentTwist]
    data.currentTwist = geometry_msgs.msg.TwistStamped.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.currentPose);
    length += geometry_msgs.msg.TwistStamped.getMessageSize(object.currentTwist);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'styx_msgs/NavRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '105471b4ec03125dccde71d28fbfdb8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Client 
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
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavRequest(null);
    if (msg.currentTime !== undefined) {
      resolved.currentTime = msg.currentTime;
    }
    else {
      resolved.currentTime = 0.0
    }

    if (msg.currentPose !== undefined) {
      resolved.currentPose = geometry_msgs.msg.PoseStamped.Resolve(msg.currentPose)
    }
    else {
      resolved.currentPose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.currentTwist !== undefined) {
      resolved.currentTwist = geometry_msgs.msg.TwistStamped.Resolve(msg.currentTwist)
    }
    else {
      resolved.currentTwist = new geometry_msgs.msg.TwistStamped()
    }

    return resolved;
    }
};

class NavResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.targetPose = null;
      this.targetTwist = null;
      this.kappa = null;
    }
    else {
      if (initObj.hasOwnProperty('targetPose')) {
        this.targetPose = initObj.targetPose
      }
      else {
        this.targetPose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('targetTwist')) {
        this.targetTwist = initObj.targetTwist
      }
      else {
        this.targetTwist = new geometry_msgs.msg.TwistStamped();
      }
      if (initObj.hasOwnProperty('kappa')) {
        this.kappa = initObj.kappa
      }
      else {
        this.kappa = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavResponse
    // Serialize message field [targetPose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.targetPose, buffer, bufferOffset);
    // Serialize message field [targetTwist]
    bufferOffset = geometry_msgs.msg.TwistStamped.serialize(obj.targetTwist, buffer, bufferOffset);
    // Serialize message field [kappa]
    bufferOffset = _serializer.float32(obj.kappa, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavResponse
    let len;
    let data = new NavResponse(null);
    // Deserialize message field [targetPose]
    data.targetPose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [targetTwist]
    data.targetTwist = geometry_msgs.msg.TwistStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [kappa]
    data.kappa = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.targetPose);
    length += geometry_msgs.msg.TwistStamped.getMessageSize(object.targetTwist);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'styx_msgs/NavResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '724eadc8f87261a62f785aa244ebcc1d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavResponse(null);
    if (msg.targetPose !== undefined) {
      resolved.targetPose = geometry_msgs.msg.PoseStamped.Resolve(msg.targetPose)
    }
    else {
      resolved.targetPose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.targetTwist !== undefined) {
      resolved.targetTwist = geometry_msgs.msg.TwistStamped.Resolve(msg.targetTwist)
    }
    else {
      resolved.targetTwist = new geometry_msgs.msg.TwistStamped()
    }

    if (msg.kappa !== undefined) {
      resolved.kappa = msg.kappa;
    }
    else {
      resolved.kappa = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: NavRequest,
  Response: NavResponse,
  md5sum() { return '4c1397c5940b771e71cd0ee42abe5307'; },
  datatype() { return 'styx_msgs/Nav'; }
};
