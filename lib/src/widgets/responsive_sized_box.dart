import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fp_util/src/extensions/extensions.dart';

/// {@template responsive_sized_box}
/// A [ResponsiveSizedBox] is a [SizedBox] with responsive width and height.
/// {@endtemplate}
class ResponsiveSizedBox extends SizedBox {
  const ResponsiveSizedBox({
    super.key,
    super.height,
    super.width,
    super.child,
  }) : _square = false;

  const ResponsiveSizedBox.vertical(
    double? height, {
    super.key,
    super.child,
  })  : _square = false,
        super(height: height);

  const ResponsiveSizedBox.horizontal(
    double? width, {
    super.key,
    super.child,
  })  : _square = false,
        super(width: width);

  const ResponsiveSizedBox.square({
    super.key,
    double? height,
    super.dimension,
    super.child,
  })  : _square = true,
        super.square();

  ResponsiveSizedBox.fromSize({
    super.key,
    super.size,
    super.child,
  })  : _square = false,
        super.fromSize();

  @override
  RenderConstrainedBox createRenderObject(BuildContext context) {
    return RenderConstrainedBox(
      additionalConstraints: _additionalConstraints,
    );
  }

  final bool _square;

  BoxConstraints get _additionalConstraints {
    final boxConstraints =
        BoxConstraints.tightFor(width: width, height: height);
    return _square ? boxConstraints.r : boxConstraints.hw;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderConstrainedBox renderObject) {
    renderObject.additionalConstraints = _additionalConstraints;
  }
}
