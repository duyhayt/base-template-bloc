import 'package:base_template_bloc/core/usecase/usecase.dart';
import 'package:base_template_bloc/features/domain/repositories/login_repo.dart';

class LoginUseCase implements UseCase<bool, String> {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);

  Future<void> login(String email, String password) {
    return _loginRepo.login(email, password);
  }

  @override
  Future<bool> call(String params) {
    throw UnimplementedError();
  }
}
