import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  vietnamese(
    Locale('vi', 'VI'),
    'Việt Nam',
  );

  const Language(
    this.value,
    this.text,
  );

  final Locale value;
  final String text;
}