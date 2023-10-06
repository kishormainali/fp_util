import 'package:flutter/material.dart';

/// {@template rounded_container}
/// A [Container] with a rounded shape.
/// {@endtemplate}
class RoundedContainer extends Container {
  /// {@macro rounded_container}
  RoundedContainer({
    super.key,
    super.child,
    super.alignment,
    super.padding,
    Color? color,
    super.foregroundDecoration,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.width,
    super.height,
    super.clipBehavior = Clip.none,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    double borderRadius = 10,
    BorderSide border = BorderSide.none,
  }) : super(
          decoration: ShapeDecoration(
            color: color,
            shadows: shadows,
            gradient: gradient,
            image: image,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: border,
            ),
          ),
        );
}

/// {@template circle_container}
/// A [Container] with a circular shape.
/// {@endtemplate}
class CircleContainer extends Container {
  /// {@macro circle_container}
  CircleContainer({
    super.key,
    super.child,
    super.alignment,
    super.padding,
    Color? color,
    super.foregroundDecoration,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.width,
    super.height,
    super.clipBehavior = Clip.none,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    BorderSide border = BorderSide.none,
  }) : super(
          decoration: ShapeDecoration(
            color: color,
            shadows: shadows,
            gradient: gradient,
            image: image,
            shape: CircleBorder(
              side: border,
            ),
          ),
        );
}
