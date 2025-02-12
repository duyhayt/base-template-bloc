import 'package:base_template_bloc/features/presentation/home/pages/home_page.dart';
import 'package:base_template_bloc/features/presentation/info/pages/info_page.dart';
import 'package:base_template_bloc/features/presentation/login/pages/login_page.dart';
import 'package:base_template_bloc/features/presentation/main_wrapper/main_wrapper.dart';
import 'package:base_template_bloc/features/presentation/news/pages/news_page.dart';
import 'package:base_template_bloc/features/presentation/setting/pages/setting_page.dart';
import 'package:base_template_bloc/features/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();
  
  static String splash = "/splash";
  static String login = "/login";
  static String home = "/home";
  static String news = "/news";
  static String settings = "/settings";
  static String info = "/info";

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorNews =
      GlobalKey<NavigatorState>(debugLabel: 'shellNews');
  static final _shellNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: splash,
        name: "Splash",
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: login,
        name: "Login",
        builder: (context, state) => const LoginPage(),
      ),

      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: home,
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
                routes: const [
                  // GoRoute(
                  //   path: 'subHome',
                  //   name: 'subHome',
                  //   pageBuilder: (context, state) => CustomTransitionPage<void>(
                  //     key: state.pageKey,
                  //     child: const SubHomeView(),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) =>
                  //             FadeTransition(opacity: animation, child: child),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNews,
            routes: <RouteBase>[
              GoRoute(
                path: news,
                name: "News",
                builder: (BuildContext context, GoRouterState state) =>
                    const NewsPage(),
                routes: const [],
              ),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: settings,
                name: "Settings",
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingPage(),
                routes: const [],
              ),
            ],
          ),
        ],
      ),

      /// Player
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: info,
        name: "Info",
        builder: (context, state) => const InfoPage(),
      )
    ],
  );
}
