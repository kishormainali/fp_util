import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<T?> showPlatformDialog<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  bool useRootNavigator = true,
  bool barrierDismissible = true,
  bool useSafeArea = true,
  Color? barrierColor,
  bool useMaterial = false,
}) async {
  if (kIsWeb || useMaterial) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      barrierColor: barrierColor,
    );
  } else {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.iOS:
        return showCupertinoDialog<T>(
          context: context,
          builder: builder,
          useRootNavigator: useRootNavigator,
          barrierDismissible: barrierDismissible,
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.android:
      default:
        return showDialog<T>(
          context: context,
          builder: builder,
          barrierDismissible: barrierDismissible,
          useRootNavigator: useRootNavigator,
          useSafeArea: useSafeArea,
          barrierColor: barrierColor,
        );
    }
  }
}
