import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'router.dart';
import 'theme.dart';

class AIJDGeneratorApp extends ConsumerWidget {
  const AIJDGeneratorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'AI JD Generator',
      theme: AppTheme.lightTheme,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
