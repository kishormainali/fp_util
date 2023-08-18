import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

/// {@template image_picker_helper}
///
/// base class to pick image from camera , gallery or both
///
/// {@endtemplate}

abstract class ImagePickerButton extends StatelessWidget {
  /// {@macro image_picker_helper}
  const ImagePickerButton._({
    super.key,
    required this.label,
    this.icon,
    this.onImagePicked,
    this.dialogBuilder,
    this.sizeInMb = -1,
    this.count = -1,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.shape,
    this.isMultiple = false,
    this.onMultipleImagesPicked,
  });

  ///
  /// pick image from camera
  ///
  const factory ImagePickerButton.camera({
    Key? key,
    required String label,
    Widget? icon,
    ValueChanged<XFile?>? onImagePicked,
    int? sizeInMb,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    OutlinedBorder? shape,
  }) = _CameraPickerButton;

  ///
  /// pick image from gallery
  ///
  /// [isMultiple] if true then multiple images can be picked
  ///
  const factory ImagePickerButton.gallery({
    Key? key,
    required String label,
    Widget? icon,
    ValueChanged<List<XFile>?>? onImagePicked,
    int? sizeInMb,
    int? countLimit,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    OutlinedBorder? shape,
    bool? isMultiple,
  }) = _GalleryPickerButton;

  ///
  /// pick image from gallery or camera
  ///
  /// [isMultiple] if true then multiple images can be picked
  ///
  const factory ImagePickerButton.choose({
    Key? key,
    required String label,
    Widget? icon,
    ValueChanged<List<XFile>?>? onImagePicked,
    WidgetBuilder? dialogBuilder,
    int? sizeInMb,
    int? countLimit,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    OutlinedBorder? shape,
    bool? isMultiple,
  }) = _ChoosePickerButton;

  final bool isMultiple;

  final ValueChanged<XFile?>? onImagePicked;

  final ValueChanged<List<XFile>?>? onMultipleImagesPicked;

  final WidgetBuilder? dialogBuilder;

  final int sizeInMb;

  final int count;

  final String label;

  final Widget? icon;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final TextStyle? textStyle;

  final OutlinedBorder? shape;
}

class _CameraPickerButton extends ImagePickerButton {
  const _CameraPickerButton({
    super.key,
    super.label = 'Camera',
    super.icon,
    super.onImagePicked,
    int? sizeInMb,
    super.backgroundColor,
    super.foregroundColor,
    super.textStyle,
    super.shape,
  }) : super._(
          sizeInMb: sizeInMb ?? -1,
          dialogBuilder: null,
        );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = FilledButton.styleFrom(
      backgroundColor: backgroundColor ?? context.primaryColor,
      foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
      textStyle: textStyle,
      shape: shape,
    );

    void onPressed() async {
      final image = await ImagePickerHelper.pickImageFromCamera(sizeInMb);
      onImagePicked?.call(image);
    }

    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
        style: buttonStyle,
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(label),
      );
    }
  }
}

class _GalleryPickerButton extends ImagePickerButton {
  const _GalleryPickerButton({
    super.key,
    super.label = 'Gallery',
    super.icon,
    ValueChanged<List<XFile>?>? onImagePicked,
    int? sizeInMb,
    int? countLimit,
    super.backgroundColor,
    super.foregroundColor,
    super.textStyle,
    super.shape,
    bool? isMultiple,
  }) : super._(
          onMultipleImagesPicked: onImagePicked,
          sizeInMb: sizeInMb ?? -1,
          count: countLimit ?? 1,
          isMultiple: isMultiple ?? false,
          dialogBuilder: null,
        );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = FilledButton.styleFrom(
      backgroundColor: backgroundColor ?? context.primaryColor,
      foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
      textStyle: textStyle,
      shape: shape,
    );

    void onPressed() async {
      final List<XFile> files = [];
      if (isMultiple) {
        final images = await ImagePickerHelper.pickMultiImage(
          sizeInMb: sizeInMb,
          count: count,
        );
        files.addAll(images?.whereType<XFile>().toList() ?? []);
      } else {
        final image = await ImagePickerHelper.pickImageFromGallery(sizeInMb);
        if (image != null) files.add(image);
      }
      onMultipleImagesPicked?.call(files);
    }

    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
        style: buttonStyle,
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(label),
      );
    }
  }
}

class _ChoosePickerButton extends ImagePickerButton {
  const _ChoosePickerButton({
    Key? key,
    required super.label,
    super.icon,
    ValueChanged<List<XFile>?>? onImagePicked,
    super.dialogBuilder,
    int? sizeInMb,
    int? countLimit,
    super.backgroundColor,
    super.foregroundColor,
    super.textStyle,
    super.shape,
    bool? isMultiple,
  }) : super._(
          onMultipleImagesPicked: onImagePicked,
          sizeInMb: sizeInMb ?? -1,
          count: countLimit ?? 1,
          isMultiple: isMultiple ?? false,
        );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = FilledButton.styleFrom(
      backgroundColor: backgroundColor ?? context.primaryColor,
      foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
      textStyle: textStyle,
      shape: shape,
    );

    void onPressed() async {
      if (isMultiple) {
        final files = await ImagePickerHelper.selectAndPickImageMultiple(
          context,
          builder: dialogBuilder,
          sizeInMb: sizeInMb,
          count: count,
        );
        onMultipleImagesPicked?.call(files);
      } else {
        final file = await ImagePickerHelper.selectAndPickImage(
          context,
          builder: dialogBuilder,
          sizeInMb: sizeInMb,
        );
        if (file != null) onMultipleImagesPicked?.call([file]);
      }
    }

    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
        style: buttonStyle,
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(label),
      );
    }
  }
}
