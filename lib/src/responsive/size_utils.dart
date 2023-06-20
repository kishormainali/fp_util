import 'dart:ui';

import 'package:flutter/material.dart';

/// @template
/// Size utils for responsiveness
/// @end-template
class SizeUtils {
  /// @macro size_utils
  SizeUtils._() {
    final view = PlatformDispatcher.instance.views.first;
    _size = view.physicalSize / view.devicePixelRatio;
    final statusBar = MediaQueryData.fromView(view).viewPadding.top;
    final bottomBar = MediaQueryData.fromView(view).viewPadding.bottom;
    _width = _size.width;
    _height = _size.height - statusBar - bottomBar;
    _initialized = true;
  }

  static SizeUtils get instance => SizeUtils._();

  /// default figma size
  Size _designSize = const Size(375, 812);

  /// must call this if your figma design is different
  /// call this function on root of app
  void updateDesignSize(Size figmaSize) {
    _designSize = figmaSize;
  }

  /// size
  late Size _size;

  /// flag for initalized or not
  bool _initialized = false;

  /// height of screen
  late double _height;

  /// width of screen
  late double _width;

  /// responsize width
  double get width {
    if (!_initialized) throw Exception('SizeUtils not initialized.');
    return _width;
  }

  /// responsive height
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
    if (height < width) {
      return height;
    } else {
      return width;
    }
  }
}
