import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF1B5E20),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B5E20),
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
  );
}
