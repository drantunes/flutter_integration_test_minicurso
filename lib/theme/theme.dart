import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor deepBlack = MaterialColor(_deepBlackPrimaryValue, <int, Color>{
    50: Color(0xFFE0E0E0),
    100: Color(0xFFB3B3B3),
    200: Color(0xFF808080),
    300: Color(0xFF4D4D4D),
    400: Color(0xFF262626),
    500: Color(_deepBlackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  });
  static const int _deepBlackPrimaryValue = 0xFF000000;

  static const MaterialColor deepBlackAccent = MaterialColor(_deepBlackAccentValue, <int, Color>{
    100: Color(0xFFA6A6A6),
    200: Color(_deepBlackAccentValue),
    400: Color(0xFF737373),
    700: Color(0xFF666666),
  });
  static const int _deepBlackAccentValue = 0xFF8C8C8C;

  static const Color background = Color.fromARGB(255, 189, 255, 223);

  static ButtonStyle outlineButtonStyle({
    Color color = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: deepBlack.shade300),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  static ThemeData theme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      primarySwatch: deepBlack,
      primaryColor: deepBlack.shade500,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlineButtonStyle(),
      ),
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            elevation: 0,
            centerTitle: true,
            // backgroundColor: Colors.transparent,
          ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        extendedTextStyle: TextStyle(letterSpacing: .2, fontSize: 16),
      ));
}
