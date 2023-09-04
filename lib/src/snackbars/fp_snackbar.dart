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
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: _SnackbarWidget(
            message: message,
            title: title,
            backgroundColor: backgroundColor,
            textStyle: textStyle,
            titleTextStyle: titleTextStyle,
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
    this.title,
    required this.message,
    required this.backgroundColor,
    this.textStyle,
    this.titleTextStyle,
    this.actionText,
    this.onActionTap,
  });

  final Color backgroundColor;
  final String? title;
  final String message;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;

  /// snackbar action
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: 10.circularBorderRadius,
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
          if (title != null) ...[
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
      ),
    );
  }
}
