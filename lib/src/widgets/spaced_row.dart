import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

/// {@template row_with_space}
///
/// A [SpacedRow] is a [Row] with space between each child.
///
/// {@endtemplate}
class SpacedRow extends Row {
  SpacedRow({
    super.key,
    double spacing = 8.0,
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
  }) : super(children: [
          if (hasLeadingSpace) spacing.horizontalSpace,
          ...children.expandIndexed(
            (index, child) {
              return [
                child,
                if (index < children.length || hasTrailingSpace)
                  spacing.horizontalSpace,
              ];
            },
          ),
        ]);
}
