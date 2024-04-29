import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';
import 'package:fp_util/src/snackbars/_snackbar_widget.dart';

import '_snackbar_utils.dart';
import 'raw_snackbar.dart';

List<FpSnackbar> _snackBars = [];

const _defaultSnackBarDuration = Duration(seconds: 3);

const _defaultAnimationDuration = Duration(milliseconds: 300);

class FpSnackbar {
  /// Duration of toast when autoDismiss is true
  final Duration snackbarDuration;

  /// Position of toast
  final SnackbarPosition position;

  /// Set true to dismiss toast automatically based on snackbarDuration
  final bool autoDismiss;

  /// Pass the widget inside builder context
  final WidgetBuilder builder;

  /// Duration of animated transitions
  final Duration animationDuration;

  /// Animation Curve
  final Curve? animationCurve;

  /// Info on each snackbar
  late SnackbarInfo info;

  static OverlayEntry? _loadingOverlay;

  FpSnackbar._({
    this.snackbarDuration = _defaultSnackBarDuration,
    this.position = SnackbarPosition.bottom,
    this.autoDismiss = true,
    required this.builder,
    this.animationDuration = _defaultAnimationDuration,
    this.animationCurve,
  });

  /// Remove individual snackbar on dismiss
  void _remove() {
    info.entry.remove();
    _snackBars.removeWhere((element) => element == this);
  }

  /// show the snackbar in current context
  static void show(
    BuildContext context, {
    required WidgetBuilder builder,
    Duration snackbarDuration = _defaultSnackBarDuration,
    SnackbarPosition position = SnackbarPosition.bottom,
    bool autoDismiss = true,
    Duration animationDuration = _defaultAnimationDuration,
    Curve? animationCurve,
  }) {
    FpSnackbar._(
      snackbarDuration: snackbarDuration,
      position: position,
      autoDismiss: autoDismiss,
      builder: builder,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    )._show(context);
  }

  /// show the success snackbar in current context
  static void success(
    BuildContext context, {
    required String message,
    Duration snackbarDuration = _defaultSnackBarDuration,
    SnackbarPosition position = SnackbarPosition.bottom,
    bool autoDismiss = true,
    Duration animationDuration = _defaultAnimationDuration,
    Curve? animationCurve,
    String? title,
    TextStyle? textStyle,
    TextStyle? titleTextStyle,
    Widget? action,
    int? contentMaxLines,
    bool centerText = false,
  }) {
    FpSnackbar._(
      snackbarDuration: snackbarDuration,
      position: position,
      autoDismiss: autoDismiss,
      builder: (context) => SnackbarWidget(
        message: message,
        backgroundColor: Colors.green,
        centerText: centerText,
        title: title,
        textStyle: textStyle,
        titleTextStyle: titleTextStyle,
        action: action,
        contentMaxLines: contentMaxLines,
      ),
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    )._show(context);
  }

  /// show the error snackbar in current context
  static void error(
    BuildContext context, {
    required String message,
    Duration snackbarDuration = _defaultSnackBarDuration,
    SnackbarPosition position = SnackbarPosition.bottom,
    bool autoDismiss = true,
    Duration animationDuration = _defaultAnimationDuration,
    Curve? animationCurve,
    String? title,
    TextStyle? textStyle,
    TextStyle? titleTextStyle,
    Widget? action,
    int? contentMaxLines,
    bool centerText = false,
  }) {
    FpSnackbar._(
      snackbarDuration: snackbarDuration,
      position: position,
      autoDismiss: autoDismiss,
      builder: (context) => SnackbarWidget(
        message: message,
        backgroundColor: Colors.red,
        centerText: centerText,
        title: title,
        textStyle: textStyle,
        titleTextStyle: titleTextStyle,
        action: action,
        contentMaxLines: contentMaxLines,
      ),
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    )._show(context);
  }

  /// show the warning snackbar in current context
  static void warning(
    BuildContext context, {
    required String message,
    Duration snackbarDuration = _defaultSnackBarDuration,
    SnackbarPosition position = SnackbarPosition.bottom,
    bool autoDismiss = true,
    Duration animationDuration = _defaultAnimationDuration,
    Curve? animationCurve,
    String? title,
    TextStyle? textStyle,
    TextStyle? titleTextStyle,
    Widget? action,
    int? contentMaxLines,
    bool centerText = false,
  }) {
    FpSnackbar._(
      snackbarDuration: snackbarDuration,
      position: position,
      autoDismiss: autoDismiss,
      builder: (context) => SnackbarWidget(
        message: message,
        backgroundColor: Colors.orange,
        centerText: centerText,
        title: title,
        textStyle: textStyle,
        titleTextStyle: titleTextStyle,
        action: action,
        contentMaxLines: contentMaxLines,
      ),
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    )._show(context);
  }

  static showLoading(
    BuildContext context, {
    Widget? loadingWidget,
  }) {
    final overlayState = Navigator.of(context).overlay!;
    _loadingOverlay?.remove();
    _loadingOverlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  loadingWidget ??
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                ],
              ),
            ),
            const ModalBarrier(),
          ],
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      assert(_loadingOverlay != null);
      overlayState.insert(_loadingOverlay!);
    });
  }

  /// Hide the loading overlay
  static void hideLoading() {
    if (_loadingOverlay != null) {
      _loadingOverlay!.remove();
    }
  }

  /// Push the snackbar in current context
  void _show(BuildContext context) {
    OverlayState overlayState = Navigator.of(context).overlay!;
    info = SnackbarInfo(
      key: GlobalKey<RawSnackbarState>(),
      createdAt: DateTime.now(),
    );
    info.entry = OverlayEntry(
      builder: (_) => RawSnackbar(
        key: info.key,
        animationDuration: animationDuration,
        snackbarPosition: position,
        animationCurve: animationCurve,
        autoDismiss: autoDismiss,
        position: calculatePosition(_snackBars, this),
        scaleFactor: calculateScaleFactor(_snackBars, this),
        snackbarDuration: snackbarDuration,
        onRemove: _remove,
        child: builder.call(context),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _snackBars.add(this);
      overlayState.insert(info.entry);
    });
  }

  /// Remove all the snackbar in the context
  static void removeAll() {
    for (final snackbar in _snackBars) {
      snackbar.info.entry.remove();
    }
    _snackBars.clear();
  }
}

class SnackbarInfo {
  late OverlayEntry entry;
  final GlobalKey<RawSnackbarState> key;
  final DateTime createdAt;

  SnackbarInfo({
    required this.key,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SnackbarInfo && other.key == key && other.createdAt == createdAt && other.entry == entry;
  }

  @override
  int get hashCode => entry.hashCode ^ key.hashCode ^ createdAt.hashCode;
}
