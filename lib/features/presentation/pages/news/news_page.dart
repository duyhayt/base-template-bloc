import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage(name: 'NewsRoute')
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(AppLocalizations.of(context)!.title_news),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text("News Page"),
      ),
    );
  }
}
