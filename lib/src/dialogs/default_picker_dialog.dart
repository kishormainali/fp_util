import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'actions.dart';
import 'enums.dart';

class DefaultPickerData extends Equatable {
  final String cameraText;
  final String galleryText;
  final String title;
  final TextStyle titleStyle;
  final bool useTextButton;
  final ButtonStyle? buttonStyle;
  final EdgeInsetsGeometry buttonPadding;
  final EdgeInsetsGeometry actionsPadding;
  final EdgeInsets insetPadding;
  final EdgeInsetsGeometry contentPadding;
  final ShapeBorder? shape;

  const DefaultPickerData({
    this.cameraText = 'Camera',
    this.galleryText = 'Gallery',
    this.title = 'Choose Image Source',
    this.titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    this.useTextButton = false,
    this.buttonStyle,
    this.buttonPadding = EdgeInsets.zero,
    this.actionsPadding =
        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
    this.insetPadding = const EdgeInsets.all(16),
    this.contentPadding = EdgeInsets.zero,
    this.shape,
  });

  @override
  List<Object?> get props => [
        cameraText,
        galleryText,
        title,
        titleStyle,
        useTextButton,
        buttonStyle,
        buttonPadding,
        actionsPadding,
        insetPadding,
        contentPadding,
        shape,
      ];
}

class DefaultPickerDialog extends StatelessWidget {
  const DefaultPickerDialog({
    super.key,
    required this.data,
  });

  final DefaultPickerData data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        data.title,
        style: data.titleStyle,
        textAlign: TextAlign.center,
      ),
      buttonPadding: data.buttonPadding,
      actionsPadding: data.actionsPadding,
      insetPadding: data.insetPadding,
      contentPadding: data.contentPadding,
      shape: data.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      actions: [
        PlatformDialogAction(
          onPressed: () => Navigator.pop(context, SourceType.camera),
          material: MaterialActionData(
            style: ButtonStyle(
              minimumSize: const MaterialStatePropertyAll(
                Size(double.infinity, 44),
              ),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            ),
            useTextButton: data.useTextButton,
          ),
          child: Text(data.cameraText),
        ),
        PlatformDialogAction(
          onPressed: () => Navigator.pop(context, SourceType.gallery),
          material: MaterialActionData(
            style: data.buttonStyle ??
                ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 44),
                  ),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                ),
            useTextButton: data.useTextButton,
          ),
          child: Text(data.galleryText),
        ),
      ],
    );
  }
}
