// Auto-generated. Do not edit!

// (in-package global_planer.srv)


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
      this.pose = null;
    }
    else {
      if (initObj.hasOwnProperty('currentTime')) {
        this.currentTime = initObj.currentTime
      }
      else {
        this.currentTime = 0;
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.PoseStamped();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavRequest
    // Serialize message field [currentTime]
    bufferOffset = _serializer.int32(obj.currentTime, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavRequest
    let len;
    let data = new NavRequest(null);
    // Deserialize message field [currentTime]
    data.currentTime = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.pose);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'global_planer/NavRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '37c6ae066e99ce621e10b6cb77f6217f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Client 
    int32 currentTime
    geometry_msgs/PoseStamped pose
    
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
      resolved.currentTime = 0
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.PoseStamped.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.PoseStamped()
    }

    return resolved;
    }
};

class NavResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.twist = null;
    }
    else {
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new geometry_msgs.msg.TwistStamped();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavResponse
    // Serialize message field [twist]
    bufferOffset = geometry_msgs.msg.TwistStamped.serialize(obj.twist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavResponse
    let len;
    let data = new NavResponse(null);
    // Deserialize message field [twist]
    data.twist = geometry_msgs.msg.TwistStamped.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.TwistStamped.getMessageSize(object.twist);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'global_planer/NavResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ee72deb066cef47f7a9ab9d33742d16';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Server
    geometry_msgs/TwistStamped twist
    
    
    
    ================================================================================
    MSG: geometry_msgs/TwistStamped
    # A twist with reference coordinate frame and timestamp
    Header header
    Twist twist
    
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
    if (msg.twist !== undefined) {
      resolved.twist = geometry_msgs.msg.TwistStamped.Resolve(msg.twist)
    }
    else {
      resolved.twist = new geometry_msgs.msg.TwistStamped()
    }

    return resolved;
    }
};

module.exports = {
  Request: NavRequest,
  Response: NavResponse,
  md5sum() { return 'dc45d88fed60392a91694173e2278679'; },
  datatype() { return 'global_planer/Nav'; }
};
