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

  /// {@macro rounded_container}
  /// with [GestureDetector] to make it clickable
  RoundedContainer.clickable({
    super.key,
    Widget? child,
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
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
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
          child: GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            behavior: HitTestBehavior.opaque,
            child: child,
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
    required double size,
    super.clipBehavior = Clip.none,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    BorderSide border = BorderSide.none,
  }) : super(
          width: size,
          height: size,
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

  /// {@macro circle_container}
  /// with [GestureDetector] to make it clickable
  CircleContainer.clickable({
    super.key,
    Widget? child,
    super.alignment,
    super.padding,
    Color? color,
    super.foregroundDecoration,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    required double size,
    super.clipBehavior = Clip.none,
    DecorationImage? image,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    BorderSide border = BorderSide.none,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
  }) : super(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            color: color,
            shadows: shadows,
            gradient: gradient,
            image: image,
            shape: CircleBorder(
              side: border,
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            behavior: HitTestBehavior.opaque,
            child: child,
          ),
        );
}
