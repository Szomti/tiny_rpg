import 'package:flutter/material.dart';

enum AppThemes { light, dark }

abstract class AppTheme {
  static AppThemes currentTheme = AppThemes.dark;
  final Color foreground;
  final Color background;
  final Color text;

  AppTheme._({
    required this.foreground,
    required this.background,
    required this.text,
  });

  factory AppTheme() {
    return switch (currentTheme) {
      AppThemes.light => _LightTheme.instance,
      AppThemes.dark => _DarkTheme.instance,
    };
  }

  static void change(BuildContext context, AppThemes theme) {
    currentTheme = theme;
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }
}

class _LightTheme extends AppTheme {
  static final _LightTheme instance = _LightTheme._();

  _LightTheme._()
      : super._(
          foreground: const Color(0XFF050C27),
          background: const Color(0XFFEBF0FE),
          text: const Color(0XFF050C27),
        );
}

class _DarkTheme extends AppTheme {
  static final _DarkTheme instance = _DarkTheme._();

  _DarkTheme._()
      : super._(
          foreground: const Color(0XFFEBF0FE),
          background: const Color(0XFF253E8B),
          text: const Color(0XFFEBF0FE),
        );
}
