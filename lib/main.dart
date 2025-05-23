import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/config/router/app_router.dart';
import 'package:widgetsapp/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedColor = ref.watch(selectedIndexColorProvider);
    // final isDarkMode = ref.watch(themeProvider);
    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme:
          //   AppTheme(
          //   // selectedColor: selectedColor,
          //   // isDarkMode: isDarkMode,
          // ).getTheme(),
          appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
