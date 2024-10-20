import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';
import 'package:image_picker/image_picker.dart';

import '../dialogs/enums.dart';

/// {@template image_picker_helper}
///
/// Helper Class to pick image and file
///
/// {@endtemplate}
abstract class ImagePickerHelper {
  /// default private constructor
  const ImagePickerHelper._();

  static final ImagePicker _picker = ImagePicker();

  /// choose image source
  static Future<SourceType?> chooseImageSource(
    BuildContext context, {
    WidgetBuilder? builder,
    DefaultPickerData data = const DefaultPickerData(),
  }) async {
    return showAdaptiveDialog<SourceType>(
      context: context,
      barrierDismissible: true,
      builder: builder ?? (context) => DefaultPickerDialog(data: data),
    );
  }

  /// choose Image either from camera or gallery
  ///
  static Future<XFile?> selectAndPickImage(
    BuildContext context, {
    WidgetBuilder? builder,
    int sizeInMb = -1,
  }) async {
    XFile? file;
    final res = await chooseImageSource(
      context,
      builder: builder,
    );
    if (res != null) {
      if (res == SourceType.camera) {
        file = await _picker.pickImage(source: ImageSource.camera);
      } else {
        file = await _picker.pickImage(source: ImageSource.gallery);
      }
    }
    if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
    return file;
  }

  /// choose multiple Image either from camera or gallery
  ///
  static Future<List<XFile>?> selectAndPickImageMultiple(
    BuildContext context, {
    WidgetBuilder? builder,
    int sizeInMb = -1,
    int? count,
  }) async {
    List<XFile>? files;
    final res = await chooseImageSource(
      context,
      builder: builder,
    );
    if (res != null) {
      files = [];
      if (res == SourceType.camera) {
        final image = await _picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          if (sizeInMb > 0) {
            final file = await _checkSize(sizeInMb, image);
            if (file != null) files.add(file);
          } else {
            files.add(image);
          }
        }
      } else {
        final images = await pickMultiImage(
          sizeInMb: sizeInMb,
          count: count,
        );
        files.addAll(images ?? []);
      }
    }
    return files;
  }

  /// pick image from camera
  ///
  static Future<XFile?> pickImageFromCamera([int sizeInMb = -1]) async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
      return file;
    } catch (e, stack) {
      Logger.e('Error', error: e, stackTrace: stack);
      return null;
    }
  }

  /// pick image from gallery
  ///
  static Future<XFile?> pickImageFromGallery([int sizeInMb = -1]) async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
      return file;
    } catch (e, stack) {
      Logger.e('Error', error: e, stackTrace: stack);
      return null;
    }
  }

  /// pick multiple image from gallery
  ///
  static Future<List<XFile>?> pickMultiImage({
    int? count,
    int sizeInMb = -1,
  }) async {
    try {
      final files = await _picker.pickMultiImage(limit: count);
      return await _handleMultipleFile(
        files,
        sizeInMb,
      );
    } catch (e, stack) {
      Logger.e('Error', error: e, stackTrace: stack);
      return null;
    }
  }

  /// Returns an [XFile] of the image or video that was picked.
  ///
  /// The image or video can only come from the gallery.
  static Future<XFile?> pickMedia({
    int sizeInMb = -1,
  }) async {
    try {
      final file = await _picker.pickMedia();
      if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
      return file;
    } catch (error, stack) {
      Logger.e('Error', error: error, stackTrace: stack);
      return null;
    }
  }

  /// Returns a [List<XFile>] with the images and/or videos that were picked.
  ///
  /// The images and videos come from the gallery.
  ///
  static Future<List<XFile>?> pickMultipleMedia({
    int? count,
    int sizeInMb = -1,
  }) async {
    try {
      final files = await _picker.pickMultipleMedia(limit: count);
      return await _handleMultipleFile(files, sizeInMb);
    } catch (error, stack) {
      Logger.e('Error', error: error, stackTrace: stack);
      return null;
    }
  }

  /// pick files from library
  ///
  static Future<List<XFile>?> pickFiles({
    bool image = false,
    bool audio = false,
    bool video = false,
    int count = -1,
    int sizeInMb = -1,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          ...PickerFileType.file.extensions,
          if (image) ...PickerFileType.image.extensions,
          if (audio) ...PickerFileType.audio.extensions,
          if (video) ...PickerFileType.video.extensions,
        ],
      );
      final files = result?.files.map((e) => e.toXFile).toList();
      if (count > 0) {
        return await _handleMultipleFile(files?.take(count).toList(), sizeInMb);
      } else {
        return await _handleMultipleFile(files, sizeInMb);
      }
    } catch (e, stack) {
      Logger.e('Error', error: e, stackTrace: stack);
      return null;
    }
  }

  /// pick single files from library
  ///
  static Future<XFile?> pickFile({
    bool image = false,
    bool audio = false,
    bool video = false,
    int sizeInMb = -1,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: [
          ...PickerFileType.file.extensions,
          if (image) ...PickerFileType.image.extensions,
          if (audio) ...PickerFileType.audio.extensions,
          if (video) ...PickerFileType.video.extensions,
        ],
      );
      final file = result?.files.map((e) => e.toXFile).firstOrNull;
      if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
      return file;
    } catch (e, stack) {
      Logger.e('Error', error: e, stackTrace: stack);
      return null;
    }
  }

  /// check file limitation
  static Future<XFile?> _checkSize(int sizeInMb, XFile file) async {
    if (sizeInMb > 0) {
      final fileBytes = await file.length();
      final fileSize = fileBytes / (1024 * 1024);
      if (fileSize <= sizeInMb) return file;
    }
    return null;
  }

  /// handle multiple files
  static Future<List<XFile>?> _handleMultipleFile(
    List<XFile>? files,
    int sizeInMb,
  ) async {
    if (files == null) return null;
    List<XFile?> updatedFiles = [];
    for (var file in files) {
      if (sizeInMb > 0) updatedFiles.add(await _checkSize(sizeInMb, file));
      updatedFiles.add(file);
    }
    return updatedFiles.whereType<XFile>().toList();
  }
}

/// extension to convert file
extension PlatformFileX on PlatformFile {
  /// convert to XFile
  XFile get toXFile {
    return XFile(
      path!,
      name: name,
      length: size,
      bytes: bytes,
    );
  }
}

extension XFileX on XFile {
  /// convert to dart:io file
  File get toFile => File(path);
}
