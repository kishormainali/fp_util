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
  bool get isImage => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.image,
      );

  /// check whether file is pdf
  bool get isPdf => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.pdf,
      );

  /// check whether file is audio
  bool get isAudio => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.audio,
      );

  /// check weather file is video
  bool get isVideo => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.video,
      );

  /// check weather file is ms doc
  bool get isDocx => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.doc,
      );

  /// check whether file is presentation document
  bool get isPpt => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.ppt,
      );

  /// check whether file is excel sheet
  bool get isXls => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.xls,
      );

  /// check whether file is excel sheet
  bool get isTxt => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.txt,
      );

  /// check whether file is excel sheet
  bool get isXml => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.xml,
      );

  /// check whether file is svg
  bool get isSvg => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.svg,
      );

  /// check whether file is csv
  bool get isCsv => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.csv,
      );

  /// check whether file is archive
  bool get isArchive => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.archive,
      );

  /// check whether file is json
  bool get isJson => RegexMatcher.matchFile(
        mimeType ?? extension,
        RegexFileType.json,
      );

  /// checks whether given file is docx,pdf,xls,ppt or txt
  bool get isFile => isDocx || isPdf || isXls || isPpt || isTxt || isCsv || isXml || isJson || isArchive;

  /// get file size in mb
  double get sizeInMb {
    final sizeInBytes = lengthSync();
    return sizeInBytes / (1024 * 1024);
  }
}
