import 'package:base_template_bloc/features/presentation/login/bloc/login_bloc.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text("Login Page")),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('Home');
                  },
                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ));
  }
}
