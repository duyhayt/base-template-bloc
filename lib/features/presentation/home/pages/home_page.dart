import 'package:base_template_bloc/features/presentation/home/widgets/posts.dart';
import 'package:base_template_bloc/features/presentation/home/widgets/users.dart';
import 'package:base_template_bloc/widgets/custom/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(AppLocalizations.of(context)!.title_home),
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
