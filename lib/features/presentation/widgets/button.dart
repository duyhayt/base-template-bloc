import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const Button({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: Colors.blueAccent),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Colors.blueAccent),
        ));
  }
}
