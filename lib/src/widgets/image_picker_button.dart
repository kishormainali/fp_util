import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';

const _minimumSize = Size(120, 48);

/// {@template image_picker_helper}
///
/// base class to pick image from camera , gallery or both
///
/// {@endtemplate}

class ImagePickerButton extends StatelessWidget {
  /// {@macro image_picker_helper}
  const ImagePickerButton._({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.shape,
    this.gradient,
    this.minimumSize = _minimumSize,
  });

  ///
  /// pick image from camera
  ///
  factory ImagePickerButton.camera({
    Key? key,
    required String label,
    Widget? icon,
    ValueChanged<XFile?>? onImagePicked,
    int sizeInMb = -1,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    OutlinedBorder? shape,
    int countLimit = 1,
    VoidCallback? onLimitExceed,
    Gradient? gradient,
    Size? minimumSize,
  }) =>
      ImagePickerButton._(
        key: key,
        label: label,
        icon: icon,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
        gradient: gradient,
        minimumSize: minimumSize ?? _minimumSize,
        onPressed: () => _cameraOnPressed(
          sizeInMb,
          countLimit,
          onLimitExceed,
          onImagePicked,
        ),
      );

  ///
  /// pick image from gallery
  ///
  /// [isMultiple] if true then multiple images can be picked
  ///
  factory ImagePickerButton.gallery({
    Key? key,
    required String label,
    Widget? icon,
    ValueChanged<List<XFile>?>? onImagePicked,
    int sizeInMb = -1,
    int countLimit = 1,
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? textStyle,
    OutlinedBorder? shape,
    bool isMultiple = false,
    VoidCallback? onLimitExceed,
    Gradient? gradient,
    Size? minimumSize,
  }) =>
      ImagePickerButton._(
        key: key,
        label: label,
        icon: icon,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
        gradient: gradient,
        minimumSize: minimumSize ?? _minimumSize,
        onPressed: () => _onGalleryPressed(
          sizeInMb,
          countLimit,
          isMultiple,
          onLimitExceed,
          onImagePicked,
        ),
      );

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
    VoidCallback? onLimitExceed,
    Gradient? gradient,
    Size? minimumSize,
  }) = _ChoosePickerButton;

  /// callback when button is pressed
  /// used on camera and gallery button
  final VoidCallback? onPressed;

  /// label of button
  final String label;

  /// icon of button
  final Widget? icon;

  /// background color of button
  ///
  /// * if [gradient] is not null then [backgroundColor] will be ignored
  final Color? backgroundColor;

  /// foreground color of button
  final Color? foregroundColor;

  /// text style of button
  final TextStyle? textStyle;

  /// shape of button
  final OutlinedBorder? shape;

  /// gradient of button
  ///
  /// * if [gradient] is not null then [backgroundColor] will be ignored
  final Gradient? gradient;

  /// minimum size of button
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    if (gradient != null) {
      return GradientButton(
        label: label,
        icon: icon,
        onPressed: onPressed,
        gradient: gradient!,
        minimumSize: minimumSize,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
      );
    } else {
      return _SolidButton(
        label: label,
        icon: icon,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
        minimumSize: minimumSize,
      );
    }
  }
}

/// pick image from gallery
_onGalleryPressed(
  int sizeInMb,
  int count,
  bool isMultiple,
  VoidCallback? onLimitExceed,
  ValueChanged<List<XFile>?>? onImagePicked,
) async {
  if (count == 0) {
    onLimitExceed?.call();
    return;
  } else {
    if (count == 0) {
      onLimitExceed?.call();
      return;
    } else {
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
      onImagePicked?.call(files);
    }
  }
}

/// pick image from camera
void _cameraOnPressed(
  int sizeInMb,
  int count,
  VoidCallback? onLimitExceed,
  ValueChanged<XFile?>? onImagePicked,
) async {
  if (count == 0) {
    onLimitExceed?.call();
    return;
  } else {
    final image = await ImagePickerHelper.pickImageFromCamera(sizeInMb);
    onImagePicked?.call(image);
  }
}

class _ChoosePickerButton extends ImagePickerButton {
  const _ChoosePickerButton({
    super.key,
    required super.label,
    super.icon,
    this.onImagePicked,
    this.dialogBuilder,
    this.sizeInMb = -1,
    this.countLimit = -1,
    super.backgroundColor,
    super.foregroundColor,
    super.textStyle,
    super.shape,
    this.isMultiple = false,
    this.onLimitExceed,
    super.gradient,
    Size? minimumSize,
  }) : super._(
          onPressed: null,
          minimumSize: minimumSize ?? _minimumSize,
        );

  final ValueChanged<List<XFile>?>? onImagePicked;
  final WidgetBuilder? dialogBuilder;
  final bool? isMultiple;
  final int? sizeInMb;
  final int? countLimit;
  final VoidCallback? onLimitExceed;

  @override
  Widget build(BuildContext context) {
    void onButtonPressed() async {
      if (countLimit == 0) {
        onLimitExceed?.call();
        return;
      } else {
        if (isMultiple != null && isMultiple!) {
          final files = await ImagePickerHelper.selectAndPickImageMultiple(
            context,
            builder: dialogBuilder,
            sizeInMb: sizeInMb ?? -1,
            count: countLimit ?? 1,
          );
          onImagePicked?.call(files);
        } else {
          final file = await ImagePickerHelper.selectAndPickImage(
            context,
            builder: dialogBuilder,
            sizeInMb: sizeInMb ?? -1,
          );
          if (file != null) onImagePicked?.call([file]);
        }
      }
    }

    if (gradient != null) {
      return GradientButton(
        label: label,
        icon: icon,
        onPressed: onButtonPressed,
        gradient: gradient!,
        minimumSize: minimumSize,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
      );
    } else {
      return _SolidButton(
        label: label,
        icon: icon,
        onPressed: onButtonPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: textStyle,
        shape: shape,
        minimumSize: minimumSize,
      );
    }
  }
}

class _SolidButton extends StatelessWidget {
  const _SolidButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.textStyle,
    required this.shape,
    required this.minimumSize,
  });

  /// label of the button
  final String label;

  /// icon of the button
  final Widget? icon;

  /// callback when button is pressed
  final VoidCallback? onPressed;

  /// background color of the button
  final Color? backgroundColor;

  /// foreground color of the button
  final Color? foregroundColor;

  /// text style of the button
  final TextStyle? textStyle;

  /// shape of the button
  final OutlinedBorder? shape;

  /// minimum size of the button
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    final style = FilledButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: shape,
      minimumSize: minimumSize,
      maximumSize: Size(double.infinity, minimumSize.height),
    );
    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
        style: style,
      );
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: style,
        child: Text(label),
      );
    }
  }
}
