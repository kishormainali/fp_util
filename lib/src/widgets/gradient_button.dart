import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

/// {@template gradient_button}
///
/// gradient button
///
/// {@endtemplate}
class GradientButton extends StatelessWidget {
  /// {@macro gradient_button}
  const GradientButton({
    super.key,
    required this.label,
    required this.gradient,
    this.icon,
    this.onPressed,
    this.foregroundColor,
    this.textStyle,
    this.shape,
    this.loading = false,
    this.loader = const CircularProgressIndicator(),
    this.disabled = false,
    this.fullWidth = true,
    this.minimumSize = const Size(120, 48),
  });

  /// label of the button
  final String label;

  /// icon of the button
  final Widget? icon;

  /// callback when button is pressed
  final VoidCallback? onPressed;

  /// gradient of the button
  final Gradient gradient;

  /// foreground color of the button
  final Color? foregroundColor;

  /// text style of the button
  final TextStyle? textStyle;

  /// shape of the button
  final OutlinedBorder? shape;

  /// loading state of the button
  final bool loading;

  /// loader widget to show when loading is true
  final Widget loader;

  /// disabled state of the button
  final bool disabled;

  /// if true then button will take full width
  final bool fullWidth;

  /// minimum size of the button
  final Size minimumSize;

  /// minimum size of the button
  Size get _minimumSize =>
      fullWidth ? Size(double.infinity, minimumSize.height) : minimumSize;

  /// disabled state of the button
  bool get isDisabled => disabled || loading;

  @override
  Widget build(BuildContext context) {
    final style = FilledButton.styleFrom(
      shape: shape,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor,
      padding: EdgeInsets.zero,
      minimumSize: _minimumSize,
      maximumSize: Size(double.infinity, _minimumSize.height),
      textStyle: textStyle,
    );

    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: style,
      child: Ink(
        decoration: ShapeDecoration(
          shape: shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          gradient: gradient,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: _minimumSize.width,
            minHeight: _minimumSize.height,
            maxWidth: double.infinity,
            maxHeight: _minimumSize.height,
          ),
          child: Center(child: _buildChild()),
        ),
      ),
    );
  }

  _buildChild() {
    if (icon != null) {
      return _FilledButtonWithIconChild(
        label: Text(label),
        icon: loading ? loader : icon!,
      );
    } else {
      return loading ? loader : Text(label);
    }
  }
}

class _FilledButtonWithIconChild extends StatelessWidget {
  const _FilledButtonWithIconChild({required this.label, required this.icon});

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.textScaleFactorOf(context);
    // Adjust the gap based on the text scale factor. Start at 8, and lerp
    // to 4 based on how large the text is.
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}
