import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template fp_util.CustomImage }
///
/// Image Helper class for loading [ImageType]
///
/// {@endtemplate}
class CustomImage extends StatelessWidget {
  const CustomImage._({
    super.key,
    required this.url,
    this.cacheKey,
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
  factory CustomImage.network({
    Key? key,
    required String url,
    final String? cacheKey,
    final Widget? errorWidget,
    final Widget? placeholderWidget,
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.cover,
    final Color? color,
    final BlendMode? blendMode,
  }) =>
      CustomImage._(
        key: key,
        url: url,
        type: ImageType.network,
        cacheKey: cacheKey,
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
  factory CustomImage.asset({
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
      CustomImage._(
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
  factory CustomImage.file({
    Key? key,
    required String url,
    final double? width,
    final double? height,
    final BoxFit fit = BoxFit.cover,
    final Color? color,
    final BlendMode? blendMode,
  }) =>
      CustomImage._(
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

  /// cache key for network image
  /// only applicable for network image
  final String? cacheKey;

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

  /// package name for [AssetImage]
  final String? package;

  /// color for image
  final Color? color;

  /// color blend mode
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ImageType.network => _buildNetworkImage(),
      ImageType.asset => Image.asset(
          url,
          package: package,
          width: width,
          height: height,
          fit: fit,
          color: color,
          colorBlendMode: blendMode,
        ),
      ImageType.file => Image.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          color: color,
          colorBlendMode: blendMode,
        ),
    };
  }

  Widget _buildNetworkImage() {
    if (url.isNotBlank && url.isUrl) {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        cacheKey: cacheKey,
        placeholder: (_, __) => placeholderWidget ?? const AppIndicator(),
        errorWidget: (_, __, ___) =>
            Center(child: errorWidget ?? const Icon(Icons.warning)),
        color: color,
        colorBlendMode: blendMode,
      );
    } else {
      return Center(child: errorWidget ?? const Icon(Icons.warning));
    }
  }
}

enum ImageType { network, asset, file }
