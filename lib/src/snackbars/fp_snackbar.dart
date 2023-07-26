import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fp_util/fp_util.dart';

/// success snackbar color
const SnackbarColor _successColor = (
  light: Color(0xFFe6f5e6),
  dark: Color(0xFF013100),
  bar: Color(0xFF009400),
);

/// warning snackbar color
const SnackbarColor _warningColor = (
  light: Color(0xFFfff8e6),
  dark: Color(0xFF4d3800),
  bar: Color(0xFFe6a700),
);

/// info snackbar color
const SnackbarColor _infoColor = (
  light: Color(0xFFeef9fc),
  dark: Color(0xFF193c47),
  bar: Color(0xFF4bb3d3),
);

/// error snackbar color
const SnackbarColor _errorColor = (
  light: Color(0xFFffebeb),
  dark: Color(0xFF4b1113),
  bar: Color(0xFFe13238),
);

/// default color
const SnackbarColor _defaultColor = (
  light: Color(0xFF000000),
  dark: Color(0xFF474748),
  bar: Color(0xFFd4d5d8),
);

/// default background and text color
///
/// [light] is used for background color for light theme and text color for dark theme
///
/// [dark] is used for background color for dark theme and text color for light theme
///
/// [bar] is used for sidebar color
typedef SnackbarColor = ({
  /// background color for light theme
  /// text color for dark theme
  Color light,

  /// background color for dark theme
  /// text color for light theme
  Color dark,

  /// side bar color
  Color bar,
});

/// snackbar helper class
class FPSnackbar {
  /// show custom Snackbar
  static custom(
    BuildContext context, {
    required String message,
    String? title,
    int duration = 3,
    SnackbarColor color = _defaultColor,
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      height: 1.25,
    ),
    TextStyle titleTextStyle = const TextStyle(
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w500,
    ),
    Widget? icon,
    String? actionText,
    VoidCallback? onActionTap,
  }) =>
      _showSnackbar(
        context: context,
        color: color,
        textStyle: textStyle,
        titleTextStyle: titleTextStyle,
        message: message,
        title: title,
        icon: icon,
        duration: duration,
        actionText: actionText,
        onActionTap: onActionTap,
      );

  /// show success snackbar
  static success(
    BuildContext context, {
    required String message,
    String? title = 'Success',
    String? actionText,
    VoidCallback? onActionTap,
  }) =>
      _showSnackbar(
        context: context,
        color: _successColor,
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.w500,
        ),
        message: message,
        title: title,
        icon: SvgPicture.asset(
          'assets/icons/success.svg',
          package: 'fp_util',
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            context.themedColor(_successColor.dark, _successColor.light),
            BlendMode.srcIn,
          ),
        ),
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
      );

  /// show error snackbar
  static error(
    BuildContext context, {
    required String message,
    String? title = 'Error',
    String? actionText,
    VoidCallback? onActionTap,
  }) =>
      _showSnackbar(
        context: context,
        color: _errorColor,
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.w500,
        ),
        message: message,
        title: title,
        icon: SvgPicture.asset(
          'assets/icons/error.svg',
          package: 'fp_util',
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            context.themedColor(_errorColor.dark, _errorColor.light),
            BlendMode.srcIn,
          ),
        ),
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
      );

  /// show info snackbar
  static info(
    BuildContext context, {
    required String message,
    String? title = 'Info',
    String? actionText,
    VoidCallback? onActionTap,
  }) =>
      _showSnackbar(
        context: context,
        color: _infoColor,
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.w500,
        ),
        message: message,
        title: title,
        icon: SvgPicture.asset(
          'assets/icons/info.svg',
          package: 'fp_util',
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            context.themedColor(_infoColor.dark, _infoColor.light),
            BlendMode.srcIn,
          ),
        ),
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
      );

  /// show warning snackbar
  static warning(
    BuildContext context, {
    required String message,
    String? title = 'Warning!',
    String? actionText,
    VoidCallback? onActionTap,
  }) =>
      _showSnackbar(
        context: context,
        color: _warningColor,
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.w500,
        ),
        message: message,
        title: title,
        icon: SvgPicture.asset(
          'assets/icons/warning.svg',
          package: 'fp_util',
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            context.themedColor(_warningColor.dark, _warningColor.light),
            BlendMode.srcIn,
          ),
        ),
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
      );

  /// common method to show remove and show snackbar
  static void _showSnackbar({
    required BuildContext context,
    required SnackbarColor color,
    required TextStyle textStyle,
    required TextStyle titleTextStyle,
    required String message,
    required String? title,
    required Widget? icon,
    required int duration,
    required String? actionText,
    required VoidCallback? onActionTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _SnackbarWidget(
            message: message,
            title: title,
            icon: icon,
            backgroundColor: isDark ? color.dark : color.light,
            sideBarColor: color.bar,
            textStyle: textStyle.apply(
              color: isDark ? color.light : color.dark,
            ),
            titleTextStyle: titleTextStyle.apply(
              color: isDark ? color.light : color.dark,
            ),
            actionText: actionText,
            onActionTap: onActionTap,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.zero,
          elevation: 0,
          width: context.responsiveValue(
            context.width - 48, // 48 is margin
            tablet: context.pw(.6), // 60% width of screen
            desktop: context.pw(.6), // 60% width of screen
          ),
          clipBehavior: Clip.antiAlias,
          duration: Duration(seconds: duration),
        ),
      );
  }
}

class _SnackbarWidget extends StatelessWidget {
  const _SnackbarWidget({
    this.icon,
    this.title,
    required this.message,
    required this.backgroundColor,
    required this.sideBarColor,
    this.textStyle,
    this.titleTextStyle,
    this.actionText,
    this.onActionTap,
  });

  final Color sideBarColor;
  final Color backgroundColor;
  final Widget? icon;
  final String? title;
  final String message;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;

  /// snackbar action
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        constraints: const BoxConstraints(minHeight: 60),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: 4.circularBorderRadius,
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: sideBarColor,
                borderRadius: BorderRadius.horizontal(
                  left: 4.circularRadius,
                ),
              ),
            ),
            Sizes.gapH12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          icon!,
                          Sizes.gapH8,
                        ],
                        Text(
                          title!,
                          style: titleTextStyle,
                        )
                      ],
                    ),
                  Sizes.gapV8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          maxLines: 2,
                          style: textStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (actionText != null) ...[
                        Sizes.gapH8,
                        Material(
                          color: sideBarColor,
                          elevation: 0,
                          shape: const StadiumBorder(),
                          clipBehavior: Clip.antiAlias,
                          surfaceTintColor: Colors.white,
                          type: MaterialType.button,
                          child: InkWell(
                            onTap: onActionTap,
                            splashColor: backgroundColor.withOpacity(0.3),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Text(
                                actionText!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ).padLTRB(top: 12, bottom: 12, right: 12),
            )
          ],
        ),
      ),
    );
  }
}
