import 'package:base_template_bloc/features/domain/usecases/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginUseCase get loginUseCase => _loginUseCase;

  LoginBloc(this._loginUseCase) : super(const LoginState());
}
