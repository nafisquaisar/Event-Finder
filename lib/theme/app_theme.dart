import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}


