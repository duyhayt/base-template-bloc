import 'dart:async';
import 'package:base_template_bloc/features/domain/repositories/login_repo.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class LoginRepoImpl implements LoginRepo {
  final _controller = StreamController<AuthenticationStatus>();

  @override
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2),
        () => _controller.add(AuthenticationStatus.authenticated));
  }

  void logout() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
