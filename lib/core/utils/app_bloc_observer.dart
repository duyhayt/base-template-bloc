import 'package:base_template_bloc/core/utils/logger.dart';
import 'package:base_template_bloc/core/utils/string_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BlocObserver] which logs all bloc state changes, errors and events.
class AppBlocObserver extends BlocObserver {
  /// [BlocObserver] which logs all bloc state changes, errors and events.
  const AppBlocObserver();

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final buffer = StringBuffer()
      ..write('BLOC: ${bloc.runtimeType} | ')
      ..writeln('${transition.event.runtimeType}')
      ..write('TRANSITION: ${transition.currentState.runtimeType}')
      ..writeln(' => ${transition.nextState.runtimeType}')
      ..write('NEW STATE: ${transition.nextState.toString().limit(100)}');
    logger.info(buffer.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final buffer = StringBuffer()
     ..writeln('ON EVENT :')
      ..writeln('BLOC: ${bloc.runtimeType}')
      ..write('EVENT: ${event.toString().limit(200)}');
    logger.info(buffer.toString());
    super.onEvent(bloc, event);
  }

    @override
  void onChange(BlocBase bloc, Change change) {
    // logger.info(
    //   'BLOC: ${bloc.runtimeType} (currentState) ${change.currentState} (changeState) ${change.nextState}',
    // );
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    logger.info('BlOC CREATED: -> ${bloc.runtimeType} ');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    logger.error(
      'BLOC: ${bloc.runtimeType} -> $error',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.info('Bloc CLOSED -> ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
