import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/config/routes/routes.gr.dart';

/// Using "flutter pub run build_runner build" or "dart run build_runner build --delete-conflicting-outputs" to generate route code.

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: NewsRoute.page),
            AutoRoute(
              page: SettingNavigationRoute.page,
              children: [
                AutoRoute(page: SettingRoute.page, initial: true),
                AutoRoute(page: InfoRoute.page),
              ],
            ),
          ],
        ),
        AutoRoute(page: InfoRoute.page),
        AutoRoute(page: TodoListRoute.page),
      ];
}
