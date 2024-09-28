import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent,),
  );
}