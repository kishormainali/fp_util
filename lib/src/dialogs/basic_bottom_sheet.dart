import 'package:flutter/cupertino.dart';
import 'package:fp_util/fp_util.dart';

class MaterialActionSheetData {
  final Key? widgetKey;
  final EdgeInsets? contentPadding;
  final List<Widget>? actions;
  final double titleSpacing;

  MaterialActionSheetData({
    this.widgetKey,
    this.contentPadding,
    this.actions,
    this.titleSpacing = 12,
  });
}

class CupertinoActionSheetData {
  final Key? widgetKey;
  final List<CupertinoActionSheetAction>? actions;
  final ScrollController? messageScrollController;
  final ScrollController? actionScrollController;
  final Widget? cancelButton;

  CupertinoActionSheetData({
    this.widgetKey,
    this.actions,
    this.messageScrollController,
    this.actionScrollController,
    this.cancelButton,
  });
}

class BasicBottomSheet extends PlatformWidget<Widget, CupertinoActionSheet> {
  const BasicBottomSheet({
    super.key,
    super.useMaterial = false,
    this.title,
    required this.content,
    this.material,
    this.cupertino,
  });

  final Widget? title;
  final Widget content;

  final MaterialActionSheetData? material;
  final CupertinoActionSheetData? cupertino;

  @override
  CupertinoActionSheet buildCupertinoWidget(BuildContext context) {
    return CupertinoActionSheet(
      key: cupertino?.widgetKey,
      title: title,
      message: content,
      actions: cupertino?.actions,
      messageScrollController: cupertino?.messageScrollController,
      actionScrollController: cupertino?.actionScrollController,
      cancelButton: cupertino?.cancelButton,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: material?.contentPadding ?? const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) title!,
            material?.titleSpacing.verticalSpace ?? Sizes.gapV12,
            content,
            if (material?.actions != null) ...[
              Sizes.gapV12,
              ...material!.actions!,
            ],
          ],
        ),
      ),
    );
  }
}
