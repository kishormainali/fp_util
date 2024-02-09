import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

import '../widgets/widgets.dart';

/// {@template sheet_action}
/// Action for the platform specific bottom sheet.
/// {@endtemplate}
class SheetAction extends PlatformWidget<Widget, CupertinoActionSheetAction> {
  /// {@macro sheet_action}
  const SheetAction({
    super.key,
    required this.onPressed,
    required this.child,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.useFilledButton = false,
  });

  /// child widget
  final Widget child;

  /// callback when pressed
  final VoidCallback onPressed;

  /// is default action
  ///
  /// default: false
  ///
  /// [CupertinoActionSheetAction.isDefaultAction]
  ///
  /// ignored in material
  final bool isDefaultAction;

  /// is destructive action
  ///
  /// default: false
  ///
  /// [CupertinoActionSheetAction.isDestructiveAction]
  ///
  /// ignored in material
  final bool isDestructiveAction;

  /// use filled button
  ///
  /// default: false
  ///
  /// ignored in cupertino
  final bool useFilledButton;

  @override
  CupertinoActionSheetAction buildCupertinoWidget(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      child: child,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return useFilledButton
        ? FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: isDestructiveAction ? context.errorColor : null,
              foregroundColor: isDestructiveAction ? Colors.white : null,
            ),
            child: child,
          )
        : TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: isDestructiveAction ? context.errorColor : null,
            ),
            child: child,
          );
  }
}

/// {@template material_action_sheet_data}
/// Data for material bottom sheet
/// {@endtemplate}
class MaterialActionSheetData {
  final Key? widgetKey;
  final EdgeInsets? contentPadding;
  final double titleSpacing;
  final bool wrapActions;
  final double actionsSpacing;

  /// {@macro material_action_sheet_data}
  const MaterialActionSheetData({
    this.widgetKey,
    this.contentPadding,
    this.titleSpacing = 12,
    this.wrapActions = false,
    this.actionsSpacing = 12,
  });
}

/// {@template cupertino_action_sheet_data}
/// Data for cupertino bottom sheet
/// {@endtemplate}
class CupertinoActionSheetData {
  final Key? widgetKey;
  final ScrollController? messageScrollController;
  final ScrollController? actionScrollController;
  final SheetAction? cancelButton;

  /// {@macro cupertino_action_sheet_data}
  const CupertinoActionSheetData({
    this.widgetKey,
    this.messageScrollController,
    this.actionScrollController,
    this.cancelButton,
  });
}
