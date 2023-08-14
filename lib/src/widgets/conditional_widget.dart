import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  const ConditionalWidget({
    super.key,
    required this.condition,
    required this.trueChild,
    this.falseChild = const SizedBox.shrink(),
  });

  /// condition to check
  final bool condition;

  /// widget to show if condition is true
  final Widget trueChild;

  /// widget to show if condition is false,
  /// default is SizedBox.shrink()
  final Widget falseChild;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return trueChild;
    } else {
      return falseChild;
    }
  }
}
