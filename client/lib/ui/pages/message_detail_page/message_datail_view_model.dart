import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:grpc_app/data/service/message_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messageDetailViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) {
  return MessageDetailViewModel(ref.read);
});

class MessageDetailViewModel extends ChangeNotifier {
  MessageDetailViewModel(this._reader) {
    _subscribe();
  }

  final Reader _reader;
  late final MessangeService _service = _reader(messageServiceProvider);

  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  List<types.Message> get message => _messages;
  types.User get user => _user;

  void sendTextMessage(types.PartialText text) {
    _service.sendMessage(text, _user);
    notifyListeners();
  }

  void _subscribe() {
    _service.subscribe().listen((receivedMessage) {
      _messages.insert(0, receivedMessage);
      notifyListeners();
    });
  }
}
