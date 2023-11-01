import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

class FPSnackBarStyle extends Equatable {
  final TextStyle textStyle;
  final TextStyle titleTextStyle;
  final Color backgroundColor;

  const FPSnackBarStyle({
    required this.textStyle,
    required this.titleTextStyle,
    required this.backgroundColor,
  });

  @override
  List<Object?> get props => [
        textStyle,
        titleTextStyle,
        backgroundColor,
      ];
}

const _defaultTitleStyle = TextStyle(
  fontSize: 16,
  height: 1.25,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const _defaultTextStyle = TextStyle(
  fontSize: 16,
  height: 1.25,
  color: Colors.white,
);

/// {@template fp_snackbar}
/// A singleton class to show snackbar
/// {@endtemplate}
class FPSnackbar {
  FPSnackbar._() {
    _defaultStyle = const FPSnackBarStyle(
      textStyle: _defaultTextStyle,
      titleTextStyle: _defaultTitleStyle,
      backgroundColor: Colors.black,
    );

    /// default success style
    _successStyle = const FPSnackBarStyle(
      textStyle: _defaultTextStyle,
      titleTextStyle: _defaultTitleStyle,
      backgroundColor: Color(0xFF2D7738),
    );

    /// default error style
    _errorStyle = const FPSnackBarStyle(
      textStyle: _defaultTextStyle,
      titleTextStyle: _defaultTitleStyle,
      backgroundColor: Color(0xFF970C0C),
    );

    /// default info style
    _infoStyle = const FPSnackBarStyle(
      textStyle: _defaultTextStyle,
      titleTextStyle: _defaultTitleStyle,
      backgroundColor: Color(0xFF136ACA),
    );

    /// default warning style
    _warningStyle = const FPSnackBarStyle(
      textStyle: _defaultTextStyle,
      titleTextStyle: _defaultTitleStyle,
      backgroundColor: Color(0xFFF58C20),
    );

    /// default duration
    _duration = 3;

    /// default floating
    _floating = true;

    /// default center message text
    _centerText = false;

    /// default content max lines
    _contentMaxLines = 2;
  }

  static final FPSnackbar _instance = FPSnackbar._();

  factory FPSnackbar() => _instance;

  /// singleton instance
  static FPSnackbar get instance => _instance;

  /// text style
  late FPSnackBarStyle _defaultStyle;

  /// set default text style
  set defaultStyle(FPSnackBarStyle defaultStyle) => _defaultStyle = defaultStyle;

  /// success style
  late FPSnackBarStyle _successStyle;

  /// set default title text style
  set successStyle(FPSnackBarStyle successStyle) => _successStyle = successStyle;

  /// error style
  late FPSnackBarStyle _errorStyle;

  /// set default error style
  set errorStyle(FPSnackBarStyle errorStyle) => _errorStyle = errorStyle;

  /// info style
  late FPSnackBarStyle _infoStyle;

  /// set default info style
  set infoStyle(FPSnackBarStyle infoStyle) => _infoStyle = infoStyle;

  /// warning style
  late FPSnackBarStyle _warningStyle;

  /// set default warning style
  set warningStyle(FPSnackBarStyle warningStyle) => _warningStyle = warningStyle;

  /// duration for snackbar dismiss
  late int _duration;

  /// set default duration
  set duration(int duration) => _duration = duration;

  /// flag to show floating snackbar
  late bool _floating;

  /// set default floating
  set floating(bool floating) => _floating = floating;

  /// message text align
  late bool _centerText;

  /// set default center message text
  set centerText(bool centerText) => _centerText = centerText;

  late int? _contentMaxLines;

  /// set default content max lines
  set contentMaxLines(int? contentMaxLines) => _contentMaxLines = contentMaxLines;

  /// show default snackbar
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    _instance._showSnackbar(
      context: context,
      backgroundColor: _instance._defaultStyle.backgroundColor,
      textStyle: _instance._defaultStyle.textStyle,
      titleTextStyle: _instance._defaultStyle.titleTextStyle,
      message: message,
      title: title,
      duration: _instance._duration,
      actionText: actionText,
      onActionTap: onActionTap,
      floating: _instance._floating,
      centerText: _instance._centerText,
      contentMaxLines: _instance._contentMaxLines,
    );
  }

  /// show success snackbar
  static void success(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    _instance._showSnackbar(
      context: context,
      backgroundColor: _instance._successStyle.backgroundColor,
      textStyle: _instance._successStyle.textStyle,
      titleTextStyle: _instance._successStyle.titleTextStyle,
      message: message,
      title: title,
      duration: _instance._duration,
      actionText: actionText,
      onActionTap: onActionTap,
      floating: _instance._floating,
      centerText: _instance._centerText,
      contentMaxLines: _instance._contentMaxLines,
    );
  }

  /// show error snackbar
  static void error(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    _instance._showSnackbar(
      context: context,
      backgroundColor: _instance._errorStyle.backgroundColor,
      textStyle: _instance._errorStyle.textStyle,
      titleTextStyle: _instance._errorStyle.titleTextStyle,
      message: message,
      title: title,
      duration: _instance._duration,
      actionText: actionText,
      onActionTap: onActionTap,
      floating: _instance._floating,
      centerText: _instance._centerText,
      contentMaxLines: _instance._contentMaxLines,
    );
  }

  /// show warning snackbar
  static void warning(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    _instance._showSnackbar(
      context: context,
      backgroundColor: _instance._warningStyle.backgroundColor,
      textStyle: _instance._warningStyle.textStyle,
      titleTextStyle: _instance._warningStyle.titleTextStyle,
      message: message,
      title: title,
      duration: _instance._duration,
      actionText: actionText,
      onActionTap: onActionTap,
      floating: _instance._floating,
      centerText: _instance._centerText,
      contentMaxLines: _instance._contentMaxLines,
    );
  }

  /// show info snackbar
  static void info(
    BuildContext context, {
    required String message,
    String? title,
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    _instance._showSnackbar(
      context: context,
      backgroundColor: _instance._infoStyle.backgroundColor,
      textStyle: _instance._infoStyle.textStyle,
      titleTextStyle: _instance._infoStyle.titleTextStyle,
      message: message,
      title: title,
      duration: _instance._duration,
      actionText: actionText,
      onActionTap: onActionTap,
      floating: _instance._floating,
      centerText: _instance._centerText,
      contentMaxLines: _instance._contentMaxLines,
    );
  }

  /// common method to show remove and show snackbar
  void _showSnackbar({
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
    required bool centerText,
    required int? contentMaxLines,
  }) {
    final effectiveFloating = floating || context.theme.snackBarTheme.behavior == SnackBarBehavior.floating;
    final effectiveTextStyle = textStyle.merge(context.theme.snackBarTheme.contentTextStyle);
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
            centerText: centerText,
            contentMaxLines: contentMaxLines,
          ),
          behavior: effectiveFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
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
    required this.centerText,
    this.contentMaxLines,
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
  final bool centerText;
  final int? contentMaxLines;

  TextAlign get textAlign => centerText ? TextAlign.center : TextAlign.start;

  @override
  Widget build(BuildContext context) {
    final effectiveActionBackground = context.theme.snackBarTheme.actionBackgroundColor ?? backgroundColor.withOpacity(0.3);
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title.isNotNullNotEmpty) ...[
            Text(
              title!,
              style: titleTextStyle,
              textAlign: textAlign,
            ),
            Sizes.gap8,
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: textStyle,
                  maxLines: contentMaxLines,
                  overflow: contentMaxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
                  textAlign: textAlign,
                ),
              ),
              if (actionText != null) ...[
                Sizes.gap8,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        actionText!,
                        style: TextStyle(
                          fontSize: 12,
                          color: context.theme.snackBarTheme.actionTextColor ?? Colors.white,
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
