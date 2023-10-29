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

class PaddedRow extends Padding {
  /// {@macro padded_row}
  PaddedRow({
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
