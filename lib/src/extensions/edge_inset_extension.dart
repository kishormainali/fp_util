import 'package:flutter/material.dart';

extension EdgeInsetsX on EdgeInsets {
  /// add top padding
  EdgeInsets addTop(double add) => copyWith(top: add);

  /// add right padding
  EdgeInsets addRight(double add) => copyWith(right: add);

  /// add bottom padding
  EdgeInsets addBottom(double add) => copyWith(bottom: add);

  /// add left padding
  EdgeInsets addLeft(double add) => copyWith(left: add);

  /// add horizontal padding
  EdgeInsets addX(double add) => copyWith(left: add, right: add);

  /// add vertical padding
  EdgeInsets addY(double add) => copyWith(top: add, bottom: add);

  /// set top padding to 0
  EdgeInsets get removeTop => copyWith(top: 0);

  /// set right padding ot 0
  EdgeInsets get removeRight => copyWith(right: 0);

  /// set bottom padding to 0
  EdgeInsets get removeBottom => copyWith(bottom: 0);

  /// set left padding to 0
  EdgeInsets get removeLeft => copyWith(left: 0);
}
