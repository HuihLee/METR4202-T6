// Auto-generated. Do not edit!

// (in-package control_logic_node.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TrajectoryComplete {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.complete = null;
    }
    else {
      if (initObj.hasOwnProperty('complete')) {
        this.complete = initObj.complete
      }
      else {
        this.complete = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryComplete
    // Serialize message field [complete]
    bufferOffset = _serializer.bool(obj.complete, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryComplete
    let len;
    let data = new TrajectoryComplete(null);
    // Deserialize message field [complete]
    data.complete = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'control_logic_node/TrajectoryComplete';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9d8061d2347621a6ed88451e28811cc7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool complete
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrajectoryComplete(null);
    if (msg.complete !== undefined) {
      resolved.complete = msg.complete;
    }
    else {
      resolved.complete = false
    }

    return resolved;
    }
};

module.exports = TrajectoryComplete;
