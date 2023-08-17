///
//  Generated code. Do not modify.
//  source: messenger.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageSendRequestDescriptor instead')
const MessageSendRequest$json = const {
  '1': 'MessageSendRequest',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'sendUserId', '3': 2, '4': 1, '5': 9, '10': 'sendUserId'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `MessageSendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSendRequestDescriptor = $convert.base64Decode('ChJNZXNzYWdlU2VuZFJlcXVlc3QSEgoEYm9keRgBIAEoCVIEYm9keRIeCgpzZW5kVXNlcklkGAIgASgJUgpzZW5kVXNlcklkEjgKCWNyZWF0ZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdA==');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEhIKBGJvZHkYASABKAlSBGJvZHk=');
@$core.Deprecated('Use messageSendResponseDescriptor instead')
const MessageSendResponse$json = const {
  '1': 'MessageSendResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
  ],
};

/// Descriptor for `MessageSendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSendResponseDescriptor = $convert.base64Decode('ChNNZXNzYWdlU2VuZFJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoCFIGcmVzdWx0');
