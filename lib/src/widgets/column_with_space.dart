import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

class ColumnWithSpace extends Column {
  ColumnWithSpace({
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
}
