import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loader = const AppIndicator.inverse(),
    this.loading = false,
    this.foregroundColor,
    this.borderSide,
    this.textStyle,
    this.padding = _defaultPadding,
    this.shape = const StadiumBorder(),
    this.disabled = false,
    this.width = 100,
  })  : _icon = null,
        _maximumSize = _defaultMaximumSize,
        _minimumSize = Size(width, 48),
        _circle = false;

  AppTextButton.withIcon({
    super.key,
    required this.label,
    required Widget icon,
    required this.onPressed,
    this.loader = const AppIndicator.inverse(),
    this.loading = false,
    this.foregroundColor,
    this.borderSide,
    this.textStyle,
    this.disabled = false,
    this.width = 120,
    this.padding = _defaultPadding,
    this.shape = const StadiumBorder(),
  })  : _icon = icon,
        _maximumSize = _defaultMaximumSize,
        _minimumSize = Size(width, 48),
        _circle = false;

  AppTextButton.circle({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.loader = const AppIndicator.inverse(),
    this.loading = false,
    this.foregroundColor,
    this.borderSide,
    this.textStyle,
    double radius = 48,
    this.disabled = false,
    this.padding = _defaultPadding,
  })  : _icon = icon,
        label = '',
        width = 48, // ignores this on circle button
        _minimumSize = Size.square(radius),
        _maximumSize = Size.square(radius),
        shape = const CircleBorder(),
        _circle = true;

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 48);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: Sizes.p8);

  /// Color of the text, icons etc.
  ///
  /// Defaults to [ColorScheme.primary].
  final Color? foregroundColor;

  /// A border of the button.
  final BorderSide? borderSide;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? textStyle;

  /// width of button
  final double width;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [Size(100,48)].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets padding;

  /// shape for rounded corner button
  final OutlinedBorder? shape;

  /// label for button
  final String label;

  /// loader for loading state
  final Widget loader;

  /// flags for loading state
  final bool loading;

  /// flags for disabled state
  final bool disabled;

  /// onPressed callback
  final VoidCallback onPressed;

  /// icon widget
  final Widget? _icon;

  /// circle flag
  final bool _circle;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = textStyle ??
        Theme.of(context).textTheme.labelLarge?.apply(
              color: Colors.black,
            );
    final effectiveFg = foregroundColor ?? context.colorScheme.primary;
    final style = ButtonStyle(
      maximumSize: MaterialStatePropertyAll(_maximumSize),
      padding: MaterialStatePropertyAll(padding),
      minimumSize: MaterialStatePropertyAll(_minimumSize),
      textStyle: MaterialStatePropertyAll(effectiveStyle),
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      foregroundColor: MaterialStatePropertyAll(effectiveFg),
      side: MaterialStatePropertyAll(borderSide),
      shape: MaterialStatePropertyAll(shape),
      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(effectiveFg.withOpacity(0.12)),
    );
    if (_icon != null && !_circle) {
      return TextButton.icon(
        style: style,
        onPressed: disabled || loading ? null : onPressed,
        icon: loading ? loader : _icon!,
        label: Text(label),
      );
    } else if (_icon != null && _circle) {
      return buttonChild(style, _icon!);
    } else {
      return buttonChild(style, Text(label));
    }
  }

  TextButton buttonChild(ButtonStyle style, Widget child) {
    return TextButton(
      onPressed: disabled || loading ? null : onPressed,
      style: style,
      child: loading ? loader : child,
    );
  }
}
