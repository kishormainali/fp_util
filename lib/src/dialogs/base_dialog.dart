import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/src/extensions/extensions.dart';

abstract class BaseDialog<A extends Widget, I extends Widget>
    extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.useMaterial = false,
  });

  final bool useMaterial;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || useMaterial) {
      return buildMaterialWidget(context);
    } else {
      final platform = Theme.of(context).platform;
      switch (platform) {
        case TargetPlatform.macOS:
        case TargetPlatform.iOS:
          return buildCupertinoWidget(context);
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
        case TargetPlatform.android:
        default:
          return buildMaterialWidget(context);
      }
    }
  }

  A buildMaterialWidget(BuildContext context);
  I buildCupertinoWidget(BuildContext context);
}

class BasicAlertDialog extends BaseDialog<AlertDialog, CupertinoAlertDialog> {
  const BasicAlertDialog({
    super.key,
    super.useMaterial,
    this.title,
    required this.content,
    this.actions = const [],
    this.insetPadding = EdgeInsets.zero,
    this.contentPadding = EdgeInsets.zero,
  });

  final Widget? title;
  final Widget content;
  final List<Widget> actions;

  /// only for android
  final EdgeInsets insetPadding;
  final EdgeInsets contentPadding;

  @override
  CupertinoAlertDialog buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }

  @override
  AlertDialog buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
      insetPadding: insetPadding,
      contentPadding: contentPadding,
      shape: RoundedRectangleBorder(borderRadius: 10.circular()),
    );
  }
}
