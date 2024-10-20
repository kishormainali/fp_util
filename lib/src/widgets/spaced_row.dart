import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

/// {@template row_with_space}
///
/// A [SpacedRow] is a [Row] with space between each child.
///
/// {@endtemplate}
class SpacedRow extends Row {
  ///{@macro row_with_space}
  SpacedRow({
    super.key,
    double spacing = 10,
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
          if (hasLeadingSpace) spacing.gap,
          ...children.expandIndexed(
            (index, child) {
              return [
                child,
                if (index < children.length || hasTrailingSpace) spacing.gap,
              ];
            },
          ),
        ]);

  /// {@macro row_with_space}
  /// A [SpacedRow] with space between each child and a separator.
  ///
  SpacedRow.separated({
    super.key,
    Widget separator = const SizedBox(width: 10),
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
          if (hasLeadingSpace) separator,
          ...children.expandIndexed(
            (index, child) {
              return [
                child,
                if (index < children.length || hasTrailingSpace) separator,
              ];
            },
          ),
        ]);

  /// {@macro row_with_space}
  /// A [SpacedRow] with space between each child and a divider.
  /// each child is expanded to fill the available space.
  SpacedRow.expanded({
    super.key,
    Widget separator = const SizedBox(width: 10),
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
          if (hasLeadingSpace) separator,
          ...children.expandIndexed(
            (index, child) {
              return [
                Expanded(child: child),
                if (index < children.length || hasTrailingSpace) separator,
              ];
            },
          ),
        ]);
}
