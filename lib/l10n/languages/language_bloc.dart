import 'package:base_template_bloc/config/theme/app_theme.dart';
import 'package:base_template_bloc/l10n/languages/language_event.dart';
import 'package:base_template_bloc/l10n/languages/language_state.dart';
import 'package:base_template_bloc/l10n/models/language_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceState()) {
    on<InitialLanguage>(_initialLanguage);
    on<InitialTheme>(_initalTheme);
    on<ChangeLanguage>(_changeLanguage);
    on<SaveLanguageInStore>(_saveLanguageInStore);
    on<ChangeTheme>(_changeTheme);
    on<SaveThemeInStore>(_saveThemeInStore);
    add(const InitialTheme());
    add(const InitialLanguage());
  }

  _initialLanguage(InitialLanguage event, Emitter<ServiceState> emit) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? language = sharedPreferences.getString('language');
    if (language == null || language == "English") {
      emit(state.copyWith(selectedLanguage: Language.english));
    } else {
      emit(state.copyWith(selectedLanguage: Language.vietnamese));
    }
  }

  _changeLanguage(ChangeLanguage event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
    add(const SaveLanguageInStore());
  }

  _saveLanguageInStore(
      SaveLanguageInStore event, Emitter<ServiceState> emit) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('language', state.selectedLanguage.text);
  }

  _initalTheme(InitialTheme event, Emitter<ServiceState> emit) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? theme = sharedPreferences.getString("theme");
    if (theme == null || theme == ThemeType.light.name) {
      emit(state.copyWith(themeData: AppTheme.lightTheme));
    } else {
      emit(state.copyWith(themeData: AppTheme.darkTheme));
    }
  }

  _changeTheme(ChangeTheme event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(themeData: event.themeData));
    add(const SaveThemeInStore());
  }

  _saveThemeInStore(
      SaveThemeInStore event, Emitter<ServiceState> emit) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme", state.themeData.brightness.name);
  }
}
