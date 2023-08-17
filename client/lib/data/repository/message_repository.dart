import 'package:grpc/grpc.dart';
import 'package:grpc_app/proto/google/protobuf/empty.pb.dart';
import 'package:grpc_app/proto/messenger.pbgrpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageRepositoryProvider = Provider((ref) => MessangerRepository());

class MessangerRepository {
  final messangeClient = MessangerClient(
    ClientChannel(
      '127.0.0.1',
      port: 3000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
    options: CallOptions(timeout: const Duration(seconds: 30)),
  );

  Future<void> sendTextMessage(MessageSendRequest request) async {
    final response = await messangeClient.sendMessage(request);
  }

  ResponseStream<Message> getMessage() {
    return messangeClient.getMessages(Empty.create());
  }
}
