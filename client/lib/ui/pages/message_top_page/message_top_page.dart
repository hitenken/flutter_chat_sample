import 'package:flutter/material.dart';

import 'package:grpc_app/ui/pages/message_detail_page/message_detail_page.dart';

class MessageTopPage extends StatelessWidget {
  const MessageTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goToMessageDetailPage(context),
          child: const Text('Go'),
        ),
      ),
    );
  }

  void _goToMessageDetailPage(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .push<dynamic>(MessageDetailPage.route());
  }
}
