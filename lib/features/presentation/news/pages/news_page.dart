import 'package:base_template_bloc/widgets/button.dart';
import 'package:base_template_bloc/widgets/custom/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context)!.title_news),
      ),
      body: Center(
          child: Button(
        title: "Go to Todo List",
        onPressed: () {},
      )),
    );
  }
}
