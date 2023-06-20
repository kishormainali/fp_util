import 'dart:io';

import 'package:fp_util/src/extensions/extensions.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

extension FileExtensionX on File {
  /// get fileName from file
  String get fileName => basename(path);

  /// get extension of file
  String get ext => extension(path);

  /// get mime type of file
  String? get mimeType => lookupMimeType(path);

  /// check weather file is image
  bool get isImage {
    return mimeType?.startsWith('image') ?? ext.isImage;
  }

  /// check whether file is pdf
  bool get isPdf {
    return mimeType?.startsWith('application/pdf') ?? ext.isPdf;
  }

  /// check whether file is audio
  bool get isAudio {
    return mimeType?.startsWith('audio') ?? ext.isAudio;
  }

  /// check weather file is video
  bool get isVideo {
    return mimeType?.startsWith('video') ?? ext.isVideo;
  }

  /// check weather file is ms doc
  bool get isDocx {
    return mimeType?.startsWith('application/msword') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.wordprocessingml.document') ?? ext.isDocx;
  }

  /// check whether file is presentation document
  bool get isPpt {
    return mimeType?.startsWith('application/vnd.ms-powerpoint') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.presentationml.presentation') ?? ext.isPpt;
  }

  /// check whether file is excel sheet
  bool get isXls {
    return mimeType?.startsWith('application/vnd.ms-excel') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') ?? ext.isXls;
  }

  /// check whether file is excel sheet
  bool get isTxt {
    return mimeType?.startsWith('application/rtf') ?? mimeType?.startsWith('text/plain') ?? ext.isTxt;
  }

  /// check whether file is excel sheet
  bool get isXml {
    return mimeType?.startsWith('application/xml') ?? mimeType?.startsWith('text/xml') ?? ext.isXml;
  }

  /// check whether file is svg
  bool get isSvg {
    return mimeType?.startsWith('image/svg+xml') ?? ext.isSvg;
  }

  /// checks whether given file is docx,pdf,xls,ppt or txt
  bool get isFile => isDocx || isPdf || isXls || isPpt || isTxt;

  /// get file size in mb
  double get sizeInMb {
    final sizeInBytes = lengthSync();
    return sizeInBytes / (1024 * 1024);
  }
}
