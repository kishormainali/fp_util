import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

class MaterialAlertDialogData {
  final Key? widgetKey;
  final Widget? icon;
  final EdgeInsetsGeometry? iconPadding;
  final Color? iconColor;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;
  final EdgeInsetsGeometry? buttonPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final EdgeInsets insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final bool scrollable = false;

  MaterialAlertDialogData({
    this.widgetKey,
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.titlePadding,
    this.titleTextStyle,
    this.contentPadding,
    this.contentTextStyle,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
  });
}

class CupertinoAlertDialogData {
  final Key? widgetKey;
  final ScrollController? scrollController;
  final ScrollController? actionScrollController;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;

  CupertinoAlertDialogData({
    this.widgetKey,
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
  });
}

class BasicPlatformDialog
    extends PlatformWidget<AlertDialog, CupertinoAlertDialog> {
  const BasicPlatformDialog({
    super.key,
    super.useMaterial = false,
    this.title,
    this.content,
    this.actions = const [],
    this.material,
    this.cupertino,
  });

  /// title widget
  final Widget? title;

  /// content widget
  final Widget? content;

  /// action widgets
  final List<Widget> actions;

  /// properties for material dialog
  final MaterialAlertDialogData? material;

  /// properties for cupertino dialog
  final CupertinoAlertDialogData? cupertino;

  @override
  CupertinoAlertDialog buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      key: cupertino?.widgetKey,
      title: title,
      content: content,
      actions: actions,
      scrollController: cupertino?.scrollController,
      actionScrollController: cupertino?.actionScrollController,
      insetAnimationDuration: cupertino?.insetAnimationDuration ??
          const Duration(milliseconds: 100),
      insetAnimationCurve: cupertino?.insetAnimationCurve ?? Curves.decelerate,
    );
  }

  @override
  AlertDialog buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      key: material?.widgetKey,
      title: title,
      content: content,
      actions: actions,
      scrollable: material?.scrollable ?? false,
      backgroundColor: material?.backgroundColor,
      elevation: material?.elevation,
      semanticLabel: material?.semanticLabel,
      shape: material?.shape,
      titlePadding: material?.titlePadding,
      contentPadding: material?.contentPadding,
      contentTextStyle: material?.contentTextStyle,
      actionsPadding: material?.actionsPadding,
      buttonPadding: material?.buttonPadding,
      actionsOverflowButtonSpacing: material?.actionsOverflowButtonSpacing,
      actionsOverflowDirection: material?.actionsOverflowDirection,
      icon: material?.icon,
      iconPadding: material?.iconPadding,
      iconColor: material?.iconColor,
      insetPadding: material?.insetPadding ?? _defaultInsetPadding,
      clipBehavior: material?.clipBehavior ?? Clip.none,
      shadowColor: material?.shadowColor,
      surfaceTintColor: material?.surfaceTintColor,
      actionsOverflowAlignment: material?.actionsOverflowAlignment,
      actionsAlignment: material?.actionsAlignment,
      titleTextStyle: material?.titleTextStyle,
      alignment: material?.alignment,
    );
  }
}
