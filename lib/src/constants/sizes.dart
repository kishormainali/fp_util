import 'package:flutter/material.dart';

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
  static SizedBox get gapV4 => const SizedBox(height: p4);
  static SizedBox get gapV8 => const SizedBox(height: p8);
  static SizedBox get gapV12 => const SizedBox(height: p12);
  static SizedBox get gapV16 => const SizedBox(height: p16);
  static SizedBox get gapV24 => const SizedBox(height: p24);
  static SizedBox get gapV32 => const SizedBox(height: p32);
  static SizedBox get gapV48 => const SizedBox(height: p48);
  static SizedBox get gapV54 => const SizedBox(height: p54);
  static SizedBox get gapV64 => const SizedBox(height: p64);

  /// horizontal spaces
  static SizedBox get gapH4 => const SizedBox(width: p4);
  static SizedBox get gapH8 => const SizedBox(width: p8);
  static SizedBox get gapH12 => const SizedBox(width: p12);
  static SizedBox get gapH16 => const SizedBox(width: p16);
  static SizedBox get gapH24 => const SizedBox(width: p24);
  static SizedBox get gapH32 => const SizedBox(width: p32);
  static SizedBox get gapH48 => const SizedBox(width: p48);
  static SizedBox get gapH54 => const SizedBox(width: p54);
  static SizedBox get gapH64 => const SizedBox(width: p64);
}
