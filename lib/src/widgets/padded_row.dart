import 'package:flutter/material.dart';

/// {@template padded_row}
///
/// A widget that displays its children in a horizontal array with padding.
///
/// This widget is useful when you want to add padding around a row of
/// widgets, but don't want to use [Padding] around the [Row] itself.
///
/// This widget is equivalent to [Padding] with [Row] as its child.
/// {@endtemplate}

class PaddedRow extends StatelessWidget {
  /// {@macro padded_row}
  const PaddedRow({
    super.key,
    required this.padding,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  /// padding around the row
  final EdgeInsetsGeometry padding;

  /// children to display in the row
  final List<Widget> children;

  /// how the children should be placed along the main axis
  final MainAxisAlignment mainAxisAlignment;

  /// how much space should be occupied in the main axis
  final MainAxisSize mainAxisSize;

  /// how the children should be placed along the cross axis
  final CrossAxisAlignment crossAxisAlignment;

  /// the direction in which the text flows
  final TextDirection? textDirection;

  /// the direction in which the children are placed vertically
  final VerticalDirection verticalDirection;

  /// If aligning items according to their baseline, which baseline to use.
  ///
  /// This must be set if using baseline alignment. There is no default because there is no
  /// way for the framework to know the correct baseline _a priori_.
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      ),
    );
  }
}
