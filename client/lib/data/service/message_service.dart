import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:grpc_app/data/repository/message_repository.dart';
import 'package:grpc_app/proto/google/protobuf/timestamp.pb.dart';
import 'package:grpc_app/proto/messenger.pbgrpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageServiceProvider = Provider((ref) => MessangeService(ref.read));

class MessangeService {
  MessangeService(this._reader);

  final Reader _reader;
  late final MessangerRepository _repository =
      _reader(messageRepositoryProvider);

  void sendMessage(types.PartialText text, types.User user) {
    final request = MessageSendRequest(
      body: text.text,
      sendUserId: user.id,
      createdAt: Timestamp.fromDateTime(DateTime.now()),
    );
    _repository.sendTextMessage(request);
  }

  Stream<types.TextMessage> subscribe() {
    return _repository.getMessage().map(
          (message) => types.TextMessage(
            text: message.body,
            id: '1',
            author: types.User(id: '11'),
          ),
        );
  }
}
