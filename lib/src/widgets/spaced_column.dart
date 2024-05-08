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
  }) : super(children: [
          if (hasLeadingSpace) spacing.gap,
          ...children.expandIndexed((index, widget) {
            return [
              widget,
              if (index < children.length || hasTrailingSpace) spacing.gap,
            ];
          }),
        ]);

  /// A [SpacedColumn] with space between each child and a separator.
  SpacedColumn.separated({
    super.key,
    Widget separator = const SizedBox(height: 10),
    bool hasLeadingSeparator = false,
    bool hasTrailingSeparator = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
  }) : super(
          children: [
            if (hasLeadingSeparator) separator,
            ...children.expandIndexed((index, widget) {
              return [
                widget,
                if (index < children.length || hasTrailingSeparator) separator,
              ];
            }),
          ],
        );
}
