import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/features/presentation/blocs/dashboard/dashboard_cubit.dart';
import 'package:base_template_bloc/features/presentation/blocs/dashboard/dashboard_state.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_bloc.dart';
import 'package:base_template_bloc/features/presentation/pages/home/home_page.dart';
import 'package:base_template_bloc/features/presentation/pages/news/news_page.dart';
import 'package:base_template_bloc/features/presentation/pages/settings/setting_page.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage(name: 'DashboardRoute')
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var isCollapsed = true;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<DashboardCubit>()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: const Stack(
              children: [
                Body(),
              ],
            ),
            bottomNavigationBar: _buildBottomNav(context, isCollapsed),
          );
        },
      ),
    );
  }

  _buildBottomNav(BuildContext context, bool isCollapsed) {
    final selectedTab =
        context.select((DashboardCubit cubit) => cubit.state.tab.index);
    return Visibility(
      visible: isCollapsed,
      child: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) =>
            context.read<DashboardCubit>().setTab(DashboardTab.values[index]),
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

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((DashboardCubit cubit) => cubit.state.tab.index);
    return _buildMainBody(selectedTab);
  }

  _buildMainBody(int selectedTab) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: selectedTab,
            children: const [HomePage(), NewsPage(), SettingPage()],
          ),
        );
      },
    );
  }
}
