import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/config/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      context.router.push(const LoginRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset("assets/animations/splash.json"),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
