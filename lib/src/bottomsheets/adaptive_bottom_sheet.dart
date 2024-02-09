import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fp_util/fp_util.dart';

/// {@template basic_bottom_sheet}
/// Basic bottom sheet
/// {@endtemplate}
class AdaptiveBottomSheet extends PlatformWidget<Widget, CupertinoActionSheet> {
  /// {@macro basic_bottom_sheet}
  const AdaptiveBottomSheet({
    super.key,
    this.title,
    required this.content,
    this.actions = const [],
    this.material = const MaterialActionSheetData(),
    this.cupertino = const CupertinoActionSheetData(),
  });

  /// title
  final Widget? title;

  /// content
  final Widget content;

  /// actions
  final List<SheetAction> actions;

  /// configs for material bottom sheet
  final MaterialActionSheetData material;

  /// configs for cupertino bottom sheet
  final CupertinoActionSheetData cupertino;

  @override
  CupertinoActionSheet buildCupertinoWidget(BuildContext context) {
    return CupertinoActionSheet(
      key: cupertino.widgetKey,
      title: title,
      message: content,
      actions: actions,
      messageScrollController: cupertino.messageScrollController,
      actionScrollController: cupertino.actionScrollController,
      cancelButton: cupertino.cancelButton,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: material.contentPadding ??
            EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: context.bottomBarHeight + 16,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) title!,
            material.titleSpacing.gap,
            content,
            if (actions.isNotEmpty) Sizes.gap12,
            _BasicSheetActions(
              actions: actions,
              wrapActions: material.wrapActions,
              spacing: material.actionsSpacing,
            ),
            if (kIsWeb && cupertino.cancelButton != null) ...[
              Sizes.gap12,
              cupertino.cancelButton!,
            ]
          ],
        ),
      ),
    );
  }
}

/// {@template basic_sheet_actions}
/// Basic sheet actions
///
/// only used in material bottom sheet
/// {@endtemplate}
class _BasicSheetActions extends StatelessWidget {
  /// {@macro basic_sheet_actions}
  const _BasicSheetActions({
    required this.actions,
    required this.wrapActions,
    required this.spacing,
  });

  /// actions
  final List<SheetAction> actions;

  /// wrap actions
  final bool wrapActions;

  /// spacing
  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (wrapActions) {
      return Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: spacing,
        runSpacing: spacing,
        children: actions,
      );
    } else {
      return SpacedColumn(
        spacing: spacing,
        children: actions,
      );
    }
  }
}
