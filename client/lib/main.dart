import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grpc_app/theme/theme.dart';
import 'package:grpc_app/ui/pages/root_page/root_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: GrpcApp(),
    ),
  );
}

class GrpcApp extends HookWidget {
  const GrpcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GrpcAppTheme.themeData,
      home: const RootPage(),
    );
  }
}
