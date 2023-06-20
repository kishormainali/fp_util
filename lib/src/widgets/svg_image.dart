import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fp_util/fp_util.dart';

/// {@template shared.SvgImage }
///
/// Image Helper class for loading [ImageType]
///
/// {@endtemplate}
class SvgImage extends StatelessWidget {
  const SvgImage._({
    super.key,
    required this.url,
    this.errorWidget,
    this.width,
    this.height,
    this.placeholderWidget,
    this.fit = BoxFit.cover,
    required this.type,
    this.package,
    this.color,
    this.blendMode = BlendMode.srcIn,
  });

  /// NetworkImage
  factory SvgImage.network({
    Key? key,
    required String url,
    final Widget? errorWidget,
    final Widget? placeholderWidget,
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.cover,
    final Color? color,
    final BlendMode? blendMode,
  }) =>
      SvgImage._(
        key: key,
        url: url,
        type: ImageType.network,
        errorWidget: errorWidget,
        placeholderWidget: placeholderWidget,
        width: width,
        height: height,
        fit: fit,
        package: null,
        color: color,
        blendMode: blendMode,
      );

  /// AssetImage
  factory SvgImage.asset({
    Key? key,
    required String url,
    final String? cacheKey,
    final Widget? errorWidget,
    final Widget? placeholderWidget,
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.cover,
    final String? package,
    final Color? color,
    final BlendMode? blendMode,
  }) =>
      SvgImage._(
        key: key,
        url: url,
        type: ImageType.asset,
        width: width,
        height: height,
        fit: fit,
        package: package,
        color: color,
        blendMode: blendMode,
      );

  /// FileImage
  factory SvgImage.file({
    Key? key,
    required String url,
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.cover,
    final Color? color,
    final BlendMode? blendMode,
  }) =>
      SvgImage._(
        key: key,
        url: url,
        type: ImageType.file,
        width: width,
        height: height,
        fit: fit,
        color: color,
        blendMode: blendMode,
      );

  /// url for loading image
  final String url;

  /// error widget for network image
  final Widget? errorWidget;

  /// placeholder widget for network image
  final Widget? placeholderWidget;

  /// width of image
  final double? width;

  /// height of image
  final double? height;

  /// BoxFit for image
  final BoxFit fit;

  /// type of image
  final ImageType type;

  /// package name for [AssetImage] [FileImage]
  final String? package;

  /// color for image
  final Color? color;

  /// color blend mode
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ImageType.network => _buildNetworkImage(
          url,
          width,
          height,
          fit,
          placeholderWidget,
          errorWidget,
          color,
          blendMode,
        ),
      ImageType.asset => SvgPicture.asset(
          url,
          package: package,
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null && blendMode != null
              ? ColorFilter.mode(
                  color!,
                  blendMode!,
                )
              : null,
        ),
      ImageType.file => SvgPicture.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null && blendMode != null
              ? ColorFilter.mode(
                  color!,
                  blendMode!,
                )
              : null,
        ),
    };
  }

  Widget _buildNetworkImage(
    String url,
    double? width,
    double? height,
    BoxFit fit,
    Widget? placeholderWidget,
    Widget? errorWidget,
    Color? color,
    BlendMode? blendMode,
  ) {
    if (url.isNotBlank && url.isUrl) {
      return SvgPicture.network(
        url,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (_) => placeholderWidget ?? const AppIndicator(),
        colorFilter: color != null && blendMode != null
            ? ColorFilter.mode(
                color,
                blendMode,
              )
            : null,
      );
    } else {
      return Center(child: errorWidget ?? const Icon(Icons.warning));
    }
  }
}
