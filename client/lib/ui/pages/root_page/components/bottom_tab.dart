// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:grpc_app/ui/pages/root_page/components/bottom_tab_item.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomTabProvider = ChangeNotifierProvider((ref) => BottomTab());

class BottomTab extends ChangeNotifier {
  BottomTabItem _item = BottomTabItem.home;
  BottomTabItem _oldItem = BottomTabItem.home;

  BottomTabItem get item => _item;
  BottomTabItem get oldItem => _oldItem;

  void select(BottomTabItem newItem) {
    _oldItem = item;
    _item = newItem;
    notifyListeners();
  }
}
