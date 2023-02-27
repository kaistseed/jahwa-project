# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: spi.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\tspi.proto\x12\x03spi\"\x1c\n\x1a\x43onfigureDACChannel0Packet\"m\n\x1c\x43onfigureDACChannel0Response\x12\x16\n\x0eoperation_name\x18\x01 \x01(\t\x12\x12\n\nstart_time\x18\x02 \x01(\t\x12\x10\n\x08\x65nd_time\x18\x03 \x01(\t\x12\x0f\n\x07success\x18\x04 \x01(\x08\"\x1c\n\x1a\x43onfigureDACChannel1Packet\"m\n\x1c\x43onfigureDACChannel1Response\x12\x16\n\x0eoperation_name\x18\x01 \x01(\t\x12\x12\n\nstart_time\x18\x02 \x01(\t\x12\x10\n\x08\x65nd_time\x18\x03 \x01(\t\x12\x0f\n\x07success\x18\x04 \x01(\x08\"\x1c\n\x1a\x43onfigureDACChannel2Packet\"m\n\x1c\x43onfigureDACChannel2Response\x12\x16\n\x0eoperation_name\x18\x01 \x01(\t\x12\x12\n\nstart_time\x18\x02 \x01(\t\x12\x10\n\x08\x65nd_time\x18\x03 \x01(\t\x12\x0f\n\x07success\x18\x04 \x01(\x08\x32\x9f\x02\n\x03SPI\x12\\\n\x14\x43onfigureDACChannel0\x12\x1f.spi.ConfigureDACChannel0Packet\x1a!.spi.ConfigureDACChannel0Response\"\x00\x12\\\n\x14\x43onfigureDACChannel1\x12\x1f.spi.ConfigureDACChannel1Packet\x1a!.spi.ConfigureDACChannel1Response\"\x00\x12\\\n\x14\x43onfigureDACChannel2\x12\x1f.spi.ConfigureDACChannel2Packet\x1a!.spi.ConfigureDACChannel2Response\"\x00\x62\x06proto3')



_CONFIGUREDACCHANNEL0PACKET = DESCRIPTOR.message_types_by_name['ConfigureDACChannel0Packet']
_CONFIGUREDACCHANNEL0RESPONSE = DESCRIPTOR.message_types_by_name['ConfigureDACChannel0Response']
_CONFIGUREDACCHANNEL1PACKET = DESCRIPTOR.message_types_by_name['ConfigureDACChannel1Packet']
_CONFIGUREDACCHANNEL1RESPONSE = DESCRIPTOR.message_types_by_name['ConfigureDACChannel1Response']
_CONFIGUREDACCHANNEL2PACKET = DESCRIPTOR.message_types_by_name['ConfigureDACChannel2Packet']
_CONFIGUREDACCHANNEL2RESPONSE = DESCRIPTOR.message_types_by_name['ConfigureDACChannel2Response']
ConfigureDACChannel0Packet = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel0Packet', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL0PACKET,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel0Packet)
  })
_sym_db.RegisterMessage(ConfigureDACChannel0Packet)

ConfigureDACChannel0Response = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel0Response', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL0RESPONSE,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel0Response)
  })
_sym_db.RegisterMessage(ConfigureDACChannel0Response)

ConfigureDACChannel1Packet = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel1Packet', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL1PACKET,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel1Packet)
  })
_sym_db.RegisterMessage(ConfigureDACChannel1Packet)

ConfigureDACChannel1Response = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel1Response', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL1RESPONSE,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel1Response)
  })
_sym_db.RegisterMessage(ConfigureDACChannel1Response)

ConfigureDACChannel2Packet = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel2Packet', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL2PACKET,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel2Packet)
  })
_sym_db.RegisterMessage(ConfigureDACChannel2Packet)

ConfigureDACChannel2Response = _reflection.GeneratedProtocolMessageType('ConfigureDACChannel2Response', (_message.Message,), {
  'DESCRIPTOR' : _CONFIGUREDACCHANNEL2RESPONSE,
  '__module__' : 'spi_pb2'
  # @@protoc_insertion_point(class_scope:spi.ConfigureDACChannel2Response)
  })
_sym_db.RegisterMessage(ConfigureDACChannel2Response)

_SPI = DESCRIPTOR.services_by_name['SPI']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _CONFIGUREDACCHANNEL0PACKET._serialized_start=18
  _CONFIGUREDACCHANNEL0PACKET._serialized_end=46
  _CONFIGUREDACCHANNEL0RESPONSE._serialized_start=48
  _CONFIGUREDACCHANNEL0RESPONSE._serialized_end=157
  _CONFIGUREDACCHANNEL1PACKET._serialized_start=159
  _CONFIGUREDACCHANNEL1PACKET._serialized_end=187
  _CONFIGUREDACCHANNEL1RESPONSE._serialized_start=189
  _CONFIGUREDACCHANNEL1RESPONSE._serialized_end=298
  _CONFIGUREDACCHANNEL2PACKET._serialized_start=300
  _CONFIGUREDACCHANNEL2PACKET._serialized_end=328
  _CONFIGUREDACCHANNEL2RESPONSE._serialized_start=330
  _CONFIGUREDACCHANNEL2RESPONSE._serialized_end=439
  _SPI._serialized_start=442
  _SPI._serialized_end=729
# @@protoc_insertion_point(module_scope)
