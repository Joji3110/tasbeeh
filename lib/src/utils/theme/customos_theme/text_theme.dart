import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    labelLarge: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}
