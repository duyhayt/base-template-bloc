import 'package:base_template_bloc/config/theme/custom_theme.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppTheme {
  AppTheme._();
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.ltr;
  static ThemeData createTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color secondaryColor,
    required Color scaffoldBackgroundColor,
    required Color primaryTextColor,
    required Color accentColor,
    required Color buttonTextColor,
    required Color errorColor,
    Color? secondaryTextColor,
    Color? dividerColor,
    Color? buttonBackgroundColor,
    Color? cardBackgroundColor,
    Color? disabledColor,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.material2021().black
        : Typography.material2021().white;
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryTextColor,
      textTheme: TextTheme(
        displayLarge: baseTextTheme.displayLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: baseTextTheme.headlineLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: baseTextTheme.headlineMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: baseTextTheme.titleLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: baseTextTheme.titleMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: baseTextTheme.bodyLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 15,
        ),
        bodyMedium: baseTextTheme.bodyMedium!.copyWith(
          color: primaryTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: baseTextTheme.bodySmall!.copyWith(
          color: primaryTextColor,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: baseTextTheme.labelLarge!.copyWith(
          color: primaryTextColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: baseTextTheme.labelSmall!.copyWith(
          color: primaryTextColor,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      dividerColor: dividerColor,
      buttonTheme: ButtonThemeData(
        buttonColor: buttonBackgroundColor,
        disabledColor: disabledColor,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(accentColor),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accentColor,
        onPrimary: buttonTextColor,
        secondary: accentColor,
        onSecondary: buttonTextColor,
        error: errorColor,
        onError: buttonTextColor,
        surface: scaffoldBackgroundColor,
        onSurface: buttonTextColor,
      ),
      cardTheme: CardTheme(
        color: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: primaryTextColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scaffoldBackgroundColor,
        selectedItemColor: accentColor,
        unselectedItemColor: primaryTextColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scaffoldBackgroundColor,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: scaffoldBackgroundColor,
      ),
    );
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///
  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        primaryColor: CustomTheme.lightPrimaryColor,
        secondaryColor: CustomTheme.lightSecondaryColor,
        scaffoldBackgroundColor:
            CustomTheme.lightScaffoldBackgroundColor, // Nền sáng
        cardBackgroundColor:
            CustomTheme.lightSecondaryColor, // Màu card trắng giúp nổi bật
        primaryTextColor: CustomTheme.lightTextPrimary, // Text chính là màu đen
        secondaryTextColor: CustomTheme
            .lightTextSecondary, // Text phụ có độ tương phản vừa phải
        accentColor: CustomTheme.lightSecondaryColor, // Chủ đạo là #8482BE
        dividerColor: CustomTheme.lightGray, // Màu ngăn cách rõ ràng hơn
        buttonBackgroundColor:
            CustomTheme.lightTextSecondary, // Nút bấm cùng màu chủ đạo
        buttonTextColor: CustomTheme
            .lightSecondaryColor, // Văn bản trên nút bấm là màu trắng
        disabledColor:
            CustomTheme.lightSecondaryColor, // Màu khi bị vô hiệu hóa
        errorColor: CustomTheme.errorColor,
      );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        primaryColor: CustomTheme.darkPrimaryColor,
        secondaryColor: CustomTheme.darkSecondaryColor,
        scaffoldBackgroundColor: CustomTheme.darkScaffoldBackgroundColor,
        cardBackgroundColor: CustomTheme.darkSecondaryColor,
        primaryTextColor: CustomTheme.darkTextPrimary,
        secondaryTextColor: CustomTheme.darkTextSecondary,
        accentColor: CustomTheme.darkSecondaryColor,
        dividerColor: CustomTheme.darkGray,
        buttonBackgroundColor: CustomTheme.darkTextSecondary,
        buttonTextColor: CustomTheme.darkSecondaryColor,
        disabledColor: CustomTheme.darkSecondaryColor,
        errorColor: CustomTheme.errorColor,
      );
}
