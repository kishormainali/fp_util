import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// {@template constrained_scrollable_column}
/// A scrollable column wrapped with [LayoutBuilder] and [ConstrainedBox] with minHeight is maxHeight of [LayoutBuilder]'s constraints.
/// {@endtemplate}
class ConstrainedScrollableColumn extends StatelessWidget {
  /// {@macro constrained_scrollable_column}
  const ConstrainedScrollableColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.centerScrollable = false,
  });

  /// children of the column
  final List<Widget> children;

  /// main axis alignment of the column
  final MainAxisAlignment mainAxisAlignment;

  /// main axis size of the column
  final MainAxisSize mainAxisSize;

  /// cross axis alignment of the column
  final CrossAxisAlignment crossAxisAlignment;

  /// text direction of the column
  final TextDirection? textDirection;

  /// vertical direction of the column
  final VerticalDirection verticalDirection;

  /// text baseline of the column
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

  /// centerScrollable: Whether to center the scrollable in the available space.
  final bool centerScrollable;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Align(
            alignment:
                centerScrollable ? Alignment.center : Alignment.topCenter,
            child: SingleChildScrollView(
              key: key,
              scrollDirection: Axis.vertical,
              reverse: reverse,
              padding: padding,
              primary: primary,
              physics: physics,
              controller: controller,
              dragStartBehavior: dragStartBehavior,
              clipBehavior: clipBehavior,
              restorationId: restorationId,
              keyboardDismissBehavior: keyboardDismissBehavior,
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                textDirection: textDirection,
                verticalDirection: verticalDirection,
                textBaseline: textBaseline,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
