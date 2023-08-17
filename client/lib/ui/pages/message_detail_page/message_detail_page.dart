import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:grpc_app/ui/pages/message_detail_page/message_datail_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageDetailPage extends HookConsumerWidget {
  const MessageDetailPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MessageDetailPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(messageDetailViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Chat(
          theme: DefaultChatTheme(
            inputMargin: const EdgeInsets.symmetric(horizontal: 5),
            inputBorderRadius: BorderRadius.circular(20),
          ),
          messages: viewModel.message,
          onSendPressed: viewModel.sendTextMessage,
          showUserAvatars: true,
          showUserNames: true,
          user: viewModel.user,
        ),
      ),
    );
  }
}
