import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template hide_keyboard}
///
/// A [HideKeyboard] is a widget that hides keyboard on tap
///
/// {@endtemplate}
///
/// {@tool}
///
/// ```dart
/// HideKeyboard(
///   child: Container(),
///   hideOnDrag: true,
///  useSafeArea: true, // if you want to use safe area
/// )
/// ```
/// {@end-tool}
///
class HideKeyboard extends StatelessWidget {
  const HideKeyboard({
    super.key,
    required this.child,
    this.hideOnDrag = false,
    this.useSafeArea = false,
  });

  /// child widget
  final Widget child;

  /// hide keyboard on drag
  final bool hideOnDrag;

  /// use safe area for child
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.removeFocus(),
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (hideOnDrag) {
          context.removeFocus();
        }
      },
      onVerticalDragEnd: (details) {
        if (hideOnDrag) {
          context.removeFocus();
        }
      },
      child: SafeArea(
        left: useSafeArea,
        top: useSafeArea,
        right: useSafeArea,
        bottom: useSafeArea,
        child: child,
      ),
    );
  }
}
