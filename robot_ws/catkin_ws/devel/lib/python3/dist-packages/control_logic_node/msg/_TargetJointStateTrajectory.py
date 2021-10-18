# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from control_logic_node/TargetJointStateTrajectory.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class TargetJointStateTrajectory(genpy.Message):
  _md5sum = "c4cbd25bd8b636d456c17a3edf6fce06"
  _type = "control_logic_node/TargetJointStateTrajectory"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32[5] thetasTarget
float32[5] thetasCurrent
float32 motionDuration
"""
  __slots__ = ['thetasTarget','thetasCurrent','motionDuration']
  _slot_types = ['float32[5]','float32[5]','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       thetasTarget,thetasCurrent,motionDuration

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(TargetJointStateTrajectory, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.thetasTarget is None:
        self.thetasTarget = [0.] * 5
      if self.thetasCurrent is None:
        self.thetasCurrent = [0.] * 5
      if self.motionDuration is None:
        self.motionDuration = 0.
    else:
      self.thetasTarget = [0.] * 5
      self.thetasCurrent = [0.] * 5
      self.motionDuration = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      buff.write(_get_struct_5f().pack(*self.thetasTarget))
      buff.write(_get_struct_5f().pack(*self.thetasCurrent))
      _x = self.motionDuration
      buff.write(_get_struct_f().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 20
      self.thetasTarget = _get_struct_5f().unpack(str[start:end])
      start = end
      end += 20
      self.thetasCurrent = _get_struct_5f().unpack(str[start:end])
      start = end
      end += 4
      (self.motionDuration,) = _get_struct_f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      buff.write(self.thetasTarget.tostring())
      buff.write(self.thetasCurrent.tostring())
      _x = self.motionDuration
      buff.write(_get_struct_f().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 20
      self.thetasTarget = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=5)
      start = end
      end += 20
      self.thetasCurrent = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=5)
      start = end
      end += 4
      (self.motionDuration,) = _get_struct_f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_5f = None
def _get_struct_5f():
    global _struct_5f
    if _struct_5f is None:
        _struct_5f = struct.Struct("<5f")
    return _struct_5f
_struct_f = None
def _get_struct_f():
    global _struct_f
    if _struct_f is None:
        _struct_f = struct.Struct("<f")
    return _struct_f
