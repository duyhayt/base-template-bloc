import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/config/routes/routes.gr.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_bloc.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: AutoTabsRouter(
          routes: const [
            HomeRoute(),
            NewsRoute(),
            SettingRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: child,
              bottomNavigationBar: _buildBottomNav(context, tabsRouter),
            );
          }),
    );
  }

  _buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    return Visibility(
      child: BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: (value) => tabsRouter.setActiveIndex(value),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.title_home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add),
              label: AppLocalizations.of(context)!.title_news),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.title_setting),
        ],
      ),
    );
  }
}
