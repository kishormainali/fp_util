import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// hide keyboard on tap
///
/// ```dart
/// HideKeyboard(
///  child: Container(),
///  hideOnDrag: true,
/// )
/// ```
class HideKeyboard extends StatelessWidget {
  const HideKeyboard({
    super.key,
    required this.child,
    this.hideOnDrag = false,
  });

  /// child widget
  final Widget child;

  /// hide keyboard on drag
  final bool hideOnDrag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.removeFocus(),
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
      child: child,
    );
  }
}
