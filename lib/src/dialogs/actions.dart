import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_dialog.dart';

class BasicDialogAction extends BaseDialog<TextButton, CupertinoDialogAction> {
  const BasicDialogAction({
    super.key,
    super.useMaterial,
    required this.title,
    required this.onPressed,
    this.isIosDestructiveAction = false,
    this.isIosDefaultAction = false,
    this.buttonStyle,
  });

  final Widget title;
  final VoidCallback onPressed;

  /// only for ios
  final bool isIosDestructiveAction;
  final bool isIosDefaultAction;

  /// only for android
  final ButtonStyle? buttonStyle;

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDefaultAction: isIosDefaultAction,
      isDestructiveAction: isIosDestructiveAction,
      child: title,
    );
  }

  @override
  TextButton buildMaterialWidget(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: title,
    );
  }
}
