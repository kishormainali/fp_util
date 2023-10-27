import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template column_with_space}
///
/// A [SpacedColumn] is a [Column] with space between each child.
///
/// {@endtemplate}
class SpacedColumn extends Column {
  SpacedColumn({
    super.key,
    double spacing = 10,
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
    bool responsive = false,
  }) : super(children: [
          if (hasLeadingSpace) spacing.verticalSpace(responsive),
          ...children.expandIndexed((index, widget) {
            return [
              widget,
              if (index < children.length || hasTrailingSpace)
                spacing.verticalSpace(responsive),
            ];
          }),
        ]);

  SpacedColumn.separated({
    super.key,
    Widget separator = const SizedBox(height: 10),
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
          if (hasLeadingSpace) separator,
          ...children.expandIndexed((index, widget) {
            return [
              widget,
              if (index < children.length || hasTrailingSpace) separator,
            ];
          }),
        ]);
}
