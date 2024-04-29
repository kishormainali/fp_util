import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template scrollable_row}
///
/// A [ScrollableRow] is a [Row] that can be scrolled.
///
/// {@endtemplate}
class ScrollableRow extends SingleChildScrollView {
  /// @{macro scrollable_column}
  ScrollableRow({
    super.key,
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    super.reverse,
    super.padding,
    super.primary,
    super.physics,
    super.controller,
    super.dragStartBehavior,
    super.clipBehavior,
    super.restorationId,
    super.keyboardDismissBehavior,
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

  /// @{macro scrollable_column}
  ///
  /// [spacing] is the space between each child.
  ScrollableRow.spaced({
    super.key,
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    double spacing = 10,
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.reverse,
    super.padding,
    super.primary,
    super.physics,
    super.controller,
    super.dragStartBehavior,
    super.clipBehavior,
    super.restorationId,
    super.keyboardDismissBehavior,
  }) : super(
          child: SpacedRow(
            spacing: spacing,
            hasLeadingSpace: hasLeadingSpace,
            hasTrailingSpace: hasTrailingSpace,
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            textBaseline: textBaseline,
            children: children,
          ),
        );

  /// @{macro scrollable_column}
  ///
  /// [separator] is the widget that separates each child. default is [Gap(10)]
  ///
  ScrollableRow.separated({
    super.key,
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget separator = const Gap(10),
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.reverse,
    super.padding,
    super.primary,
    super.physics,
    super.controller,
    super.dragStartBehavior,
    super.clipBehavior,
    super.restorationId,
    super.keyboardDismissBehavior,
  }) : super(
          child: SpacedRow.separated(
            separator: separator,
            hasLeadingSpace: hasLeadingSpace,
            hasTrailingSpace: hasTrailingSpace,
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
