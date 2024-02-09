// import 'dart:math';

// import 'package:flutter/material.dart';

// import 'device_type.dart';

// /// default figma size
// const Size _defaultDesignSize = Size(375, 812);

// /// {@template size_utils}
// ///
// /// Size utils for responsiveness
// ///
// /// {@endtemplate}
// class SizeUtils {
//   SizeUtils._();

//   /// initialize [SizeUtils]
//   /// [minTextAdapt] if true, text will adapt to min scale of width and height
//   /// [splitScreenAdapt] if true, height will adapt to max of 700
//   /// [designSize] default design size
//   /// [context] BuildContext to retrieve view
//   void init(
//     BuildContext context, {
//     bool minTextAdapt = true,
//     bool splitScreenAdapt = false,
//     Size designSize = _defaultDesignSize,
//   }) {
//     final view = View.of(context);
//     final mqData = MediaQueryData.fromView(view);
//     Size size = mqData.size;
//     final statusBar = mqData.viewPadding.top;
//     final bottomBar = mqData.viewPadding.bottom;
//     final orientation = mqData.orientation;
//     if (orientation == Orientation.landscape) {
//       size = Size(size.height, size.width);
//     }
//     _width = size.width;
//     _height = size.height - statusBar - bottomBar;
//     _minTextAdapt = minTextAdapt;
//     _splitScreenMode = splitScreenAdapt;
//     _designSize = designSize;
//     _initialized = true;
//   }

//   static SizeUtils? _instance;

//   /// singleton instance of [SizeUtils]
//   static SizeUtils get instance => _instance ??= SizeUtils._();

//   /// size of design
//   late Size _designSize;

//   /// height of screen
//   late double _height;

//   /// width of screen
//   late double _width;

//   /// if true, text will adapt to min scale of width and height
//   late bool _minTextAdapt;

//   /// if true, height will adapt to max of 700
//   late bool _splitScreenMode;

//   /// if true, [SizeUtils] is initialized
//   bool _initialized = false;

//   /// screen width
//   double get width {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _width;
//   }

//   /// screen height except status bar and bottom bar
//   double get height {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _height;
//   }

//   /// scale width
//   double get _scaleWidth => _width / _designSize.width;

//   /// scale height
//   double get _scaleHeight => (_splitScreenMode ? max(_height, 700) : _height) / _designSize.height;

//   double get _scaleText {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _minTextAdapt ? min(_scaleWidth, _scaleHeight) : _scaleWidth;
//   }

//   /// set responsive with
//   double setWidth(double px) {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _scaleWidth * px;
//   }

//   /// set responsive height
//   double setHeight(double px) {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _scaleHeight * px;
//   }

//   double setFontSize(double px) {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     return _scaleText * px;
//   }

//   /// get responsive size
//   /// return min of width and height
//   double getSize(double px) {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     final height = setHeight(px);
//     final width = setWidth(px);
//     return min(width, height);
//   }

//   /// get responsive px according to device type
//   double responsivePx(
//     double mobile, {
//     double? tablet,
//     double? desktop,
//   }) {
//     if (!_initialized) throw Exception('SizeUtils not initialized.');
//     final deviceType = DeviceType.fromSize(Size(_width, _height));
//     return switch (deviceType) {
//       DeviceType.mobile => getSize(mobile),
//       DeviceType.tablet => getSize(tablet ?? mobile),
//       DeviceType.desktop => getSize(desktop ?? tablet ?? mobile),
//     };
//   }
// }

// /// {@template sizer_app}
// /// Wrapper widget for [SizeUtils] to initialize
// /// {@endtemplate}
// class SizerApp extends StatelessWidget {
//   /// {@macro sizer_app}
//   const SizerApp({
//     super.key,
//     this.designSize = _defaultDesignSize,
//     this.minTextAdapt = true,
//     this.splitScreenMode = false,
//     required this.builder,
//   });

//   /// design size for responsiveness
//   final Size designSize;

//   /// if true, text will adapt to min scale of width and height
//   final bool minTextAdapt;

//   /// if true, height will adapt to max of 700
//   final bool splitScreenMode;

//   /// widget builder
//   final WidgetBuilder builder;

//   @override
//   Widget build(BuildContext context) {
//     SizeUtils.instance.init(
//       context,
//       designSize: designSize,
//       minTextAdapt: minTextAdapt,
//       splitScreenAdapt: splitScreenMode,
//     );
//     return builder(context);
//   }
// }
