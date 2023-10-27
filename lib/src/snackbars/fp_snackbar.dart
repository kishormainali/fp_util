import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// snackbar helper class
class FPSnackbar {
  /// show custom Snackbar
  static custom(
    BuildContext context, {
    required String message,
    String? title,
    int duration = 3,
    Color backgroundColor = Colors.black12,
    TextStyle textStyle = const TextStyle(
      fontSize: 16,
      height: 1.25,
      color: Colors.white,
    ),
    TextStyle titleTextStyle = const TextStyle(
      fontSize: 16,
      height: 1.25,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    String? actionText,
    VoidCallback? onActionTap,
    bool floating = true,
  }) =>
      _showSnackbar(
        context: context,
        backgroundColor: backgroundColor,
        textStyle: textStyle,
        titleTextStyle: titleTextStyle,
        message: message,
        title: title,
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
        floating: floating,
      );

  /// show success snackbar
  static success(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
    bool floating = true,
  }) =>
      _showSnackbar(
        context: context,
        backgroundColor: const Color(0xFF2D7738),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        message: message,
        title: title,
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
        floating: floating,
      );

  /// show error snackbar
  static error(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
    bool floating = true,
  }) =>
      _showSnackbar(
        context: context,
        backgroundColor: const Color(0xFF970C0C),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        message: message,
        title: title,
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
        floating: floating,
      );

  /// show info snackbar
  static info(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
    bool floating = true,
  }) =>
      _showSnackbar(
        context: context,
        backgroundColor: const Color(0xFF136ACA),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        message: message,
        title: title,
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
        floating: floating,
      );

  /// show warning snackbar
  static warning(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
    bool floating = true,
  }) =>
      _showSnackbar(
        context: context,
        backgroundColor: const Color(0xFFF58C20),
        textStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        message: message,
        title: title,
        duration: 3,
        actionText: actionText,
        onActionTap: onActionTap,
        floating: floating,
      );

  /// common method to show remove and show snackbar
  static void _showSnackbar({
    required BuildContext context,
    required Color backgroundColor,
    required TextStyle textStyle,
    required TextStyle titleTextStyle,
    required String message,
    required String? title,
    required int duration,
    required String? actionText,
    required VoidCallback? onActionTap,
    required bool floating,
  }) {
    final effectiveFloating = floating ||
        context.theme.snackBarTheme.behavior == SnackBarBehavior.floating;
    final effectiveTextStyle =
        textStyle.merge(context.theme.snackBarTheme.contentTextStyle);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _SnackbarWidget(
            message: message,
            title: title,
            backgroundColor: backgroundColor,
            textStyle: effectiveTextStyle,
            titleTextStyle: titleTextStyle,
            actionText: actionText,
            onActionTap: onActionTap,
            floating: effectiveFloating,
          ),
          behavior: effectiveFloating
              ? SnackBarBehavior.floating
              : SnackBarBehavior.fixed,
          backgroundColor: floating ? Colors.transparent : backgroundColor,
          dismissDirection: DismissDirection.startToEnd,
          padding: EdgeInsets.zero,
          elevation: 0,
          width: effectiveFloating
              ? context.responsiveValue(
                  context.width - 48, // 48 is margin
                  tablet: context.pw(.6), // 60% width of screen
                  desktop: context.pw(.6), // 60% width of screen
                )
              : null,
          clipBehavior: Clip.antiAlias,
          duration: Duration(seconds: duration),
        ),
      );
  }
}

class _SnackbarWidget extends StatelessWidget {
  const _SnackbarWidget({
    this.title,
    required this.message,
    required this.backgroundColor,
    this.textStyle,
    this.titleTextStyle,
    this.actionText,
    this.onActionTap,
    required this.floating,
  });

  final Color backgroundColor;
  final String? title;
  final String message;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;

  /// snackbar action
  final String? actionText;
  final VoidCallback? onActionTap;

  final bool floating;

  @override
  Widget build(BuildContext context) {
    final effectiveActionBackground =
        context.theme.snackBarTheme.actionBackgroundColor ??
            backgroundColor.withOpacity(0.3);
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: floating ? backgroundColor : null,
        borderRadius: floating ? 10.circularBorderRadius() : BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotNullNotEmpty) ...[
            Text(
              title!,
              style: titleTextStyle,
            ),
            Sizes.gapV8,
          ],
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
                  elevation: 0,
                  shape: const StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  surfaceTintColor: Colors.white,
                  type: MaterialType.button,
                  child: InkWell(
                    onTap: onActionTap,
                    splashColor: effectiveActionBackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        actionText!,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.theme.snackBarTheme.actionTextColor ??
                              Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
