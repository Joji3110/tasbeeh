import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';
import 'package:flutter_app_tas/src/utils/theme/customos_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: TColors.lightColor,
    textTheme: TTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: TColors.darkColor,
    textTheme: TTextTheme.darkTextTheme,
  );
}
