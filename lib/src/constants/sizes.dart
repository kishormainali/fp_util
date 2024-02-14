import 'package:gap/gap.dart';

abstract class Sizes {
  const Sizes._();
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p32 = 32.0;
  static const double p48 = 48.0;
  static const double p54 = 54.0;
  static const double p64 = 64.0;

  // sized boxes
  /// vertical spaces
  static Gap get gap4 => const Gap(p4);
  static Gap get gap8 => const Gap(p8);
  static Gap get gap12 => const Gap(p12);
  static Gap get gap16 => const Gap(p16);
  static Gap get gap20 => const Gap(p20);
  static Gap get gap24 => const Gap(p24);
  static Gap get gap32 => const Gap(p32);
  static Gap get gap48 => const Gap(p48);
  static Gap get gap54 => const Gap(p54);
  static Gap get gap64 => const Gap(p64);

  /// horizontal spaces
  static SliverGap get sliverGap4 => const SliverGap(p4);
  static SliverGap get sliverGap8 => const SliverGap(p8);
  static SliverGap get sliverGap12 => const SliverGap(p12);
  static SliverGap get sliverGap16 => const SliverGap(p16);
  static SliverGap get sliverGap20 => const SliverGap(p20);
  static SliverGap get sliverGap24 => const SliverGap(p24);
  static SliverGap get sliverGap32 => const SliverGap(p32);
  static SliverGap get sliverGap48 => const SliverGap(p48);
  static SliverGap get sliverGap54 => const SliverGap(p54);
  static SliverGap get sliverGap64 => const SliverGap(p64);
}
