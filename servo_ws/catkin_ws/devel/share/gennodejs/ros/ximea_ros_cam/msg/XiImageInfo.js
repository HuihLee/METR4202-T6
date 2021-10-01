// Auto-generated. Do not edit!

// (in-package ximea_ros_cam.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class XiImageInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.size = null;
      this.bp_size = null;
      this.frm = null;
      this.width = null;
      this.height = null;
      this.nframe = null;
      this.tsSec = null;
      this.tsUSec = null;
      this.GPI_level = null;
      this.black_level = null;
      this.padding_x = null;
      this.AbsoluteOffsetX = null;
      this.AbsoluteOffsetY = null;
      this.exposure_time_us = null;
      this.gain_db = null;
      this.acq_nframe = null;
      this.image_user_data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0;
      }
      if (initObj.hasOwnProperty('bp_size')) {
        this.bp_size = initObj.bp_size
      }
      else {
        this.bp_size = 0;
      }
      if (initObj.hasOwnProperty('frm')) {
        this.frm = initObj.frm
      }
      else {
        this.frm = 0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('nframe')) {
        this.nframe = initObj.nframe
      }
      else {
        this.nframe = 0;
      }
      if (initObj.hasOwnProperty('tsSec')) {
        this.tsSec = initObj.tsSec
      }
      else {
        this.tsSec = 0;
      }
      if (initObj.hasOwnProperty('tsUSec')) {
        this.tsUSec = initObj.tsUSec
      }
      else {
        this.tsUSec = 0;
      }
      if (initObj.hasOwnProperty('GPI_level')) {
        this.GPI_level = initObj.GPI_level
      }
      else {
        this.GPI_level = 0;
      }
      if (initObj.hasOwnProperty('black_level')) {
        this.black_level = initObj.black_level
      }
      else {
        this.black_level = 0;
      }
      if (initObj.hasOwnProperty('padding_x')) {
        this.padding_x = initObj.padding_x
      }
      else {
        this.padding_x = 0;
      }
      if (initObj.hasOwnProperty('AbsoluteOffsetX')) {
        this.AbsoluteOffsetX = initObj.AbsoluteOffsetX
      }
      else {
        this.AbsoluteOffsetX = 0;
      }
      if (initObj.hasOwnProperty('AbsoluteOffsetY')) {
        this.AbsoluteOffsetY = initObj.AbsoluteOffsetY
      }
      else {
        this.AbsoluteOffsetY = 0;
      }
      if (initObj.hasOwnProperty('exposure_time_us')) {
        this.exposure_time_us = initObj.exposure_time_us
      }
      else {
        this.exposure_time_us = 0;
      }
      if (initObj.hasOwnProperty('gain_db')) {
        this.gain_db = initObj.gain_db
      }
      else {
        this.gain_db = 0.0;
      }
      if (initObj.hasOwnProperty('acq_nframe')) {
        this.acq_nframe = initObj.acq_nframe
      }
      else {
        this.acq_nframe = 0;
      }
      if (initObj.hasOwnProperty('image_user_data')) {
        this.image_user_data = initObj.image_user_data
      }
      else {
        this.image_user_data = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type XiImageInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _serializer.uint32(obj.size, buffer, bufferOffset);
    // Serialize message field [bp_size]
    bufferOffset = _serializer.uint32(obj.bp_size, buffer, bufferOffset);
    // Serialize message field [frm]
    bufferOffset = _serializer.uint32(obj.frm, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.uint32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.uint32(obj.height, buffer, bufferOffset);
    // Serialize message field [nframe]
    bufferOffset = _serializer.uint32(obj.nframe, buffer, bufferOffset);
    // Serialize message field [tsSec]
    bufferOffset = _serializer.uint32(obj.tsSec, buffer, bufferOffset);
    // Serialize message field [tsUSec]
    bufferOffset = _serializer.uint32(obj.tsUSec, buffer, bufferOffset);
    // Serialize message field [GPI_level]
    bufferOffset = _serializer.uint32(obj.GPI_level, buffer, bufferOffset);
    // Serialize message field [black_level]
    bufferOffset = _serializer.uint32(obj.black_level, buffer, bufferOffset);
    // Serialize message field [padding_x]
    bufferOffset = _serializer.uint32(obj.padding_x, buffer, bufferOffset);
    // Serialize message field [AbsoluteOffsetX]
    bufferOffset = _serializer.uint32(obj.AbsoluteOffsetX, buffer, bufferOffset);
    // Serialize message field [AbsoluteOffsetY]
    bufferOffset = _serializer.uint32(obj.AbsoluteOffsetY, buffer, bufferOffset);
    // Serialize message field [exposure_time_us]
    bufferOffset = _serializer.uint32(obj.exposure_time_us, buffer, bufferOffset);
    // Serialize message field [gain_db]
    bufferOffset = _serializer.float32(obj.gain_db, buffer, bufferOffset);
    // Serialize message field [acq_nframe]
    bufferOffset = _serializer.uint32(obj.acq_nframe, buffer, bufferOffset);
    // Serialize message field [image_user_data]
    bufferOffset = _serializer.uint32(obj.image_user_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type XiImageInfo
    let len;
    let data = new XiImageInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [bp_size]
    data.bp_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [frm]
    data.frm = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [nframe]
    data.nframe = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [tsSec]
    data.tsSec = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [tsUSec]
    data.tsUSec = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [GPI_level]
    data.GPI_level = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [black_level]
    data.black_level = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [padding_x]
    data.padding_x = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [AbsoluteOffsetX]
    data.AbsoluteOffsetX = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [AbsoluteOffsetY]
    data.AbsoluteOffsetY = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [exposure_time_us]
    data.exposure_time_us = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [gain_db]
    data.gain_db = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acq_nframe]
    data.acq_nframe = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [image_user_data]
    data.image_user_data = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ximea_ros_cam/XiImageInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1e504126cf849c6656990d903d08e2ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint32 size
    uint32 bp_size
    uint32 frm
    uint32 width
    uint32 height
    uint32 nframe
    uint32 tsSec
    uint32 tsUSec
    uint32 GPI_level
    uint32 black_level
    uint32 padding_x
    uint32 AbsoluteOffsetX
    uint32 AbsoluteOffsetY
    uint32 exposure_time_us
    float32 gain_db
    uint32 acq_nframe
    uint32 image_user_data
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new XiImageInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0
    }

    if (msg.bp_size !== undefined) {
      resolved.bp_size = msg.bp_size;
    }
    else {
      resolved.bp_size = 0
    }

    if (msg.frm !== undefined) {
      resolved.frm = msg.frm;
    }
    else {
      resolved.frm = 0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.nframe !== undefined) {
      resolved.nframe = msg.nframe;
    }
    else {
      resolved.nframe = 0
    }

    if (msg.tsSec !== undefined) {
      resolved.tsSec = msg.tsSec;
    }
    else {
      resolved.tsSec = 0
    }

    if (msg.tsUSec !== undefined) {
      resolved.tsUSec = msg.tsUSec;
    }
    else {
      resolved.tsUSec = 0
    }

    if (msg.GPI_level !== undefined) {
      resolved.GPI_level = msg.GPI_level;
    }
    else {
      resolved.GPI_level = 0
    }

    if (msg.black_level !== undefined) {
      resolved.black_level = msg.black_level;
    }
    else {
      resolved.black_level = 0
    }

    if (msg.padding_x !== undefined) {
      resolved.padding_x = msg.padding_x;
    }
    else {
      resolved.padding_x = 0
    }

    if (msg.AbsoluteOffsetX !== undefined) {
      resolved.AbsoluteOffsetX = msg.AbsoluteOffsetX;
    }
    else {
      resolved.AbsoluteOffsetX = 0
    }

    if (msg.AbsoluteOffsetY !== undefined) {
      resolved.AbsoluteOffsetY = msg.AbsoluteOffsetY;
    }
    else {
      resolved.AbsoluteOffsetY = 0
    }

    if (msg.exposure_time_us !== undefined) {
      resolved.exposure_time_us = msg.exposure_time_us;
    }
    else {
      resolved.exposure_time_us = 0
    }

    if (msg.gain_db !== undefined) {
      resolved.gain_db = msg.gain_db;
    }
    else {
      resolved.gain_db = 0.0
    }

    if (msg.acq_nframe !== undefined) {
      resolved.acq_nframe = msg.acq_nframe;
    }
    else {
      resolved.acq_nframe = 0
    }

    if (msg.image_user_data !== undefined) {
      resolved.image_user_data = msg.image_user_data;
    }
    else {
      resolved.image_user_data = 0
    }

    return resolved;
    }
};

module.exports = XiImageInfo;
