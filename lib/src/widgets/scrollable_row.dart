import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// {@template scrollable_row}
///
/// A [ScrollableRow] is a [Row] that can be scrolled.
///
/// {@endtemplate}
class ScrollableRow extends StatelessWidget {
  /// @{macro scrollable_column}
  const ScrollableRow({
    super.key,

    /// row properties
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,

    /// scrollable properties
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  /// children of the row
  final List<Widget> children;

  /// main axis alignment of the row
  final MainAxisAlignment mainAxisAlignment;

  /// main axis size of the row
  final MainAxisSize mainAxisSize;

  /// cross axis alignment of the row
  final CrossAxisAlignment crossAxisAlignment;

  /// text direction of the row
  final TextDirection? textDirection;

  /// vertical direction of the row
  final VerticalDirection verticalDirection;

  /// text baseline of the row
  final TextBaseline? textBaseline;

  /// scrollable properties

  /// reverse: Whether the scroll view scrolls in the reading direction.
  final bool reverse;

  /// padding: The amount of space by which to inset the child.
  final EdgeInsetsGeometry? padding;

  /// primary: Whether this is the primary scroll view associated with the parent
  final bool? primary;

  /// physics: How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// controller: An object that can be used to control the position to which this scroll view is scrolled.
  final ScrollController? controller;

  /// dragStartBehavior: Determines the way that drag start behavior is handled.
  final DragStartBehavior dragStartBehavior;

  /// clipBehavior: How to clip the scrollable's contents.
  final Clip clipBehavior;

  /// restorationId: An identifier that can be used to save and restore the scroll offset of the scrollable.
  final String? restorationId;

  /// keyboardDismissBehavior: Configures how the Scrollable widgets that wrap the content of Scaffold and
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      scrollDirection: Axis.horizontal,
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