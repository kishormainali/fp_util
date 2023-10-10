import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template size_utils}
///
/// Size utils for responsiveness
///
/// {@endtemplate}
class SizeUtils {
  SizeUtils._() {
    final view = PlatformDispatcher.instance.views.first;
    _size = view.physicalSize / view.devicePixelRatio;
    final statusBar = MediaQueryData.fromView(view).viewPadding.top;
    final bottomBar = MediaQueryData.fromView(view).viewPadding.bottom;
    _width = _size.width;
    _height = _size.height - statusBar - bottomBar;
    _initialized = true;
  }

  static SizeUtils? _instance;

  /// singleton instance of [SizeUtils]
  static SizeUtils get instance => _instance ??= SizeUtils._();

  /// default figma size
  Size _designSize = const Size(375, 812);

  /// must call this if your figma design is different
  /// call this function on root of app
  void updateDesignSize(Size figmaSize) {
    _designSize = figmaSize;
  }

  /// size
  late Size _size;

  /// flag for initialized or not
  bool _initialized = false;

  /// height of screen
  late double _height;

  /// width of screen
  late double _width;

  /// screen width
  double get width {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    return _width;
  }

  /// screen height except status bar and bottom bar
  double get height {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    return _height;
  }

  /// set responsive with
  double setWidth(double px) {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    return (px * _width) / _designSize.width;
  }

  /// set responsive height
  double setHeight(double px) {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    return (px * _height) / (_designSize.height - 44);
  }

  /// get responsive size
  double getSize(double px) {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    final height = setHeight(px);
    final width = setWidth(px);
    return min(width, height);
  }

  /// get responsive px according to device type
  double responsivePx(
    double mobile, {
    double? tablet,
    double? desktop,
  }) {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    final deviceType = DeviceType.fromSize(_size);
    return switch (deviceType) {
      DeviceType.mobile => getSize(mobile),
      DeviceType.tablet => getSize(tablet ?? mobile),
      DeviceType.desktop => getSize(desktop ?? tablet ?? mobile),
    };
  }
}
