import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';
import 'package:gap/gap.dart';

extension NumX on num {
  /// spacing widget
  Gap gap([bool responsive = false]) => Gap(responsiveR(responsive));

  /// expanded spacing widget
  /// expands cross axis
  Gap gapExpanded([bool responsive = false]) => Gap.expand(responsiveR(responsive));

  /// spacing widget
  /// max spacing widget
  /// fills remaining space
  MaxGap gapMax([bool responsive = false]) => MaxGap(responsiveR(responsive));

  /// expanded spacing widget
  /// max spacing widget
  /// expands cross axis
  MaxGap gapMaxExpanded([bool responsive = false]) => MaxGap.expand(responsiveR(responsive));

  /// sliver spacing widget
  SliverGap sliverGap([bool responsive = false]) => SliverGap(responsiveR(responsive));

  /// duration in microseconds
  Duration get microseconds => Duration(microseconds: toInt());

  /// duration in milliseconds
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// duration in seconds
  Duration get seconds => Duration(seconds: toInt());

  /// duration in minutes
  Duration get minutes => Duration(minutes: toInt());

  /// duration in hours
  Duration get hours => Duration(hours: toInt());

  /// duration in days
  Duration get days => Duration(days: toInt());

  /// get delayed future in microsecond
  Future delayedMicroSeconds([
    FutureOr<dynamic> Function()? callback,
  ]) {
    return Future.delayed(
      toInt().microseconds,
      callback,
    );
  }

  /// get delayed future in millisecond
  Future delayedMilliSeconds([
    FutureOr<dynamic> Function()? callback,
  ]) {
    return Future.delayed(
      toInt().milliseconds,
      callback,
    );
  }

  /// get delayed future in seconds
  Future delayedSeconds([
    FutureOr<dynamic> Function()? callback,
  ]) {
    return Future.delayed(
      toInt().seconds,
      callback,
    );
  }

  /// get delayed future in minutes
  Future delayedMinutes([
    FutureOr<dynamic> Function()? callback,
  ]) {
    return Future.delayed(
      toInt().minutes,
      callback,
    );
  }

  /// get delayed future in hours
  Future delayedHours(
    FutureOr<dynamic> Function()? callback,
  ) {
    return Future.delayed(
      toInt().hours,
      callback,
    );
  }

  /// get circular radius
  Radius circularRadius([bool responsive = false]) => Radius.circular(responsiveR(responsive));

  /// get circular border radius geometry
  BorderRadiusGeometry circular([bool responsive = false]) => BorderRadius.circular(responsiveR(responsive));

  /// circular border radius
  BorderRadius circularBorderRadius([bool responsive = false]) => BorderRadius.circular(responsiveR(responsive));

  /// get all EdgeInsets
  EdgeInsets all([bool responsive = false]) => EdgeInsets.all(responsiveR(responsive));

  /// get left EdgeInsets
  EdgeInsets padLeft([bool responsive = false]) => EdgeInsets.only(left: responsiveW(responsive));

  /// get top EdgeInsets
  EdgeInsets padTop([bool responsive = false]) => EdgeInsets.only(top: responsiveH(responsive));

  /// get right EdgeInsets
  EdgeInsets padRight([bool responsive = false]) => EdgeInsets.only(right: responsiveW(responsive));

  /// get bottom EdgeInsets
  EdgeInsets padBottom([bool responsive = false]) => EdgeInsets.only(bottom: responsiveH(responsive));

  /// horizontal spacing for edge-inset
  EdgeInsets padX([bool responsive = false]) => EdgeInsets.symmetric(horizontal: responsiveW(responsive));

  /// vertical spacing for edge-inset
  EdgeInsets padY([bool responsive = false]) => EdgeInsets.symmetric(vertical: responsiveH(responsive));

  /// set responsive width
  double get w => SizeUtils.instance.setWidth(toDouble());

  /// set responsive height
  double get h => SizeUtils.instance.setHeight(toDouble());

  /// set responsive text size
  double get sp => SizeUtils.instance.setFontSize(toDouble());

  /// set responsive  radius
  double get r => SizeUtils.instance.getSize(toDouble());

  double responsiveW(bool responsive) {
    return responsive ? SizeUtils.instance.setWidth(toDouble()) : toDouble();
  }

  double responsiveH(bool responsive) {
    return responsive ? SizeUtils.instance.setHeight(toDouble()) : toDouble();
  }

  double responsiveR(bool responsive) {
    return responsive ? SizeUtils.instance.getSize(toDouble()) : toDouble();
  }
}
