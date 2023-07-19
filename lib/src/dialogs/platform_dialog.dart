import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class _BaseData {
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
  final Offset? anchorPoint;

  const _BaseData({
    this.barrierDismissible = false,
    this.barrierLabel,
    this.useRootNavigator = true,
    this.routeSettings,
    this.anchorPoint,
  });
}

class MaterialDialogData extends _BaseData {
  MaterialDialogData({
    super.barrierLabel,
    super.routeSettings,
    super.anchorPoint,
    super.barrierDismissible = true,
    super.useRootNavigator = true,
    this.barrierColor = Colors.black54,
    this.traversalEdgeBehavior,
    this.useSafeArea = true,
  });

  /// barrierColor is used only for MaterialDialog
  final Color? barrierColor;

  /// useSafeArea is used only for MaterialDialog
  final bool useSafeArea;

  /// traversalEdgeBehavior is used only for MaterialDialog
  final TraversalEdgeBehavior? traversalEdgeBehavior;
}

class CupertinoDialogData extends _BaseData {
  CupertinoDialogData({
    super.barrierLabel,
    super.useRootNavigator = true,
    super.barrierDismissible = false,
    super.routeSettings,
    super.anchorPoint,
  });
}

/// shows a platform dialog
/// shows a material dialog on android and web
/// shows a cupertino dialog on iOS and macOS
Future<T?> showPlatformDialog<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool useMaterial = false,
  MaterialDialogData? material,
  CupertinoDialogData? cupertino,
}) async {
  if (kIsWeb || useMaterial) {
    return _showMaterial<T>(context, builder, material);
  }
  final platform = Theme.of(context).platform;
  return switch (platform) {
    TargetPlatform.macOS || TargetPlatform.iOS => showCupertinoDialog<T>(
        context: context,
        builder: builder,
        useRootNavigator: cupertino?.useRootNavigator ?? true,
        barrierDismissible: cupertino?.barrierDismissible ?? false,
        routeSettings: cupertino?.routeSettings,
        barrierLabel: cupertino?.barrierLabel,
        anchorPoint: cupertino?.anchorPoint,
      ),
    _ => _showMaterial(context, builder, material)
  };
}

/// shows a material dialog
Future<T?> _showMaterial<T>(
  BuildContext context,
  WidgetBuilder builder,
  MaterialDialogData? material,
) {
  return showDialog<T>(
    context: context,
    builder: builder,
    barrierDismissible: material?.barrierDismissible ?? true,
    useRootNavigator: material?.useRootNavigator ?? true,
    useSafeArea: material?.useSafeArea ?? true,
    barrierColor: material?.barrierColor ?? Colors.black54,
    traversalEdgeBehavior: material?.traversalEdgeBehavior,
    routeSettings: material?.routeSettings,
    anchorPoint: material?.anchorPoint,
    barrierLabel: material?.barrierLabel,
  );
}
