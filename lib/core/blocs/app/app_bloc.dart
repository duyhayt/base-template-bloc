import 'package:base_template_bloc/core/blocs/app/app_event.dart';
import 'package:base_template_bloc/core/blocs/app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState());
}
