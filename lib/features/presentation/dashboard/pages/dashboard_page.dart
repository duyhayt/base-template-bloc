import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/config/routes/routes.gr.dart';
import 'package:base_template_bloc/features/presentation/dashboard/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [
          HomeRoute(),
          NewsRoute(),
          SettingRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigation(tabsRouter: tabsRouter),
          );
        });
  }
}
