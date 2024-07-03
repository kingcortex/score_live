import 'package:flutter/material.dart';

class DeviceUtils {
  static double appPadding = 16;

  static void hideKeyboard(BuildContext context) {
    Focus.of(context).requestFocus(FocusNode());
  }
}
