import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class _BaseData {
  final Color? barrierColor;
  final Offset? anchorPoint;
  final RouteSettings? routeSettings;
  final bool useRootNavigator;
  final bool barrierDismissible;
  _BaseData({
    this.barrierColor,
    this.anchorPoint,
    this.routeSettings,
    this.useRootNavigator = false,
    this.barrierDismissible = true,
  });
}

class MaterialSheetData extends _BaseData {
  MaterialSheetData({
    super.barrierDismissible,
    super.anchorPoint,
    super.barrierColor,
    super.routeSettings,
    super.useRootNavigator = false,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.showDragHandle,
    this.transitionAnimationController,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.useSafeArea = false,
  });
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final bool isScrollControlled;
  final bool enableDrag;
  final bool? showDragHandle;
  final bool useSafeArea;

  final AnimationController? transitionAnimationController;
}

class CupertinoSheetData extends _BaseData {
  final ImageFilter? filter;
  final bool semanticsDismissible;

  CupertinoSheetData({
    super.barrierColor = kCupertinoModalBarrierColor,
    super.barrierDismissible = true,
    super.routeSettings,
    super.useRootNavigator = true,
    super.anchorPoint,
    this.semanticsDismissible = false,
    this.filter,
  });
}

/// Shows a bottom sheet on Android and iOS.
/// Shows ModalBottomSheet on Android and CupertinoBottomSheet on Ios.
Future<T?> showPlatformBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool useMaterial = false,
  MaterialSheetData? material,
  CupertinoSheetData? cupertino,
}) async {
  if (kIsWeb || useMaterial) {
    return _showMaterial<T>(context, builder, material);
  }
  final platform = Theme.of(context).platform;
  return switch (platform) {
    TargetPlatform.macOS || TargetPlatform.iOS => showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        barrierColor: cupertino?.barrierColor ?? kCupertinoModalBarrierColor,
        filter: cupertino?.filter,
        useRootNavigator: cupertino?.useRootNavigator ?? true,
        barrierDismissible: cupertino?.barrierDismissible ?? true,
        semanticsDismissible: cupertino?.semanticsDismissible ?? false,
        routeSettings: cupertino?.routeSettings,
        anchorPoint: cupertino?.anchorPoint,
      ),
    _ => _showMaterial(context, builder, material)
  };
}

/// shows a material bottom sheet
Future<T?> _showMaterial<T>(
  BuildContext context,
  WidgetBuilder builder,
  MaterialSheetData? material,
) {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    backgroundColor: material?.backgroundColor,
    elevation: material?.elevation,
    shape: material?.shape,
    clipBehavior: material?.clipBehavior ?? Clip.antiAlias,
    constraints: material?.constraints,
    barrierColor: material?.barrierColor,
    isScrollControlled: material?.isScrollControlled ?? false,
    useRootNavigator: material?.useRootNavigator ?? false,
    isDismissible: material?.barrierDismissible ?? true,
    enableDrag: material?.enableDrag ?? true,
    useSafeArea: material?.useSafeArea ?? false,
    routeSettings: material?.routeSettings,
    transitionAnimationController: material?.transitionAnimationController,
    showDragHandle: material?.showDragHandle,
    anchorPoint: material?.anchorPoint,
  );
}
