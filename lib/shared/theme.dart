import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: CustomColors.white,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          color: CustomColors.black,
        ),
        headline2: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: CustomColors.white,
        ),
        headline3: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
          color: CustomColors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 18.0,
          color: CustomColors.fontPrimary,
        ),
        bodyText2: TextStyle(
          fontSize: 16.0,
          color: CustomColors.black,
        ),
        caption: TextStyle(
          fontSize: 14.0,
          color: CustomColors.black,
        ),
      ),
    );
  }
}
