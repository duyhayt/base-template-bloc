import 'package:base_template_bloc/config/theme/app_theme.dart';
import 'package:base_template_bloc/core/blocs/service/service_bloc.dart';
import 'package:base_template_bloc/core/blocs/service/service_event.dart';
import 'package:base_template_bloc/core/blocs/service/service_state.dart';
import 'package:base_template_bloc/l10n/models/language_model.dart';
import 'package:base_template_bloc/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(AppLocalizations.of(context)!.title_setting),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 24, right: 24),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/user.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text("Duy Hà"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding:
                  const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.workspace_premium_outlined, size: 18),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        AppLocalizations.of(context)!.setting_member,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.setting_upgrade,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Column(
                children: <Widget>[
                  singleOption(
                      iconData: Icons.location_on_outlined,
                      option: AppLocalizations.of(context)!.setting_address),
                  const Divider(),
                  BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      return changeTheme(
                        iconData: state.themeData == AppTheme.lightTheme
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        option: AppLocalizations.of(context)!.setting_theme,
                      );
                    },
                  ),
                  const Divider(),
                  singleOption(
                    onTap: () {},
                    iconData: Icons.info_outlined,
                    option: AppLocalizations.of(context)!.setting_info,
                  ),
                  const Divider(),
                  changeLanguages(
                    iconData: Icons.language_sharp,
                    option: AppLocalizations.of(context)!.setting_language,
                  ),
                  const Divider(),
                  singleOption(
                    iconData: Icons.face,
                    option: AppLocalizations.of(context)!.setting_help,
                  ),
                  const Divider(),
                  singleOption(
                    onTap: () {},
                    iconData: Icons.http,
                    option: AppLocalizations.of(context)!.setting_deeplink,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Colors.grey.withOpacity(0.7)),
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ))),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(
                            Icons.logout_outlined,
                            size: 18,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: Text(
                              AppLocalizations.of(context)!.setting_logout,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleOption(
      {IconData? iconData, required String option, Function()? onTap}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 22,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(option),
              ),
            ),
            const Icon(Icons.arrow_right, size: 22),
          ],
        ),
      ),
    );
  }

  Widget changeLanguages(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: () {
          if (navigation != null) {}
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 22,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(option),
              ),
            ),
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                return CupertinoSwitch(
                  activeColor: Colors.blueAccent,
                  value: state.selectedLanguage == Language.vietnamese,
                  onChanged: (value) {
                    context.read<ServiceBloc>().add(ChangeLanguage(
                        selectedLanguage:
                            value ? Language.vietnamese : Language.english));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget changeTheme(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: () {
          if (navigation != null) {}
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 22,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(option),
              ),
            ),
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                return CupertinoSwitch(
                  activeColor: Colors.blueAccent,
                  value: state.themeType == ThemeType.dark,
                  onChanged: (value) {
                    context.read<ServiceBloc>().add(ChangeTheme(
                        themeData:
                            value ? AppTheme.darkTheme : AppTheme.lightTheme));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
