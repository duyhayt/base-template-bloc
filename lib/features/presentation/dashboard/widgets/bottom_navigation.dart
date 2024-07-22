import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigation extends StatelessWidget {
  final TabsRouter tabsRouter;
  const BottomNavigation({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
