// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:grpc_app/ui/pages/home_page/home_page.dart';
import 'package:grpc_app/ui/pages/message_top_page/message_top_page.dart';

enum BottomTabItem { home, message }

extension BottomTabItemExtension on BottomTabItem {
  String get title {
    switch (this) {
      case BottomTabItem.home:
        return 'ホーム';
      case BottomTabItem.message:
        return 'メッセージ';
    }
  }

  IconData get iconData {
    switch (this) {
      case BottomTabItem.home:
        return Icons.home;
      case BottomTabItem.message:
        return Icons.chat;
    }
  }

  Widget get page {
    switch (this) {
      case BottomTabItem.home:
        return const HomePage();
      case BottomTabItem.message:
        return const MessageTopPage();
    }
  }
}
