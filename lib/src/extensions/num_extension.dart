import 'package:flutter/material.dart';
import 'package:fp_util/src/responsive/size_utils.dart';

extension NumX on num {
  /// horizontal spacing widget
  SizedBox horizontalSpace([bool responsive = false]) =>
      SizedBox(width: responsive ? toDouble().w : toDouble());

  /// vertical spacing widget
  SizedBox verticalSpace([bool responsive = false]) =>
      SizedBox(height: responsive ? toDouble().h : toDouble());

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
  Future get delayedMicroSeconds async => Future.delayed(toInt().microseconds);

  /// get delayed future in millisecond
  Future get delayedMilliSeconds async => Future.delayed(toInt().milliseconds);

  /// get delayed future in seconds
  Future get delayedSeconds async => Future.delayed(toInt().seconds);

  /// get delayed future in minutes
  Future get delayedMinutes async => Future.delayed(toInt().minutes);

  /// get delayed future in hours
  Future get delayedHours async => Future.delayed(toInt().hours);

  /// get circular radius
  Radius circularRadius([bool responsive = false]) =>
      Radius.circular(responsive ? toDouble().px : toDouble());

  /// get circular border radius geometry
  BorderRadiusGeometry circular([bool responsive = false]) =>
      BorderRadius.circular(responsive ? toDouble().px : toDouble());

  /// circular border radius
  BorderRadius circularBorderRadius([bool responsive = false]) =>
      BorderRadius.circular(responsive ? toDouble().px : toDouble());

  /// get all EdgeInsets
  EdgeInsets all([bool responsive = false]) =>
      EdgeInsets.all(responsive ? toDouble().px : toDouble());

  /// get left EdgeInsets
  EdgeInsets padLeft([bool responsive = false]) =>
      EdgeInsets.only(left: responsive ? toDouble().w : toDouble());

  /// get top EdgeInsets
  EdgeInsets padTop([bool responsive = false]) =>
      EdgeInsets.only(top: responsive ? toDouble().h : toDouble());

  /// get right EdgeInsets
  EdgeInsets padRight([bool responsive = false]) =>
      EdgeInsets.only(right: responsive ? toDouble().w : toDouble());

  /// get bottom EdgeInsets
  EdgeInsets padBottom([bool responsive = false]) =>
      EdgeInsets.only(bottom: responsive ? toDouble().h : toDouble());

  /// horizontal spacing for edge-inset
  EdgeInsets padX([bool responsive = false]) =>
      EdgeInsets.symmetric(horizontal: responsive ? toDouble().w : toDouble());

  /// vertical spacing for edge-inset
  EdgeInsets padY([bool responsive = false]) =>
      EdgeInsets.symmetric(vertical: responsive ? toDouble().h : toDouble());

  /// convert spacing widget into sliver widget
  SliverToBoxAdapter sliverHorizontalSpace([bool responsive = false]) =>
      SliverToBoxAdapter(child: horizontalSpace(responsive));

  /// convert horizontal spacing widget into sliver widget
  SliverToBoxAdapter sliverVerticalSpace([bool responsive = false]) =>
      SliverToBoxAdapter(child: verticalSpace(responsive));

  /// responsive px
  double get px => SizeUtils.instance.getSize(toDouble());

  /// responsive width
  double get w => SizeUtils.instance.setWidth(toDouble());

  /// responsive height
  double get h => SizeUtils.instance.setHeight(toDouble());
}
