// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'components/bottom_tab.dart';
import 'components/bottom_tab_item.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  // MARK: - Route
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RootPage(),
    );
  }

  // MARK: - Build
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomTab = ref.watch(bottomTabProvider);
    final controller = _useCupertinoTabController()
      ..index = bottomTab.item.index;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        inactiveColor: const Color(0xFFC7C7C7),
        onTap: (index) => bottomTab.select(BottomTabItem.values[index]),
        items: BottomTabItem.values
            .map(
              (BottomTabItem bottomTabItem) => BottomNavigationBarItem(
                icon: Icon(bottomTabItem.iconData),
                label: bottomTabItem.title,
              ),
            )
            .toList(),
      ),
      controller: controller,
      tabBuilder: (_, index) => CupertinoTabView(
        builder: (_) => BottomTabItem.values[index].page,
      ),
    );
  }

  CupertinoTabController _useCupertinoTabController() {
    final controller = useMemoized(CupertinoTabController.new);
    useEffect(
      () {
        return controller.dispose;
      },
      [controller],
    );
    return controller;
  }
}
