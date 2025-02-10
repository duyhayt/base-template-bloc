import 'package:base_template_bloc/l10n/models/language_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

class InitialLanguage extends ServiceEvent {
  const InitialLanguage();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends ServiceEvent {
  final Language selectedLanguage;

  const ChangeLanguage({
    required this.selectedLanguage,
  });

  @override
  List<Object> get props => [selectedLanguage];
}

class SaveLanguageInStore extends ServiceEvent {
  const SaveLanguageInStore();

  @override
  List<Object> get props => [];
}

class InitialTheme extends ServiceEvent {
  const InitialTheme();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends ServiceEvent {
  final ThemeData themeData;

  const ChangeTheme({
    required this.themeData,
  });

  @override
  List<Object> get props => [themeData];
}

class SaveThemeInStore extends ServiceEvent {
  const SaveThemeInStore();

  @override
  List<Object> get props => [];
}
