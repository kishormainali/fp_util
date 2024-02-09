import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

extension NumX on num {
  /// spacing widget
  Gap get gap => Gap(toDouble());

  /// expanded spacing widget
  /// expands cross axis
  Gap get gapExpanded => Gap.expand(toDouble());

  /// spacing widget
  /// max spacing widget
  /// fills remaining space
  MaxGap get gapMax => MaxGap(toDouble());

  /// expanded spacing widget
  /// max spacing widget
  /// expands cross axis
  MaxGap get gapMaxExpanded => MaxGap.expand(toDouble());

  /// sliver spacing widget
  SliverGap get sliverGap => SliverGap(toDouble());

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
  Radius get circularRadius => Radius.circular(toDouble());

  /// get circular border radius geometry
  BorderRadiusGeometry get circular => BorderRadius.circular(toDouble());

  /// circular border radius
  BorderRadius get circularBorderRadius => BorderRadius.circular(toDouble());

  /// get all EdgeInsets
  EdgeInsets get all => EdgeInsets.all(toDouble());

  /// get left EdgeInsets
  EdgeInsets get padLeft => EdgeInsets.only(left: toDouble());

  /// get top EdgeInsets
  EdgeInsets get padTop => EdgeInsets.only(top: toDouble());

  /// get right EdgeInsets
  EdgeInsets get padRight => EdgeInsets.only(right: toDouble());

  /// get bottom EdgeInsets
  EdgeInsets get padBottom => EdgeInsets.only(bottom: toDouble());

  /// horizontal spacing for edge-inset
  EdgeInsets get padX => EdgeInsets.symmetric(horizontal: toDouble());

  /// vertical spacing for edge-inset
  EdgeInsets get padY => EdgeInsets.symmetric(vertical: toDouble());
}
