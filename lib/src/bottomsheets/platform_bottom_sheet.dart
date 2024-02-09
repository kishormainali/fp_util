import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// {@template material_sheet_data}
/// Data to customize the material bottom sheet.
/// {@endtemplate}
class MaterialSheetData {
  /// {@macro material_sheet_data}
  const MaterialSheetData({
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

  /// The background color of the surface of this [BottomSheet].
  final Color? backgroundColor;

  /// The z-coordinate at which to place this [BottomSheet] relative to its parent.
  final double? elevation;

  /// The shape of this [BottomSheet].
  final ShapeBorder? shape;

  /// The type of material behavior of this [BottomSheet].
  final Clip? clipBehavior;

  /// The constraints to use for the bottom sheet.
  final BoxConstraints? constraints;

  /// Whether this bottom sheet is being displayed with the bottom sheet
  final bool isScrollControlled;

  /// Whether this bottom sheet can drag
  final bool enableDrag;

  /// Whether to show a drag handle.
  final bool? showDragHandle;

  /// Whether to use safe area insets to apply padding to the modal.
  final bool useSafeArea;

  /// The animation controller that determines the animation of the sheet.
  final AnimationController? transitionAnimationController;
}

/// {@template cupertino_sheet_data}
/// Data to customize the cupertino bottom sheet.
/// {@endtemplate}
class CupertinoSheetData {
  /// {@macro cupertino_sheet_data}
  const CupertinoSheetData({
    this.semanticsDismissible = false,
    this.filter,
  });

  /// The filter to apply to the sheet's background.
  final ImageFilter? filter;

  /// Whether the modal bottom sheet should be dismissed when tapping the
  final bool semanticsDismissible;
}

/// Shows a bottom sheet on Android and iOS.
/// Shows ModalBottomSheet on Android and CupertinoBottomSheet on Ios.
Future<T?> showPlatformBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool useMaterial = false,
  bool barrierDismissible = true,
  Color? barrierColor,
  bool useRootNavigator = false,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  MaterialSheetData material = const MaterialSheetData(),
  CupertinoSheetData cupertino = const CupertinoSheetData(),
}) async {
  if (kIsWeb || useMaterial) {
    return _showMaterial<T>(
      context,
      builder,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      material: material,
    );
  }
  final platform = Theme.of(context).platform;
  return switch (platform) {
    TargetPlatform.macOS || TargetPlatform.iOS => showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        barrierColor: barrierColor ?? kCupertinoModalBarrierColor,
        filter: cupertino.filter,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        semanticsDismissible: cupertino.semanticsDismissible,
        routeSettings: routeSettings,
        anchorPoint: anchorPoint,
      ),
    _ => _showMaterial(
        context,
        builder,
        barrierColor: barrierColor,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        routeSettings: routeSettings,
        anchorPoint: anchorPoint,
        material: material,
      )
  };
}

/// shows a material bottom sheet
Future<T?> _showMaterial<T>(
  BuildContext context,
  WidgetBuilder builder, {
  required MaterialSheetData material,
  required bool barrierDismissible,
  required Color? barrierColor,
  required bool useRootNavigator,
  required RouteSettings? routeSettings,
  required Offset? anchorPoint,
}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    backgroundColor: material.backgroundColor,
    elevation: material.elevation,
    shape: material.shape,
    clipBehavior: material.clipBehavior ?? Clip.antiAlias,
    constraints: material.constraints,
    barrierColor: barrierColor,
    isScrollControlled: material.isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: barrierDismissible,
    enableDrag: material.enableDrag,
    useSafeArea: material.useSafeArea,
    routeSettings: routeSettings,
    transitionAnimationController: material.transitionAnimationController,
    showDragHandle: material.showDragHandle,
    anchorPoint: anchorPoint,
  );
}
