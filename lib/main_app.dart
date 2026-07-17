

import 'package:chili_debug_view/chili_debug_view.dart';
import 'package:flutter/material.dart';
import 'package:localservice/core/routes/app_router.dart';
import 'package:localservice/core/styles/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darktheme,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return DebugView(
          app: child,
          navigatorKey: navigatorKey,
          showDebugViewButton: true,
        );
      },
    );
  }
}
