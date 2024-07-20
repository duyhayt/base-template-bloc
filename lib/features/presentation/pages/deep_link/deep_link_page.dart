import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'DeepLinkRoute')
class DeepLinkPage extends StatelessWidget {
  const DeepLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                AppBar(
                  title: Text(AppLocalizations.of(context)!.title_setting),
                  centerTitle: true,
                ),
                const Expanded(child: Center(child: Text("Deep Link Page"))),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 30.0, right: 25.0),
                      child: Text("Create by Duy Ha")),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}
