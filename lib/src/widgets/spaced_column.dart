import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template column_with_space}
///
/// A [ColumnWithSpace] is a [Column] with space between each child.
///
/// {@endtemplate}
class SpacedColumn extends Column {
  SpacedColumn({
    super.key,
    double spacing = 0,
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
  }) : super(children: [
          if (hasLeadingSpace) spacing.verticalSpace,
          ...children.expandIndexed((index, widget) {
            return [
              widget,
              if (index < children.length || hasTrailingSpace)
                spacing.verticalSpace,
            ];
          }),
        ]);
}
