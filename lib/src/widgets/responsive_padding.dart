import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fp_util/src/extensions/extensions.dart';

enum _PaddingType {
  all,
  horizontal,
  vertical,
  left,
  top,
  right,
  bottom;

  EdgeInsets insets(double value) => switch (this) {
        all => EdgeInsets.all(value.r),
        horizontal => EdgeInsets.symmetric(horizontal: value.w),
        vertical => EdgeInsets.symmetric(vertical: value.h),
        left => EdgeInsets.only(left: value.w),
        top => EdgeInsets.only(top: value.h),
        right => EdgeInsets.only(right: value.w),
        bottom => EdgeInsets.only(bottom: value.h),
      };
}

/// {@template responsive_padding}
/// A [ResponsivePadding] is a [Padding] with responsive insets.
/// {@endtemplate}
class ResponsivePadding extends SingleChildRenderObjectWidget {
  /// Creates a adapt widget that insets its child.
  ///
  /// The [padding] argument must not be null.
  const ResponsivePadding({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.all;

  /// Creates horizontal padding widget
  const ResponsivePadding.horizontal({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.horizontal;

  /// Creates vertical padding widget
  const ResponsivePadding.vertical({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.vertical;

  /// Creates left padding widget
  const ResponsivePadding.left({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.left;

  /// Creates top padding widget
  const ResponsivePadding.top({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.top;

  /// Creates right padding widget
  const ResponsivePadding.right({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.right;

  /// Creates bottom padding widget
  const ResponsivePadding.bottom({
    super.key,
    required Widget super.child,
    required this.padding,
  }) : _paddingType = _PaddingType.bottom;

  /// The amount of space by which to inset the child.
  final double padding;

  final _PaddingType _paddingType;

  @override
  RenderPadding createRenderObject(BuildContext context) {
    return RenderPadding(
      padding: _paddingType.insets(padding),
      textDirection: Directionality.maybeOf(context),
    );
  }
}
