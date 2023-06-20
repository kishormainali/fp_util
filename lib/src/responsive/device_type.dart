import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';

enum DeviceType {
  /// device type mobile
  mobile(480),

  /// device type desktop
  desktop(950),

  /// device tuype tablet
  tablet(600);

  const DeviceType(this.size);

  final double size;

  static DeviceType fromSize(Size deviceSize) {
    var deviceWidth = deviceSize.shortestSide;

    if (kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      deviceWidth = deviceSize.width;
    }
    if (deviceWidth > DeviceType.desktop.size) {
      return DeviceType.desktop;
    } else if (deviceWidth > DeviceType.tablet.size) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }
}
