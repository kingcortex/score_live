import 'package:flutter/material.dart';

class MyElevationButtonTheme {
  MyElevationButtonTheme._();

  static final darkElevationButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
