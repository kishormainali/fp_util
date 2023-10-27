import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

extension EdgeInsetsX on EdgeInsets {
  /// add top padding
  EdgeInsets addTop(double add, [bool responsive = false]) => copyWith(
        top: (top + add).responsiveH(responsive),
      );

  /// add right padding
  EdgeInsets addRight(double add, [bool responsive = false]) => copyWith(
        right: (right + add).responsiveW(responsive),
      );

  /// add bottom padding
  EdgeInsets addBottom(double add, [bool responsive = false]) => copyWith(
        bottom: (bottom + add).responsiveH(responsive),
      );

  /// add left padding
  EdgeInsets addLeft(double add, [bool responsive = false]) => copyWith(
        left: (left + add).responsiveW(responsive),
      );

  /// add horizontal padding
  EdgeInsets addX(double add, [bool responsive = false]) => copyWith(
        left: (left + add).responsiveW(responsive),
        right: (right + add).responsiveW(responsive),
      );

  /// add vertical padding
  EdgeInsets addY(double add, [bool responsive = false]) => copyWith(
        top: (top + add).responsiveH(responsive),
        bottom: (bottom + add).responsiveH(responsive),
      );

  /// set top padding to 0
  EdgeInsets get removeTop => copyWith(top: 0);

  /// set right padding ot 0
  EdgeInsets get removeRight => copyWith(right: 0);

  /// set bottom padding to 0
  EdgeInsets get removeBottom => copyWith(bottom: 0);

  /// set left padding to 0
  EdgeInsets get removeLeft => copyWith(left: 0);

  EdgeInsets get r => copyWith(
        top: top.r,
        right: right.r,
        bottom: bottom.r,
        left: left.r,
      );

  EdgeInsets get hw => copyWith(
        top: top.h,
        right: right.w,
        bottom: bottom.h,
        left: left.w,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        right: right.w,
        bottom: bottom.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        right: right.h,
        bottom: bottom.h,
        left: left.h,
      );
}
