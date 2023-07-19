import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fp_util/fp_util.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../dialogs/enums.dart';

/// Helper Class to pick image and file
abstract class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  /// choose image source
  static Future<SourceType?> _chooseImageSource(
    BuildContext context, {
    WidgetBuilder? builder,
    bool useMaterial = false,
  }) async {
    return showPlatformDialog(
      context,
      useMaterial: useMaterial,
      cupertino: CupertinoDialogData(barrierDismissible: true),
      builder: builder ??
          (context) => BasicPlatformDialog(
                useMaterial: useMaterial,
                title: Text(
                  'Choose Image Source',
                  textAlign: TextAlign.center,
                  style: context.bodyLarge,
                ),
                material: MaterialAlertDialogData(
                  actionsAlignment: MainAxisAlignment.center,
                ),
                actions: [
                  PlatformDialogAction(
                    useMaterial: useMaterial,
                    onPressed: () => Navigator.pop(context, SourceType.camera),
                    material: MaterialActionData(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 44),
                        ),
                      ),
                    ),
                    child: const Text('Camera'),
                  ),
                  PlatformDialogAction(
                    useMaterial: useMaterial,
                    onPressed: () => Navigator.pop(context, SourceType.gallery),
                    material: MaterialActionData(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 44),
                        ),
                      ),
                    ),
                    child: const Text('Gallery'),
                  ),
                ],
              ),
    );
  }

  /// choose Image either from camera or gallery
  ///
  static Future<XFile?> selectAndPickImage(
    BuildContext context, {
    WidgetBuilder? builder,
    bool useMaterial = false,
    int sizeInMb = -1,
  }) async {
    XFile? file;
    final res = await _chooseImageSource(
      context,
      builder: builder,
      useMaterial: useMaterial,
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

  /// pick image from camera
  ///
  static Future<XFile?> pickImageFromCamera([int sizeInMb = -1]) async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (sizeInMb > 0 && file != null) return await _checkSize(sizeInMb, file);
      return file;
    } catch (e, stack) {
      logger.e('Error', e, stack);
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
      logger.e('Error', e, stack);
      return null;
    }
  }

  /// pick multiple image from gallery
  ///
  static Future<List<XFile>?> pickMultiImage({
    int count = -1,
    int sizeInMb = -1,
  }) async {
    try {
      final files = await _picker.pickMultiImage();
      if (count > 0) {
        return await _handleMultipleFile(
          files.take(count).toList(),
          sizeInMb,
        );
      }
      return await _handleMultipleFile(
        files,
        sizeInMb,
      );
    } catch (e, stack) {
      logger.e('Error', e, stack);
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
    } catch (error) {
      logger.e('Error', error);
      return null;
    }
  }

  /// Returns a [List<XFile>] with the images and/or videos that were picked.
  ///
  /// The images and videos come from the gallery.
  ///
  static Future<List<XFile>?> pickMultipleMedia({
    int count = -1,
    int sizeInMb = -1,
  }) async {
    try {
      final files = await _picker.pickMultipleMedia();
      if (count > 0) {
        return await _handleMultipleFile(files.take(count).toList(), sizeInMb);
      } else {
        return await _handleMultipleFile(files, sizeInMb);
      }
    } catch (error) {
      logger.e('Error', error);
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
      logger.e('Error', e, stack);
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
      logger.e('Error', e, stack);
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
  /// convert to FileX
  FileX get toFileX {
    return FileX(path: path);
  }

  /// convert to dart:io file
  File get toFile => File(path);
}

class FileX extends Equatable {
  final String path;
  final String name;
  final String ext;

  FileX({
    required this.path,
  })  : name = basename(path),
        ext = extension(path);

  @override
  List<Object?> get props => [path, name, ext];
}
