import 'package:flutter/material.dart';
import 'package:fp_util/src/responsive/device_type.dart';

typedef ResponsiveWidgetBuilder = Widget Function(BuildContext context);

/// {@template responsive_builder}
///
/// A [ResponsiveBuilder] is a widget that builds different widgets depending on
/// the device type.
///
/// {@endtemplate}

class ResponsiveBuilder extends StatelessWidget {
  /// {@macro responsive_builder}
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  /// The widget to display when the device is mobile.
  final ResponsiveWidgetBuilder mobile;

  /// The widget to display when the device is tablet.
  final ResponsiveWidgetBuilder? tablet;

  /// The widget to display when the device is desktop.
  final ResponsiveWidgetBuilder? desktop;

  /// The widget to display when the device is tablet.
  /// If [tablet] is null, [mobile] will be used.
  ResponsiveWidgetBuilder get _tablet => tablet ?? mobile;

  /// The widget to display when the device is desktop.
  /// If [desktop] is null, [_tablet] will be used.
  ResponsiveWidgetBuilder get _desktop => desktop ?? _tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return OrientationBuilder(
          builder: (context, orientation) {
            final size = _getSize(constrains, orientation);
            final deviceType = DeviceType.fromSize(size);
            return switch (deviceType) {
              DeviceType.mobile => mobile(context),
              DeviceType.tablet => _tablet(context),
              DeviceType.desktop => _desktop(context),
            };
          },
        );
      },
    );
  }

  /// Returns the size of the widget depending on the orientation.
  Size _getSize(BoxConstraints constrains, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return Size(constrains.maxWidth, constrains.maxHeight);
    } else {
      return Size(constrains.maxHeight, constrains.maxWidth);
    }
  }
}
