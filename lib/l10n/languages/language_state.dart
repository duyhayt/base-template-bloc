import 'package:base_template_bloc/config/theme/app_theme.dart';
import 'package:base_template_bloc/l10n/models/language_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ServiceState extends Equatable {
  final Language selectedLanguage;
  final ThemeData themeData;

  ServiceState({
    Language? selectedLanguage,
    ThemeData? themeData,
  })  : selectedLanguage = selectedLanguage ?? Language.english,
        themeData = themeData ?? AppTheme.lightTheme;

  ServiceState copyWith({Language? selectedLanguage, ThemeData? themeData}) {
    return ServiceState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object> get props => [selectedLanguage, themeData];
}
