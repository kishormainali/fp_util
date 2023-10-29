import 'package:flutter/material.dart';

/// {@template padded_column}
/// A widget that displays its children in a vertical array with padding.
///
/// This widget is useful when you want to add padding around a column of
/// widgets, but don't want to use [Padding] around the [Column] itself.
///
/// This widget is equivalent to [Padding] with [Column] as its child.
/// {@endtemplate}
class PaddedColumn extends Padding {
  /// {@macro padded_column}
  PaddedColumn({
    super.key,
    required super.padding,
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) : super(
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
