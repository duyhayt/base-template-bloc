import 'dart:async';

import 'package:base_template_bloc/config/navigation/app_navigation.dart';
import 'package:base_template_bloc/core/blocs/app/app_bloc.dart';
import 'package:base_template_bloc/core/blocs/service/service_bloc.dart';
import 'package:base_template_bloc/core/blocs/service/service_state.dart';
import 'package:base_template_bloc/core/utils/app_bloc_observer.dart';
import 'package:base_template_bloc/core/utils/logger.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  logger.runLogging(
    () => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.transformer = bloc_concurrency.sequential();
        Bloc.observer = const AppBlocObserver();
        await initializeDependencies(); // DI
        runApp(MultiBlocProvider(providers: [
          BlocProvider(create: (context) => sl<AppBloc>()),
          BlocProvider(create: (context) => sl<ServiceBloc>()),
        ], child: const MyApp()));
        configLoading();
      },
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
      return MaterialApp.router(
        routerConfig: AppNavigation.router,
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        theme: state.themeData,
        locale: state.selectedLanguage.value,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('vi'),
        ],
        builder: EasyLoading.init(),
      );
    });
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
