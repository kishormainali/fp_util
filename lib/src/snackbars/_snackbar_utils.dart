import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/context_extension.dart';

import 'snackbars.dart';

/// The gap between stack of cards
int gapBetweenCard = 15;

/// calculate position of old cards based on current position
double calculatePosition(
  List<FpSnackbar> toastBars,
  FpSnackbar self,
) {
  if (toastBars.isNotEmpty && self != toastBars.last) {
    final box = self.info.key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      return gapBetweenCard * (toastBars.length - toastBars.indexOf(self) - 1);
    }
  }
  return 0;
}

/// rescale the old cards based on its position
double calculateScaleFactor(
  List<FpSnackbar> toastBars,
  FpSnackbar current,
) {
  int index = toastBars.indexOf(current);
  int indexValFromLast = toastBars.length - 1 - index;
  double factor = indexValFromLast / 25;
  double res = 0.97 - factor;
  return res < 0 ? 0 : res;
}

/// calculate margin based on device width
double calculateMargin(BuildContext context) {
  return context.responsiveValue(
    20,
    tablet: context.width * .15,
    desktop: context.width * .20,
  );
}
