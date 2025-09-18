import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const String _family = 'ProText';
  static final TextStyle medium = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: _family,
  );
  static final TextStyle regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: _family,
  );

  static Color getPercentColor(double value) => value == 0
      ? Colors.grey
      : value > 0
      ? Colors.green
      : Colors.red;
}
