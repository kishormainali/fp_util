import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//facebook Background Color
const Color _facebookColor = Color(0xff39579A);
//Apple Background Color
const Color _appleColor = Color(0xff000000);

//Google Background Color
const Color _googleColor = Color(0xffDF4A32);

/// {@template social_button}
///
/// Social Button includes google, facebook and apple
///
/// {@endtemplate}
class SocialButton extends StatelessWidget {
  /// {@macro social_button}
  const SocialButton._({
    required this.type,
    required this.label,
    required this.loading,
    required this.disabled,
    required this.buttonColor,
    required this.foregroundColor,
    required this.iconSize,
    required this.textStyle,
    required this.loader,
    required this.minimumSize,
    required this.maximumSize,
    required this.iconOnly,
    required this.padding,
    required this.side,
    this.icon,
    this.shape,
    this.onPressed,
  });

  ///  Button for google
  factory SocialButton.google({
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _googleColor,
    Color foregroundColor = Colors.white,
    OutlinedBorder? shape = const StadiumBorder(),
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double width = 140,
    EdgeInsets padding = _defaultPadding,
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.google,
        label: label,
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size(width, 48),
        maximumSize: _defaultMaximumSize,
        iconOnly: false,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  /// icon only button for google
  factory SocialButton.googleIcon({
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _googleColor,
    Color foregroundColor = Colors.white,
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double radius = 48,
    EdgeInsets padding = _defaultIconPadding,
    OutlinedBorder shape = const CircleBorder(),
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.google,
        label: '',
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size.square(radius),
        maximumSize: Size.square(radius),
        iconOnly: true,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  ///  button for facebook

  factory SocialButton.facebook({
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _facebookColor,
    Color foregroundColor = Colors.white,
    OutlinedBorder? shape = const StadiumBorder(),
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double width = 140,
    EdgeInsets padding = _defaultPadding,
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.facebook,
        label: label,
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size(width, 48),
        maximumSize: _defaultMaximumSize,
        iconOnly: false,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  /// icon only button for facebook

  factory SocialButton.facebookIcon({
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _facebookColor,
    Color foregroundColor = Colors.white,
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double radius = 48,
    EdgeInsets padding = _defaultIconPadding,
    OutlinedBorder shape = const CircleBorder(),
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.facebook,
        label: '',
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size.square(radius),
        maximumSize: Size.square(radius),
        iconOnly: true,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  ///  button for apple
  factory SocialButton.apple({
    required String label,
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _appleColor,
    Color foregroundColor = Colors.white,
    Border? border,
    OutlinedBorder? shape = const StadiumBorder(),
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double width = 140,
    EdgeInsets padding = _defaultPadding,
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.apple,
        label: label,
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size(width, 48),
        maximumSize: _defaultMaximumSize,
        iconOnly: false,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  /// icon only button for apple
  factory SocialButton.appleIcon({
    VoidCallback? onPressed,
    bool loading = false,
    Color buttonColor = _appleColor,
    Color foregroundColor = Colors.white,
    double iconSize = 24,
    TextStyle? textStyle,
    Widget loader = _defaultLoader,
    double radius = 48,
    EdgeInsets padding = _defaultIconPadding,
    OutlinedBorder shape = const CircleBorder(),
    BorderSide? side,
    Widget? icon,
    bool disabled = false,
  }) =>
      SocialButton._(
        type: SocialType.apple,
        label: '',
        onPressed: onPressed,
        loading: loading,
        buttonColor: buttonColor,
        foregroundColor: foregroundColor,
        shape: shape,
        iconSize: iconSize,
        textStyle: textStyle,
        loader: loader,
        minimumSize: Size.square(radius),
        maximumSize: Size.square(radius),
        iconOnly: true,
        padding: padding,
        side: side,
        icon: icon,
        disabled: disabled,
      );

  /// default maximum size
  static const _defaultMaximumSize = Size(double.infinity, 48);

  /// default loader
  static const _defaultLoader = SizedBox(
    width: 24,
    height: 24,
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
        strokeWidth: 1.8,
      ),
    ),
  );

  /// default padding for button
  static const _defaultPadding =
      EdgeInsets.symmetric(vertical: 4, horizontal: 16);

  /// default padding for icon button
  static const _defaultIconPadding = EdgeInsets.all(4);

  /// social button type
  final SocialType type;

  /// label for button
  final String label;

  /// icon for button
  final Widget? icon;

  /// flag for button is loading or not
  final bool loading;

  /// flag for disabled button
  final bool disabled;

  /// onPressed callback
  final VoidCallback? onPressed;

  /// background color for button
  final Color buttonColor;

  /// foreground color for button
  final Color foregroundColor;

  /// shape for button default is StadiumBorder
  final OutlinedBorder? shape;

  /// border side for button
  final BorderSide? side;

  /// iconSize for button icon defaults to 24
  final double iconSize;

  /// text style for button
  final TextStyle? textStyle;

  /// padding for button
  final EdgeInsets padding;

  /// loader widget
  final Widget loader;

  /// minimum size for button
  final Size minimumSize;

  /// maximum size for button
  final Size maximumSize;

  /// flag for icon only button
  final bool iconOnly;

  Widget get iconChild =>
      icon ??
      SvgPicture.asset(
        type.icon,
        width: iconSize,
        height: iconSize,
        package: 'fp_util',
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(buttonColor),
      foregroundColor: MaterialStatePropertyAll(foregroundColor),
      shape: MaterialStatePropertyAll(shape),
      iconSize: MaterialStatePropertyAll(iconSize),
      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
      textStyle: MaterialStatePropertyAll(textStyle),
      minimumSize: MaterialStatePropertyAll(minimumSize),
      maximumSize: MaterialStatePropertyAll(maximumSize),
      padding: MaterialStatePropertyAll(padding),
      splashFactory: InkSplash.splashFactory,
      overlayColor: MaterialStatePropertyAll(foregroundColor.withOpacity(0.2)),
      side: MaterialStatePropertyAll(side),
    );

    if (iconOnly) {
      return FilledButton(
        onPressed: loading || disabled ? null : onPressed,
        style: buttonStyle,
        child: loading ? loader : iconChild,
      );
    } else {
      return FilledButton.icon(
        onPressed: loading || disabled ? null : onPressed,
        style: buttonStyle,
        icon: loading ? loader : iconChild,
        label: Text(label),
      );
    }
  }
}

enum SocialType {
  google('assets/icons/google.svg'),
  facebook('assets/icons/facebook.svg'),
  apple('assets/icons/apple.svg');

  const SocialType(this.icon);
  final String icon;
}
