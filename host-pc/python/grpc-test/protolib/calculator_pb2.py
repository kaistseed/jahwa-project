# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: calculator.proto
"""Generated protocol buffer code."""
from google.protobuf.internal import builder as _builder
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x10\x63\x61lculator.proto\x12\ncalculator\"x\n\x0fMultiplyRequest\x12\x38\n\x11operation_details\x18\x01 \x01(\x0b\x32\x1d.calculator.operation_details\x12\x14\n\x0c\x66irst_number\x18\x02 \x01(\x05\x12\x15\n\rsecond_number\x18\x03 \x01(\x05\"\\\n\x10MultiplyResponse\x12\x38\n\x11operation_details\x18\x01 \x01(\x0b\x32\x1d.calculator.operation_details\x12\x0e\n\x06result\x18\x02 \x01(\x05\"s\n\nAddRequest\x12\x38\n\x11operation_details\x18\x01 \x01(\x0b\x32\x1d.calculator.operation_details\x12\x14\n\x0c\x66irst_number\x18\x02 \x01(\x05\x12\x15\n\rsecond_number\x18\x03 \x01(\x05\"W\n\x0b\x41\x64\x64Response\x12\x38\n\x11operation_details\x18\x01 \x01(\x0b\x32\x1d.calculator.operation_details\x12\x0e\n\x06result\x18\x02 \x01(\x05\"{\n\x11operation_details\x12\x16\n\x0eoperation_name\x18\x01 \x01(\t\x12\x14\n\x0coperation_id\x18\x02 \x01(\x05\x12\x1c\n\x14operation_start_time\x18\x03 \x01(\t\x12\x1a\n\x12operation_end_time\x18\x04 \x01(\t2\x96\x01\n\x11\x43\x61lculatorService\x12G\n\x08Multiply\x12\x1b.calculator.MultiplyRequest\x1a\x1c.calculator.MultiplyResponse\"\x00\x12\x38\n\x03\x41\x64\x64\x12\x16.calculator.AddRequest\x1a\x17.calculator.AddResponse\"\x00\x62\x06proto3')

_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, globals())
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'calculator_pb2', globals())
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _MULTIPLYREQUEST._serialized_start=32
  _MULTIPLYREQUEST._serialized_end=152
  _MULTIPLYRESPONSE._serialized_start=154
  _MULTIPLYRESPONSE._serialized_end=246
  _ADDREQUEST._serialized_start=248
  _ADDREQUEST._serialized_end=363
  _ADDRESPONSE._serialized_start=365
  _ADDRESPONSE._serialized_end=452
  _OPERATION_DETAILS._serialized_start=454
  _OPERATION_DETAILS._serialized_end=577
  _CALCULATORSERVICE._serialized_start=580
  _CALCULATORSERVICE._serialized_end=730
# @@protoc_insertion_point(module_scope)
