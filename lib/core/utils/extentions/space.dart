import 'package:flutter/material.dart';

extension IntExtention on int {
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
  SizedBox get verticalSpace => SizedBox(height: toDouble());
}
