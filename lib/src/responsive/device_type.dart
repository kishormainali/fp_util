import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';

enum DeviceType {
  /// device type mobile
  mobile(480),

  /// device type desktop
  desktop(950),

  /// device type tablet
  tablet(600);

  const DeviceType(this.size);

  final double size;

  /// get device type according to device width
  static DeviceType fromWidth(double width) {
    return switch (width) {
      >= 950 => DeviceType.desktop,
      >= 600 => DeviceType.tablet,
      _ => DeviceType.mobile,
    };
  }

  /// get device type according to device size
  static DeviceType fromSize(Size deviceSize) {
    var deviceWidth = deviceSize.shortestSide;

    if (kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      deviceWidth = deviceSize.width;
    }
    return switch (deviceWidth) {
      >= 950 => DeviceType.desktop,
      >= 600 => DeviceType.tablet,
      _ => DeviceType.mobile,
    };
  }
}
