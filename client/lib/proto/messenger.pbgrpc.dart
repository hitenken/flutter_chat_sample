///
//  Generated code. Do not modify.
//  source: messenger.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'messenger.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'messenger.pb.dart';

class MessangerClient extends $grpc.Client {
  static final _$sendMessage =
      $grpc.ClientMethod<$0.MessageSendRequest, $0.MessageSendResponse>(
          '/messanger.Messanger/SendMessage',
          ($0.MessageSendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MessageSendResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$1.Empty, $0.Message>(
      '/messanger.Messanger/GetMessages',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  MessangerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MessageSendResponse> sendMessage(
      $0.MessageSendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.Message> getMessages($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$getMessages, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class MessangerServiceBase extends $grpc.Service {
  $core.String get $name => 'messanger.Messanger';

  MessangerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.MessageSendRequest, $0.MessageSendResponse>(
            'SendMessage',
            sendMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MessageSendRequest.fromBuffer(value),
            ($0.MessageSendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Message>(
        'GetMessages',
        getMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.MessageSendResponse> sendMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.MessageSendRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.Message> getMessages_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* getMessages(call, await request);
  }

  $async.Future<$0.MessageSendResponse> sendMessage(
      $grpc.ServiceCall call, $0.MessageSendRequest request);
  $async.Stream<$0.Message> getMessages(
      $grpc.ServiceCall call, $1.Empty request);
}
