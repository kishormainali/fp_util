import 'package:path/path.dart';

extension StringNX on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullNotEmpty => this != null && this!.isNotEmpty;
}

extension StringX on String {
  /// checks whether string is email or not
  bool get isEmail => RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);

  /// getOrDefault
  /// returns default value if blank
  String getOrDefault(String value) => isNotBlank ? this : value;

  /// getOrNull
  /// returns null if null or empty
  String? getOrNull() => isNotNullNotEmpty ? this : null;

  /// fileNameFromUri
  /// get file name
  String get fileNameFromUri {
    try {
      final url = Uri.parse(this);
      return basename(url.toFilePath());
    } catch (_) {
      return basename(this);
    }
  }

  /// check isBlank
  bool get isBlank => trim().isEmpty;

  /// checks isNotBlank
  bool get isNotBlank => !isBlank;

  /// capitalize string
  String get capitalize {
    if (isBlank) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// check given string is valid phone number or not
  bool get isValidPhoneNumber {
    if (isBlank) return false;
    if (length > 16 || length < 9) return false;
    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(this);
  }

  /// check given string is numeric or not
  bool get isNumeric {
    if (isBlank) return false;
    return RegExp(r'^(([1-9]*)|(([0-9]*)\.([0-9]*)))$').hasMatch(this);
  }

  /// remove whitespace from string
  String get removeWhiteSpace {
    if (isBlank) return this;
    return trim().replaceAll(' ', '');
  }

  /// remove all \n from string
  String get removeNextLine {
    if (isBlank) return this;
    return trim().replaceAll('\n', '');
  }

  /// tries to parse as bool
  bool? get toBool {
    if (isBlank) return null;
    return bool.tryParse(this, caseSensitive: false);
  }

  /// tries to parse int
  int? get toInt {
    if (isBlank && !isNumeric) return null;
    return int.tryParse(this);
  }

  /// tries to parse as double
  double? get toDouble {
    if (isBlank && !isNumeric) return null;
    return double.tryParse(this);
  }

  /// checks whether string is url
  bool get isUrl {
    if (isBlank) {
      return false;
    }
    var regex = RegExp(r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return regex.hasMatch(this);
  }

  /// checks whether string is image
  bool get isImage {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _imageTypes.any((type) => type == ext);
  }

  /// checks whether string is video
  bool get isVideo {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _videoTypes.any((type) => type == ext);
  }

  /// checks whether string is audio
  bool get isAudio {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _audioTypes.any((type) => type == ext);
  }

  /// checks whether string is pdf
  bool get isPdf {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return ext == '.pdf';
  }

  /// checks whether string is text
  bool get isTxt {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _txtTypes.any((type) => type == ext);
  }

  /// checks whether string is docx
  bool get isDocx {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _docxTypes.any((type) => type == ext);
  }

  /// checks whether string is xls
  bool get isXls {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _xlsTypes.any((type) => type == ext);
  }

  /// checks whether string is ppt
  bool get isPpt {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return _pptTypes.any((type) => type == ext);
  }

  /// checks whether string is svg
  bool get isSvg {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return ext == '.svg';
  }

  /// checks whether string is cml
  bool get isXml {
    final ext = extension(this);
    if (ext.isBlank) {
      return false;
    }
    return ext == '.xml';
  }

  bool get isFile => isPdf || isDocx || isPpt || isXls || isTxt || isXml;
}

/// image extensions
final _imageTypes = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp', '.tif'];

/// audio extensions
final _audioTypes = ['.mp3', '.weba', '.3gp', '.3g2', '.aac', '.mid', '.midi', '.wav'];

/// video extensions
final _videoTypes = ['.mp4', '.avi', '.3gp', '.mpeg', '.ogv', '.3g2'];

/// doc extensions
final _docxTypes = ['.doc', '.docx'];

/// ppt extensions
final _pptTypes = ['.ppt', '.pptx'];

/// excel extensions
final _xlsTypes = ['.xls', '.xlsx'];

/// text types
final _txtTypes = ['.txt', '.rtf'];
