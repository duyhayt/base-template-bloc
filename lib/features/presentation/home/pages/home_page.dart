import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/features/presentation/home/widgets/posts.dart';
import 'package:base_template_bloc/features/presentation/home/widgets/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.title_home),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined))
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(child: ListPost()),
                Expanded(child: ListUser()),
              ],
            )));
  }
}
