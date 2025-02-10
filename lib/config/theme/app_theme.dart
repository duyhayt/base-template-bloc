import 'package:base_template_bloc/config/theme/custom_theme.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppTheme {
  AppTheme._();
  static ThemeType themeType = ThemeType.light;
  static TextDirection textDirection = TextDirection.ltr;
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: background,
      primaryColor: primaryText,
      primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: primaryText),
        displayMedium: TextStyle(color: primaryText),
        displaySmall: TextStyle(color: primaryText),
        bodyLarge: TextStyle(color: primaryText),
        bodyMedium: TextStyle(color: primaryText),
        bodySmall: TextStyle(color: primaryText),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: primaryText),
        displayMedium: TextStyle(color: primaryText),
        displaySmall: TextStyle(color: primaryText),
        bodyLarge: TextStyle(color: primaryText),
        bodyMedium: TextStyle(color: primaryText),
        bodySmall: TextStyle(color: primaryText),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      dividerColor: divider,
      buttonTheme: ButtonThemeData(
        buttonColor: buttonBackground,
        disabledColor: disabled,
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
        onPrimary: buttonText,
        secondary: accentColor,
        onSecondary: buttonText,
        error: error,
        onError: buttonText,
        surface: background,
        onSurface: buttonText,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: divider,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: primaryText,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: accentColor,
        unselectedItemColor: primaryText,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: background,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: background,
      ),
    );
  }

  /// -------------------------- Light Theme  -------------------------------------------- ///
  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: CustomTheme.lightScaffoldBackgroundColor, // Nền sáng
        cardBackground:
            CustomTheme.lightSecondaryColor, // Màu card trắng giúp nổi bật
        primaryText: CustomTheme.lightTextPrimary, // Text chính là màu đen
        secondaryText: CustomTheme
            .lightTextSecondary, // Text phụ có độ tương phản vừa phải
        accentColor: CustomTheme.lightSecondaryColor, // Chủ đạo là #8482BE
        divider: CustomTheme.lightGray, // Màu ngăn cách rõ ràng hơn
        buttonBackground:
            CustomTheme.lightTextSecondary, // Nút bấm cùng màu chủ đạo
        buttonText: CustomTheme
            .lightSecondaryColor, // Văn bản trên nút bấm là màu trắng
        disabled: CustomTheme.lightSecondaryColor, // Màu khi bị vô hiệu hóa
        error: CustomTheme.errorColor,
      );

  /// -------------------------- Dark Theme  -------------------------------------------- ///
  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: CustomTheme.darkScaffoldBackgroundColor, // Nền tối
        cardBackground: CustomTheme
            .darkSecondaryColor, // Card có màu trung gian giúp nổi bật
        primaryText: CustomTheme.darkTextPrimary, // Text chính là màu trắng
        secondaryText:
            CustomTheme.darkTextSecondary, // Text phụ có độ sáng vừa phải
        accentColor: CustomTheme.darkSecondaryColor, // Chủ đạo vẫn là #8482BE
        divider: CustomTheme.darkGray, // Màu chia ngăn cách rõ ràng
        buttonBackground:
            CustomTheme.darkTextSecondary, // Nút bấm sáng giúp dễ nhấn
        buttonText:
            CustomTheme.darkSecondaryColor, // Văn bản trên nút là màu đen
        disabled: CustomTheme.darkSecondaryColor, // Màu khi bị vô hiệu hóa
        error: CustomTheme.errorColor,
      );
}
