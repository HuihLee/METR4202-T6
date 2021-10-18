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

class TargetJointStateTrajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.thetasTarget = null;
      this.thetasCurrent = null;
      this.motionDuration = null;
    }
    else {
      if (initObj.hasOwnProperty('thetasTarget')) {
        this.thetasTarget = initObj.thetasTarget
      }
      else {
        this.thetasTarget = new Array(5).fill(0);
      }
      if (initObj.hasOwnProperty('thetasCurrent')) {
        this.thetasCurrent = initObj.thetasCurrent
      }
      else {
        this.thetasCurrent = new Array(5).fill(0);
      }
      if (initObj.hasOwnProperty('motionDuration')) {
        this.motionDuration = initObj.motionDuration
      }
      else {
        this.motionDuration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TargetJointStateTrajectory
    // Check that the constant length array field [thetasTarget] has the right length
    if (obj.thetasTarget.length !== 5) {
      throw new Error('Unable to serialize array field thetasTarget - length must be 5')
    }
    // Serialize message field [thetasTarget]
    bufferOffset = _arraySerializer.float32(obj.thetasTarget, buffer, bufferOffset, 5);
    // Check that the constant length array field [thetasCurrent] has the right length
    if (obj.thetasCurrent.length !== 5) {
      throw new Error('Unable to serialize array field thetasCurrent - length must be 5')
    }
    // Serialize message field [thetasCurrent]
    bufferOffset = _arraySerializer.float32(obj.thetasCurrent, buffer, bufferOffset, 5);
    // Serialize message field [motionDuration]
    bufferOffset = _serializer.float32(obj.motionDuration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TargetJointStateTrajectory
    let len;
    let data = new TargetJointStateTrajectory(null);
    // Deserialize message field [thetasTarget]
    data.thetasTarget = _arrayDeserializer.float32(buffer, bufferOffset, 5)
    // Deserialize message field [thetasCurrent]
    data.thetasCurrent = _arrayDeserializer.float32(buffer, bufferOffset, 5)
    // Deserialize message field [motionDuration]
    data.motionDuration = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'control_logic_node/TargetJointStateTrajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c4cbd25bd8b636d456c17a3edf6fce06';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[5] thetasTarget
    float32[5] thetasCurrent
    float32 motionDuration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TargetJointStateTrajectory(null);
    if (msg.thetasTarget !== undefined) {
      resolved.thetasTarget = msg.thetasTarget;
    }
    else {
      resolved.thetasTarget = new Array(5).fill(0)
    }

    if (msg.thetasCurrent !== undefined) {
      resolved.thetasCurrent = msg.thetasCurrent;
    }
    else {
      resolved.thetasCurrent = new Array(5).fill(0)
    }

    if (msg.motionDuration !== undefined) {
      resolved.motionDuration = msg.motionDuration;
    }
    else {
      resolved.motionDuration = 0.0
    }

    return resolved;
    }
};

module.exports = TargetJointStateTrajectory;
