import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'scrollable_row.dart';

/// {@template sized_scrollable_row}
/// A scrollable row wrapped with [SizedBox] with height.
/// {@endtemplate}

class SizedScrollableRow extends SizedBox {
  /// {@macro sized_scrollable_row}
  SizedScrollableRow({
    super.key,
    required super.height,
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) : super(
          width: double.infinity,
          child: ScrollableRow(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            textBaseline: textBaseline,
            reverse: reverse,
            padding: padding,
            primary: primary,
            physics: physics,
            controller: controller,
            dragStartBehavior: dragStartBehavior,
            clipBehavior: clipBehavior,
            restorationId: restorationId,
            keyboardDismissBehavior: keyboardDismissBehavior,
            children: children,
          ),
        );
}
