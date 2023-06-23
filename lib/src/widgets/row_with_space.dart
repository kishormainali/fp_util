import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

class RowWithSpace extends Row {
  RowWithSpace({
    super.key,
    double spacing = 0,
    bool hasLeadingSpace = false,
    bool hasTrailingSpace = false,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    List<Widget> children = const [],
    bool responsive = false,
  }) : super(children: [
          if (hasLeadingSpace) spacing.horizontalSpace(responsive),
          ...children.expandIndexed(
            (index, child) {
              return [
                child,
                if (index < children.length || hasTrailingSpace)
                  spacing.horizontalSpace(responsive),
              ];
            },
          ),
        ]);
}
