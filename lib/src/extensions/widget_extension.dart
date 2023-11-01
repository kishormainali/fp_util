import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/num_extension.dart';
import 'package:fp_util/src/widgets/widgets.dart';

extension WidgetX on Widget {
  /// make any widgets scrollable
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    EdgeInsetsGeometry? padding,
    bool primary = false,
    ScrollPhysics physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    Key? key,
  }) =>
      SingleChildScrollView(
        key: key,
        scrollDirection: scrollDirection,
        padding: padding,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
        child: this,
      );

  /// Simple Clickable widget
  Widget clickable({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    Key? key,
    bool opaque = true,
  }) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
        child: this,
      );

  /// convert widget to align top left
  Widget alignTopLeft({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.topLeft,
        child: this,
      );

  /// align widget to to center
  Widget alignTopCenter({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.topCenter,
        child: this,
      );

  /// align widget to top right
  Widget alignTopRight({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.topRight,
        child: this,
      );

  /// align widget ro center left
  Widget alignCenterLeft({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.centerLeft,
        child: this,
      );

  /// converts widget to center
  Widget center({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// align widget to center right
  Widget alignCenterRight({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.centerRight,
        child: this,
      );

  /// align widget to bottom left
  Widget alignBottomLeft({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.bottomLeft,
        child: this,
      );

  /// align widget to bottom center
  Widget alignBottomCenter({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.bottomCenter,
        child: this,
      );

  /// align widget ro bottom right
  Widget alignBottomRight({
    double? widthFactor,
    double? heightFactor,
    Key? key,
  }) =>
      Align(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: Alignment.bottomRight,
        child: this,
      );

  /// wraps padding widget around
  Padding pad(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.all(padding.responsiveR(responsive)),
        child: this,
      );

  /// wraps left top right bottom padding widget around
  Padding padLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          left: left.responsiveW(responsive),
          top: top.responsiveH(responsive),
          right: right.responsiveW(responsive),
          bottom: bottom.responsiveH(responsive),
        ),
        child: this,
      );

  /// wraps top padding widget around
  Padding padTop(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(top: padding.responsiveH(responsive)),
        child: this,
      );

  /// wraps top padding widget around
  Padding padRight(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(right: padding.responsiveW(responsive)),
        child: this,
      );

  /// wraps top padding widget around
  Padding padBottom(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(bottom: padding.responsiveH(responsive)),
        child: this,
      );

  /// wraps top padding widget around
  Padding padLeft(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(left: padding.responsiveW(responsive)),
        child: this,
      );

  /// wraps horizontal padding widget around
  Padding padX(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(horizontal: padding.responsiveW(responsive)),
        child: this,
      );

  /// wraps vertical padding widget around
  Padding padY(
    double padding, {
    Key? key,
    bool responsive = false,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: padding.responsiveH(responsive)),
        child: this,
      );

  /// hides keyboard on tap
  Widget hideKeyboard({Key? key, bool hideOnDrag = false}) => HideKeyboard(
        key: key,
        hideOnDrag: hideOnDrag,
        child: this,
      );
}

extension ResponsiveBoxConstrains on BoxConstraints {
  BoxConstraints get r => copyWith(
        minWidth: minWidth.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        maxHeight: maxHeight.r,
      );

  BoxConstraints get hw => copyWith(
        minWidth: minWidth.w,
        maxWidth: maxWidth.w,
        minHeight: minHeight.h,
        maxHeight: maxHeight.h,
      );

  BoxConstraints get w => copyWith(
        minWidth: minWidth.w,
        maxWidth: maxWidth.w,
        minHeight: minHeight.w,
        maxHeight: maxHeight.w,
      );

  BoxConstraints get h => copyWith(
        minWidth: minWidth.h,
        maxWidth: maxWidth.h,
        minHeight: minHeight.h,
        maxHeight: maxHeight.h,
      );
}

extension ResponsiveRadius on Radius {
  Radius get r => Radius.elliptical(x.r, y.r);
  Radius get w => Radius.elliptical(x.w, y.w);
  Radius get h => Radius.elliptical(x.h, y.h);
}

extension ResponsiveBorderRadius on BorderRadius {
  BorderRadius get r => copyWith(
        topLeft: topLeft.r,
        topRight: topRight.r,
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
      );

  BorderRadius get hw => copyWith(
        topLeft: topLeft.w,
        topRight: topRight.w,
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
      );

  BorderRadius get w => copyWith(
        topLeft: topLeft.w,
        topRight: topRight.w,
        bottomLeft: bottomLeft.w,
        bottomRight: bottomRight.w,
      );

  BorderRadius get h => copyWith(
        topLeft: topLeft.h,
        topRight: topRight.h,
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
      );
}
