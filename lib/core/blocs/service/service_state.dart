import 'package:base_template_bloc/config/theme/app_theme.dart';
import 'package:base_template_bloc/l10n/models/language_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ServiceState extends Equatable {
  final Language selectedLanguage;
  final ThemeData themeData;
  final ThemeType themeType;

  ServiceState({
    Language? selectedLanguage,
    ThemeData? themeData,
    ThemeType? themeType,
  })  : selectedLanguage = selectedLanguage ?? Language.english,
        themeData = themeData ?? AppTheme.lightTheme,
        themeType = themeType ?? ThemeType.light;

  ServiceState copyWith(
      {Language? selectedLanguage,
      ThemeData? themeData,
      ThemeType? themeType}) {
    return ServiceState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      themeData: themeData ?? this.themeData,
      themeType: themeType ?? this.themeType,
    );
  }

  @override
  List<Object> get props => [selectedLanguage, themeData, themeType];
}
