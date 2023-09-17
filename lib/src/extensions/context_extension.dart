import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

extension BuildContextX on BuildContext {
  /// get theme
  ThemeData get theme => Theme.of(this);

  /// get colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// check isDarkTheme enabled
  bool get isDarkTheme =>
      theme.brightness == Brightness.dark ||
      colorScheme.brightness == Brightness.dark;

  /// get textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// display large style
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// display medium style
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// display small style
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// headline large style
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// headline medium style
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// headline small style
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// title large style
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// title medium style
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// title small style
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// label large style
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// label medium style
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// label small style
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// body large style
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// body medium style
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// body small style
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// colorscheme colors
  /// primary colors
  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get primaryContainerColor => colorScheme.primaryContainer;
  Color get onPrimaryContainerColor => colorScheme.onPrimaryContainer;

  /// secondary colors
  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get secondaryContainerColor => colorScheme.secondaryContainer;
  Color get onSecondaryContainerColor => colorScheme.onSecondaryContainer;

  /// tertiary color
  Color get tertiaryColor => colorScheme.tertiary;
  Color get onTertiaryColor => colorScheme.onTertiary;
  Color get tertiaryContainerColor => colorScheme.tertiaryContainer;
  Color get onTertiaryContainerColor => colorScheme.onTertiaryContainer;

  /// surface color
  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;

  /// surface variant color
  Color get surfaceVariantColor => colorScheme.surfaceVariant;
  Color get onSurfaceVariantColor => colorScheme.onSurfaceVariant;

  /// inverse colors
  Color get inverseSurfaceColor => colorScheme.inverseSurface;
  Color get onInverseSurfaceColor => colorScheme.onInverseSurface;

  /// background color
  Color get backgroundColor => colorScheme.background;
  Color get onBackgroundContainerColor => colorScheme.onBackground;

  /// outline color
  Color get outlineColor => colorScheme.outline;
  Color get outlineVariantColor => colorScheme.outlineVariant;

  /// error colors
  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;
  Color get errorContainerColor => colorScheme.errorContainer;
  Color get onErrorContainerColor => colorScheme.onErrorContainer;

  /// get size
  Size get size => MediaQuery.sizeOf(this);

  /// media query
  MediaQueryData get mq => MediaQuery.of(this);

  /// screen width
  double get width => size.width;

  /// screen height
  double get height => size.height;

  /// window padding
  /// The parts of the display that are partially obscured by system UI, typically by the hardware display "notches" or the system status bar.
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  /// viewInsets padding
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// viewPadding
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// safeAreaBottomPadding
  double get safeAreaBottomPadding => padding.bottom;

  /// safeAreaTopPadding
  double get safeAreaTopPadding => padding.top;

  /// software keyboard height
  double get keyboardHeight => viewInsets.bottom;

  /// get platform brightness
  ///
  /// this will return platform brightness from nearest MediaQuery widget if not available then it will return Brightness.light
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  ///percent with
  double pw(double percent) {
    return width * percent;
  }

  ///percent height
  double ph(double percent) {
    return height * percent;
  }

  /// remove keyboard focus
  void removeFocus() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }

  /// check whether keyboard has focus or not
  bool get hasFocus =>
      FocusScope.of(this).hasFocus || FocusScope.of(this).hasPrimaryFocus;

  /// extension to get responsive value according to device type `mobile`,`tablet`,`desktop`
  T responsiveValue<T>(
    /// default is mobile
    T mobile, {
    /// value for tablet
    T? tablet,

    /// value for desktop
    T? desktop,
  }) {
    final size = MediaQuery.sizeOf(this);
    final deviceType = DeviceType.fromSize(size);
    if (deviceType == DeviceType.desktop) {
      if (desktop != null) return desktop;
      if (tablet != null) return tablet;
    }
    if (deviceType == DeviceType.tablet) {
      if (tablet != null) return tablet;
    }
    return mobile;
  }

  /// extension to get value according to theme
  T themedValue<T>(T light, [T? dark]) {
    return isDarkTheme ? (dark ?? light) : light;
  }
}
