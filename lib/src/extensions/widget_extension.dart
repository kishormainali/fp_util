import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/src/widgets/widgets.dart';

extension WidgetX on Widget {
  /// make any widgets scrollable
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    EdgeInsetsGeometry? padding,
    bool primary = false,
    ScrollPhysics physics =
        const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
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
  }) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        behavior: HitTestBehavior.opaque,
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
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.all(padding),
        child: this,
      );

  /// wraps left top right bottom padding widget around
  Padding padLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  /// wraps top padding widget around
  Padding padTop(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(top: padding),
        child: this,
      );

  /// wraps top padding widget around
  Padding padRight(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(right: padding),
        child: this,
      );

  /// wraps top padding widget around
  Padding padBottom(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );

  /// wraps top padding widget around
  Padding padLeft(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(left: padding),
        child: this,
      );

  /// wraps horizontal padding widget around
  Padding padX(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  /// wraps vertical padding widget around
  Padding padY(
    double padding, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  /// hides keyboard on tap
  Widget hideKeyboard({Key? key, bool hideOnDrag = false}) => HideKeyboard(
        key: key,
        hideOnDrag: hideOnDrag,
        child: this,
      );
}
