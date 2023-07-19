import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class PlatformWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {
  const PlatformWidget({
    super.key,
    this.useMaterial = false,
  });

  /// override this to use material widget on ios and macOS
  final bool useMaterial;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || useMaterial) {
      return buildMaterialWidget(context);
    }
    final platform = Theme.of(context).platform;
    return switch (platform) {
      TargetPlatform.macOS ||
      TargetPlatform.iOS =>
        buildCupertinoWidget(context),
      _ => buildMaterialWidget(context),
    };
  }

  /// widget builder for material
  A buildMaterialWidget(BuildContext context);

  /// widget builder for ios and macOS
  I buildCupertinoWidget(BuildContext context);
}
