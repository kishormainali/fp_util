import 'package:flutter/material.dart';
import 'package:fp_util/src/responsive/device_type.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget Function(BuildContext context) mobile;
  final Widget Function(BuildContext context)? tablet;
  final Widget Function(BuildContext context)? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return OrientationBuilder(
          builder: (context, orientation) {
            final size = _getSize(constrains, orientation);
            final deviceType = DeviceType.fromSize(size);
            if (deviceType == DeviceType.desktop) {
              if (desktop != null) return desktop!(context);
              if (tablet != null) return tablet!(context);
            }
            if (deviceType == DeviceType.tablet) {
              if (tablet != null) return tablet!(context);
            }
            return mobile(context);
          },
        );
      },
    );
  }

  Size _getSize(BoxConstraints constrains, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return Size(constrains.maxWidth, constrains.maxHeight);
    } else {
      return Size(constrains.maxHeight, constrains.maxWidth);
    }
  }
}
