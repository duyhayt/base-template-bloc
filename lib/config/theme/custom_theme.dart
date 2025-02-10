import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color occur = Color(0xffb38220);
  static const Color peach = Color(0xffe09c5f);
  static const Color skyBlue = Color(0xff639fdc);
  static const Color darkGreen = Color(0xff226e79);
  static const Color red = Color(0xfff8575e);
  static const Color purple = Color(0xff9f50bf);
  static const Color pink = Color(0xffd17b88);
  static const Color brown = Color(0xffbd631a);
  static const Color blue = Color(0xff1a71bd);
  static const Color green = Color(0xff068425);
  static const Color yellow = Color(0xfffff44f);
  static const Color orange = Color(0xffFFA500);

  /// Colors
  static Color shimmerBaseColor = const Color(0xFFF5F5F5);
  static Color shimmerHighlightColor = const Color(0xFFE0E0E0);

  /// Light color

  static Color lightPrimaryColor = hexToColor('#8482BE');
  static Color lightScaffoldBackgroundColor = hexToColor('#f2f2f7');
  static Color lightSecondaryColor = hexToColor('#8482BE');
  static const lightWarningColor = Color(0xffffc837);
  static Color lightTextPrimary = const Color(0xFF000000);
  static Color lightGray = const Color(0xFFF6F6F6);
  static Color black = const Color(0xFF000000);
  static Color lightTextSecondary = Colors.black54;
  static Color buttonBackgroundLight = hexToColor('#8482BE');
  static Color buttonTextLight = Colors.white;

  // Dark color
  static Color darkPrimaryColor = hexToColor('#8482BE');
  static Color darkScaffoldBackgroundColor = hexToColor('#000000');
  static Color darkSecondaryColor = hexToColor('#A5A3D1');
  static const darkWarningColor = Color(0xffffc837);
  static Color darkTextPrimary = const Color(0xFFFFFFFF);
  static Color darkGray = const Color(0xFF9F9F9F);
  static Color white = const Color(0xFFFFFFFF);
  static Color darkTextSecondary = Colors.white70;
  static Color buttonBackgroundDark = hexToColor('#8482BE');
  static Color buttonTextDark = Colors.black;

  // Gradient colors
  static Color startColors = hexToColor('#8482BE');
  static Color endColors = hexToColor('#BDE8FF');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
