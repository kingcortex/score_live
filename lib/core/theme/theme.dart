import 'package:flutter/material.dart';
import 'package:score_live/core/theme/color.dart';
import 'package:score_live/core/theme/custom_themes/text_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevatedbutton_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Mulish',
    brightness: Brightness.dark,
    primaryColor: AppColors.charcoalBlack,
    scaffoldBackgroundColor: AppColors.appBackground,
    textTheme: MyTextTheme.darkTextTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: MyElevationButtonTheme.darkElevationButtonTheme,
  );
}
