import 'dart:async';
import 'package:base_template_bloc/config/routes/routes.dart';
import 'package:base_template_bloc/core/utils/app_bloc_observer.dart';
import 'package:base_template_bloc/core/utils/logger.dart';
import 'package:base_template_bloc/features/presentation/blocs/app/app_bloc.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:base_template_bloc/l10n/languages/language_bloc.dart';
import 'package:base_template_bloc/l10n/languages/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  logger.runLogging(
    () => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        Bloc.transformer = bloc_concurrency.sequential();
        Bloc.observer = const AppBlocObserver();
        // Cấu hình dependencies
        await initializeDependencies();
        runApp(MultiBlocProvider(providers: [
          BlocProvider(create: (context) => sl<AppBloc>()),
          BlocProvider(create: (context) => sl<ServiceBloc>()),
        ], child: MyApp()));
      },
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter =
      AppRouter(); // Nếu đặt trong build thì khi ấn hot reload => build lại toàn bộ dự án

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
      return MaterialApp.router(
        routerConfig: appRouter.config(),
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
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
      );
    });
  }
}
