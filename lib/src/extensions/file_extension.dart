import 'dart:io';

import 'package:fp_util/fp_util.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

extension FileExtensionX on File {
  /// get fileName from file
  String get fileName => p.basename(path);

  /// get extension of file
  String get extension => p.extension(path);

  /// get mime type of file
  String? get mimeType => lookupMimeType(path);

  /// check weather file is image
  bool get isImage {
    return mimeType?.startsWith('image') ?? extension.isImage;
  }

  /// check whether file is pdf
  bool get isPdf {
    return mimeType?.startsWith('application/pdf') ?? extension.isPdf;
  }

  /// check whether file is audio
  bool get isAudio {
    return mimeType?.startsWith('audio') ?? extension.isAudio;
  }

  /// check weather file is video
  bool get isVideo {
    return mimeType?.startsWith('video') ?? extension.isVideo;
  }

  /// check weather file is ms doc
  bool get isDocx {
    return mimeType?.startsWith('application/msword') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.wordprocessingml.document') ?? extension.isDocx;
  }

  /// check whether file is presentation document
  bool get isPpt {
    return mimeType?.startsWith('application/vnd.ms-powerpoint') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.presentationml.presentation') ?? extension.isPpt;
  }

  /// check whether file is excel sheet
  bool get isXls {
    return mimeType?.startsWith('application/vnd.ms-excel') ?? mimeType?.startsWith('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') ?? extension.isXls;
  }

  /// check whether file is excel sheet
  bool get isTxt {
    return mimeType?.startsWith('application/rtf') ?? mimeType?.startsWith('text/plain') ?? extension.isTxt;
  }

  /// check whether file is excel sheet
  bool get isXml {
    return mimeType?.startsWith('application/xml') ?? mimeType?.startsWith('text/xml') ?? extension.isXml;
  }

  /// check whether file is svg
  bool get isSvg {
    return mimeType?.startsWith('image/svg+xml') ?? extension.isSvg;
  }

  /// check whether file is csv
  bool get isCsv {
    return mimeType?.startsWith('text/csv') ?? mimeType?.startsWith('text/comma-separated-values') ?? extension.isCsv;
  }

  /// check whether file is archive
  bool get isArchive {
    return mimeType?.startsWith('application/zip') ??
        mimeType?.startsWith('application/x-tar') ??
        mimeType?.startsWith('application/x-gzip') ??
        mimeType?.startsWith('application/x-bzip2') ??
        extension.isArchive;
  }

  /// check whether file is json
  bool get isJson {
    return mimeType?.startsWith('application/json') ?? extension.isJson;
  }

  /// checks whether given file is docx,pdf,xls,ppt or txt
  bool get isFile => isDocx || isPdf || isXls || isPpt || isTxt || isCsv || isXml || isJson || isArchive;

  /// get file size in mb
  double get sizeInMb {
    final sizeInBytes = lengthSync();
    return sizeInBytes / (1024 * 1024);
  }
}
