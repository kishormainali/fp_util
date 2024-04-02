import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

enum SnackbarPosition {
  /// Snackbars are displayed at the top of the screen.
  top,

  /// Snackbars are displayed at the bottom of the screen.
  bottom;

  /// The offset from the edge of the screen to the snackbars.
  Offset get beginOffset {
    return switch (this) {
      top => const Offset(0, -2),
      bottom => const Offset(0, 2),
    };
  }

  /// The margin from the edge of the screen to the snackbars.
  double? topMargin(BuildContext context, double position) {
    return switch (this) {
      top => position + 40 + context.statusBarHeight,
      bottom => null,
    };
  }

  /// The margin from the edge of the screen to the snackbars.
  double? bottomMargin(BuildContext context, double position) {
    return switch (this) {
      top => null,
      bottom => position + 20 + context.bottomBarHeight,
    };
  }
}
