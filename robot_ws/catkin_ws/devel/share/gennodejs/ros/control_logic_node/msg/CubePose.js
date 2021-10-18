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

class CubePose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
      this.colour = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('colour')) {
        this.colour = initObj.colour
      }
      else {
        this.colour = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CubePose
    // Check that the constant length array field [position] has the right length
    if (obj.position.length !== 4) {
      throw new Error('Unable to serialize array field position - length must be 4')
    }
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, 4);
    // Serialize message field [colour]
    bufferOffset = _serializer.string(obj.colour, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CubePose
    let len;
    let data = new CubePose(null);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [colour]
    data.colour = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.colour);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'control_logic_node/CubePose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7da6dd3707216b2a7871c249c47975fa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[4] position 
    string colour
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CubePose(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = new Array(4).fill(0)
    }

    if (msg.colour !== undefined) {
      resolved.colour = msg.colour;
    }
    else {
      resolved.colour = ''
    }

    return resolved;
    }
};

module.exports = CubePose;
