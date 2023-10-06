import 'package:flutter/material.dart';

/// {@template padded_column}
/// A widget that displays its children in a vertical array with padding.
///
/// This widget is useful when you want to add padding around a column of
/// widgets, but don't want to use [Padding] around the [Column] itself.
///
/// This widget is equivalent to [Padding] with [Column] as its child.
/// {@endtemplate}
class PaddedColumn extends StatelessWidget {
  /// {@macro padded_column}
  const PaddedColumn({
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

  /// padding around the column
  final EdgeInsetsGeometry padding;

  /// children to display in the column
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
      child: Column(
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
