import 'package:flutter/material.dart';
import 'package:mini_project_1/shared/shared_value.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: CustomColors.white,
      fontFamily: 'Roboto',
    );
  }
}
