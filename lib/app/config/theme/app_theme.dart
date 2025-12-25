import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF0FA4F0),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Raleway',
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0FA4F0),
      primary: const Color(0xFF0FA4F0),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
  );
}
