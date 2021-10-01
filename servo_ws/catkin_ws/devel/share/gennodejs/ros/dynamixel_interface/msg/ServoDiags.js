// Auto-generated. Do not edit!

// (in-package dynamixel_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ServoDiag = require('./ServoDiag.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ServoDiags {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.diagnostics = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('diagnostics')) {
        this.diagnostics = initObj.diagnostics
      }
      else {
        this.diagnostics = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ServoDiags
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [diagnostics]
    // Serialize the length for message field [diagnostics]
    bufferOffset = _serializer.uint32(obj.diagnostics.length, buffer, bufferOffset);
    obj.diagnostics.forEach((val) => {
      bufferOffset = ServoDiag.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ServoDiags
    let len;
    let data = new ServoDiags(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [diagnostics]
    // Deserialize array length for message field [diagnostics]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.diagnostics = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.diagnostics[i] = ServoDiag.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.diagnostics.forEach((val) => {
      length += ServoDiag.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_interface/ServoDiags';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0c439c1a732520d1c71cd95240a273a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    ServoDiag[] diagnostics #array of diagnostics messages for all dynamixels on bus
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
    MSG: dynamixel_interface/ServoDiag
    string name #name of joint
    uint8 id  #id on bus
    string model_name #model name
    uint8 error_code # error code
    float64 voltage #current voltage
    float64 temperature #current temperature
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ServoDiags(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.diagnostics !== undefined) {
      resolved.diagnostics = new Array(msg.diagnostics.length);
      for (let i = 0; i < resolved.diagnostics.length; ++i) {
        resolved.diagnostics[i] = ServoDiag.Resolve(msg.diagnostics[i]);
      }
    }
    else {
      resolved.diagnostics = []
    }

    return resolved;
    }
};

module.exports = ServoDiags;
