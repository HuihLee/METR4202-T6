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

class CurrentJointState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.thetas = null;
    }
    else {
      if (initObj.hasOwnProperty('thetas')) {
        this.thetas = initObj.thetas
      }
      else {
        this.thetas = new Array(5).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CurrentJointState
    // Check that the constant length array field [thetas] has the right length
    if (obj.thetas.length !== 5) {
      throw new Error('Unable to serialize array field thetas - length must be 5')
    }
    // Serialize message field [thetas]
    bufferOffset = _arraySerializer.float32(obj.thetas, buffer, bufferOffset, 5);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CurrentJointState
    let len;
    let data = new CurrentJointState(null);
    // Deserialize message field [thetas]
    data.thetas = _arrayDeserializer.float32(buffer, bufferOffset, 5)
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'control_logic_node/CurrentJointState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dcf2dca9789fea2e3dbb6efc5dedb2ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[5] thetas
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CurrentJointState(null);
    if (msg.thetas !== undefined) {
      resolved.thetas = msg.thetas;
    }
    else {
      resolved.thetas = new Array(5).fill(0)
    }

    return resolved;
    }
};

module.exports = CurrentJointState;
