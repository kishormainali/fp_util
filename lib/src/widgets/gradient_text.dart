import 'package:flutter/material.dart';

class GradientText extends Text {
  const GradientText(
    super.data, {
    super.key,
    super.locale,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    required this.gradient,
  });

  /// gradient of the text
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: super.build(context),
    );
  }
}
