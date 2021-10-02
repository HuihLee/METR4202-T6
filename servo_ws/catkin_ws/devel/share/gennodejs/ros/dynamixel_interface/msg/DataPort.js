// Auto-generated. Do not edit!

// (in-package dynamixel_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DataPort {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.port_values = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('port_values')) {
        this.port_values = initObj.port_values
      }
      else {
        this.port_values = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DataPort
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [port_values]
    bufferOffset = _arraySerializer.uint16(obj.port_values, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DataPort
    let len;
    let data = new DataPort(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [port_values]
    data.port_values = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += 2 * object.port_values.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamixel_interface/DataPort';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b6c6004f40f6ef774b6478f360fb7d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name #name of joint
    uint16[] port_values #array of port GPIO values [0,1] for digital or [0,4095] for analog
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DataPort(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.port_values !== undefined) {
      resolved.port_values = msg.port_values;
    }
    else {
      resolved.port_values = []
    }

    return resolved;
    }
};

module.exports = DataPort;
