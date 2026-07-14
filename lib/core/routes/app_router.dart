import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:localservice/core/routes/routes.dart';
import 'package:localservice/features/provider_info/presentation/page/provider_info.dart';
import 'package:localservice/features/search/presentation/page/search_screen.dart';
import 'package:localservice/features/main_home/presentation/main_home.dart';



final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final routes = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.providerInfo,
        builder: (context, state) => const ProviderInfo(),
      ),
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const MainHome(),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) {
          final category = state.uri.queryParameters['category'];
          return SearchScreen(initialCategory: category);
        },
      ),
    ],
  );
}
