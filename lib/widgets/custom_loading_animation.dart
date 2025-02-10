import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 70,
      height: 70,
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotateChase, // Type loading
        strokeWidth: 2,
        backgroundColor: Colors.transparent, // Không có nền
        pathBackgroundColor: Colors.transparent,
      ),
    );
  }
}
