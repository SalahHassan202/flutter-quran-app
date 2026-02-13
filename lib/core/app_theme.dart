import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF0D3B66),
    scaffoldBackgroundColor: const Color(0xFFF4F6F8),
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D3B66),
      centerTitle: true,
      elevation: 0,
    ),
  );
}
