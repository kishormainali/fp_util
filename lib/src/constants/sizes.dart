import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

abstract class Sizes {
  const Sizes._();
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p48 = 48.0;
  static const double p54 = 54.0;
  static const double p64 = 64.0;

  // sized boxes
  /// vertical spaces
  static SizedBox gapV4([bool responsive = false]) =>
      p4.verticalSpace(responsive);
  static SizedBox gapV8([bool responsive = false]) =>
      p8.verticalSpace(responsive);
  static SizedBox gapV12([bool responsive = false]) =>
      p12.verticalSpace(responsive);
  static SizedBox gapV16([bool responsive = false]) =>
      p16.verticalSpace(responsive);
  static SizedBox gapV24([bool responsive = false]) =>
      p24.verticalSpace(responsive);
  static SizedBox gapV32([bool responsive = false]) =>
      p32.verticalSpace(responsive);
  static SizedBox gapV48([bool responsive = false]) =>
      p48.verticalSpace(responsive);
  static SizedBox gapV54([bool responsive = false]) =>
      p54.verticalSpace(responsive);
  static SizedBox gapV64([bool responsive = false]) =>
      p64.verticalSpace(responsive);

  /// horizontal spaces
  static SizedBox gapH4([bool responsive = false]) =>
      p4.horizontalSpace(responsive);
  static SizedBox gapH8([bool responsive = false]) =>
      p8.horizontalSpace(responsive);
  static SizedBox gapH12([bool responsive = false]) =>
      p12.horizontalSpace(responsive);
  static SizedBox gapH16([bool responsive = false]) =>
      p16.horizontalSpace(responsive);
  static SizedBox gapH24([bool responsive = false]) =>
      p24.horizontalSpace(responsive);
  static SizedBox gapH32([bool responsive = false]) =>
      p32.horizontalSpace(responsive);
  static SizedBox gapH48([bool responsive = false]) =>
      p48.horizontalSpace(responsive);
  static SizedBox gapH54([bool responsive = false]) =>
      p54.horizontalSpace(responsive);
  static SizedBox gapH64([bool responsive = false]) =>
      p64.horizontalSpace(responsive);
}
