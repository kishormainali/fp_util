/*
 * Copyright (c) 2022. 
 * Author: Kishor Mainali
 * Company: EB Pearls
 */
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loader = const AppIndicator(),
    this.loading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.width = 100,
    this.padding = _defaultPadding,
    this.shape = const StadiumBorder(),
    this.disabled = false,
  })  : _icon = null,
        _maximumSize = _defaultMaximumSize,
        _minimumSize = Size(width, 48),
        _circle = false;

  AppButton.withIcon({
    super.key,
    required this.label,
    required Widget icon,
    required this.onPressed,
    this.loader = const AppIndicator(),
    this.loading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.width = 120,
    this.padding = _defaultPadding,
    this.shape = const StadiumBorder(),
    this.disabled = false,
  })  : _icon = icon,
        _maximumSize = _defaultMaximumSize,
        _minimumSize = Size(width, 48),
        _circle = false;

  AppButton.circle({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.loader = const AppIndicator(),
    this.loading = false,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.padding = _defaultPadding,
    double radius = 48,
  })  : _icon = icon,
        label = '',
        width = 48,
        shape = const CircleBorder(),
        _circle = true,
        _minimumSize = Size.square(radius),
        _maximumSize = Size.square(radius);

  /// The maximum size of the button.
  static const _defaultMaximumSize = Size(double.infinity, 48);

  /// The padding of the the button.
  static const _defaultPadding = EdgeInsets.symmetric(vertical: Sizes.p8);

  /// A background color of the button.
  ///
  /// Defaults to [ColorScheme.primary].
  final Color? backgroundColor;

  /// Color of the text, icons etc.
  ///
  /// Defaults to [ColorScheme.onPrimary].
  final Color? foregroundColor;

  /// [TextStyle] of the button text.
  ///
  /// Defaults to [TextTheme.labelLarge].
  final TextStyle? textStyle;

  /// The width for minimum size of the button.
  ///
  /// Defaults to [100].
  /// if you want full width button set this as [double.infinity]
  final double width;

  /// The maximum size of the button.
  ///
  /// Defaults to [_defaultMaximumSize].
  final Size _maximumSize;

  /// The minimum size of the button.
  ///
  /// Defaults to [_defaultMinimumSize].
  final Size _minimumSize;

  /// The padding of the button.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsets padding;

  /// shape for rounded corner button
  final OutlinedBorder shape;

  /// label for button
  final String label;

  /// loader for loading state
  final Widget loader;

  /// flags for loading state
  final bool loading;

  /// flags for disabled state
  final bool disabled;

  /// onPressed callback
  final VoidCallback? onPressed;

  /// icon widget
  final Widget? _icon;

  /// used for circle button
  final bool _circle;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = textStyle ?? Theme.of(context).textTheme.labelLarge;
    final effectiveBg = backgroundColor ?? context.colorScheme.primary;
    final effectiveFg = foregroundColor ?? context.colorScheme.onPrimary;
    final style = ButtonStyle(
      maximumSize: MaterialStatePropertyAll(_maximumSize),
      padding: MaterialStatePropertyAll(padding),
      minimumSize: MaterialStatePropertyAll(_minimumSize),
      textStyle: MaterialStatePropertyAll(effectiveStyle),
      backgroundColor: MaterialStatePropertyAll(
        disabled ? effectiveBg.withOpacity(0.12) : effectiveBg,
      ),
      foregroundColor:
          MaterialStatePropertyAll(disabled ? effectiveBg : effectiveFg),
      shape: MaterialStatePropertyAll(shape),
      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
      overlayColor: MaterialStatePropertyAll(effectiveFg.withOpacity(0.12)),
    );
    if (_icon != null && !_circle) {
      return FilledButton.icon(
        onPressed: loading || disabled ? null : onPressed,
        icon: loading ? loader : _icon!,
        label: label.isNotBlank ? Text(label) : const SizedBox.shrink(),
        style: style,
      );
    } else if (_icon != null && _circle) {
      return buttonChild(style, _icon!);
    } else {
      return buttonChild(style, Text(label));
    }
  }

  FilledButton buttonChild(ButtonStyle style, Widget child) {
    return FilledButton(
      onPressed: loading || disabled ? null : onPressed,
      style: style,
      child: loading ? loader : child,
    );
  }
}
