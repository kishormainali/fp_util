import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class MaterialActionData {
  MaterialActionData({
    this.widgetKey,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
    this.icon,
    this.useTextButton = true,
  });
  final Key? widgetKey;
  final VoidCallback? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior = Clip.none;
  final MaterialStatesController? statesController;
  final Widget? icon;
  final bool useTextButton;
}

class CupertinoActionData {
  final Key? widgetKey;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final TextStyle? textStyle;

  CupertinoActionData({
    this.widgetKey,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.textStyle,
  });
}

class PlatformDialogAction
    extends PlatformWidget<Widget, CupertinoDialogAction> {
  const PlatformDialogAction({
    super.key,
    super.useMaterial = false,
    required this.child,
    this.onPressed,
    this.material,
    this.cupertino,
  });

  /// child widget
  final Widget child;

  /// action onPressed callback
  final VoidCallback? onPressed;

  /// action properties for material
  final MaterialActionData? material;

  /// action properties for cupertino
  final CupertinoActionData? cupertino;

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      key: cupertino?.widgetKey,
      onPressed: onPressed,
      isDefaultAction: cupertino?.isDefaultAction ?? false,
      isDestructiveAction: cupertino?.isDestructiveAction ?? false,
      textStyle: cupertino?.textStyle,
      child: child,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    final icon = material?.icon;
    final useTextButton = material?.useTextButton ?? true;

    if (icon != null && useTextButton) {
      return TextButton.icon(
        key: material?.widgetKey,
        onPressed: onPressed,
        onLongPress: material?.onLongPress,
        onHover: material?.onHover,
        onFocusChange: material?.onFocusChange,
        style: material?.style,
        focusNode: material?.focusNode,
        autofocus: material?.autofocus ?? false,
        clipBehavior: material?.clipBehavior ?? Clip.none,
        statesController: material?.statesController,
        icon: icon,
        label: child,
      );
    }

    if (icon != null && !useTextButton) {
      return FilledButton.icon(
        key: material?.widgetKey,
        onPressed: onPressed,
        onLongPress: material?.onLongPress,
        onHover: material?.onHover,
        onFocusChange: material?.onFocusChange,
        style: material?.style,
        focusNode: material?.focusNode,
        autofocus: material?.autofocus ?? false,
        clipBehavior: material?.clipBehavior ?? Clip.none,
        statesController: material?.statesController,
        icon: icon,
        label: child,
      );
    }

    if (useTextButton) {
      return TextButton(
        key: material?.widgetKey,
        onPressed: onPressed,
        onLongPress: material?.onLongPress,
        onHover: material?.onHover,
        onFocusChange: material?.onFocusChange,
        style: material?.style,
        focusNode: material?.focusNode,
        autofocus: material?.autofocus ?? false,
        clipBehavior: material?.clipBehavior ?? Clip.none,
        statesController: material?.statesController,
        child: child,
      );
    }

    return FilledButton.tonal(
      key: material?.widgetKey,
      onPressed: onPressed,
      onLongPress: material?.onLongPress,
      onHover: material?.onHover,
      onFocusChange: material?.onFocusChange,
      style: material?.style,
      focusNode: material?.focusNode,
      autofocus: material?.autofocus ?? false,
      clipBehavior: material?.clipBehavior ?? Clip.none,
      statesController: material?.statesController,
      child: child,
    );
  }
}
