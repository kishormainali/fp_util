import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

import '../constants/regex_pattern.dart';

extension StringNX on String? {
  /// isNullOrEmpty
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// isNotNullNotEmpty
  bool get isNotNullNotEmpty => this != null && this!.isNotEmpty;
}

extension StringX on String {
  /// checks whether string is email or not
  bool get isEmail => RegExp(RegexPattern.email).hasMatch(this);

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

  /// converts country code to flag
  /// example: 'US'.flag returns 🇺🇸
  String get flag {
    if (isBlank) return '';
    match(match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397);
    return toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), match);
  }

  /// check isBlank
  bool get isBlank => trim().isEmpty;

  /// checks isNotBlank
  bool get isNotBlank => !isBlank;

  /// capitalize string
  String get capitalize => _ReCase(this).capitalize;

  /// camelCase string
  String get camelCase => _ReCase(this).camelCase;

  /// constantCase string
  String get constantCase => _ReCase(this).constantCase;

  /// sentenceCase string
  String get sentenceCase => _ReCase(this).sentenceCase;

  /// snakeCase string
  String get snakeCase => _ReCase(this).snakeCase;

  /// dotCase string
  String get dotCase => _ReCase(this).dotCase;

  /// paramCase string
  String get paramCase => _ReCase(this).paramCase;

  /// pathCase string
  String get pathCase => _ReCase(this).pathCase;

  /// pascalCase string
  String get pascalCase => _ReCase(this).pascalCase;

  /// headerCase string
  String get headerCase => _ReCase(this).headerCase;

  /// titleCase string
  String get titleCase => _ReCase(this).titleCase;

  /// lowercase
  String get lowercase => toLowerCase();

  /// uppercase
  String get uppercase => toUpperCase();

  /// initials
  /// returns the initials of the string
  /// if the string is empty, returns an empty string
  /// if the string has one word, returns the first two characters
  /// if the string has two or more words, returns the first character of the first two words
  String get initials => _ReCase(this).initials;

  /// equalsIgnoreCase
  /// equals two strings ignoring case
  bool equalsIgnoreCase(String match) {
    return toLowerCase() == match.toLowerCase();
  }

  /// compareIgnoreCase
  /// compares two strings ignoring case
  int compareIgnoreCase(String other) {
    return toLowerCase().compareTo(other.toLowerCase());
  }

  /// check given string is valid phone number or not
  bool get isValidPhoneNumber {
    if (length > 16 || length < 9) return false;
    return RegexMatcher.match(this, RegexPattern.phone);
  }

  /// check given string is numeric or not
  bool get isNumeric => RegexMatcher.match(this, RegexPattern.number);

  /// remove whitespace from string
  String get removeWhiteSpace {
    if (isBlank) return this;
    return trim().replaceAll(' ', '');
  }

  /// remove extra space from string
  String get removeExtraSpace {
    if (isBlank) return this;
    return replaceAll(RegExp(r"\s+"), " ");
  }

  /// remove all \n \r \t from string
  String replaceEscaped([String replacement = ' ']) {
    if (isBlank) return this;
    return trim()
        .replaceAll(RegExp(RegexPattern.escapedChar), replacement)
        .trim()
        .removeExtraSpace;
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

  /// tires to parse as DateTime
  /// [inputPattern] is the pattern of the input string
  /// [outputPattern] is the pattern of the output string
  String parseAndFormat([
    String inputPattern = DateFormat.YEAR_NUM_MONTH_DAY,
    String outputPattern = DateFormat.YEAR_NUM_MONTH_DAY,
    Locale? locale,
  ]) {
    return DateFormat(outputPattern, locale?.languageCode).format(
      DateFormat(inputPattern, locale?.languageCode).parseLoose(this),
    );
  }

  /// converts string into DateTime
  /// [pattern] is the pattern of the input string
  /// [locale] is the locale of the input string
  /// [isUtc] is whether the input string is utc or not
  DateTime? parseDateTime({
    String? format,
    Locale? locale,
    bool isUtc = false,
  }) {
    try {
      return DateFormat(format, locale?.languageCode).parse(this, isUtc);
    } catch (_) {
      return null;
    }
  }

  /// checks whether string is url
  bool get isUrl => RegexMatcher.match(this, RegexPattern.url);

  /// checks whether string is uri
  bool get isUri => RegexMatcher.match(this, RegexPattern.uri);

  /// checks whether string is image
  bool get isImage => RegexMatcher.match(this, RegexPattern.image);

  /// checks whether string is video
  bool get isVideo => RegexMatcher.match(this, RegexPattern.video);

  /// checks whether string is audio
  bool get isAudio => RegexMatcher.match(this, RegexPattern.audio);

  /// checks whether string is pdf
  bool get isPdf => RegexMatcher.match(this, RegexPattern.pdf);

  /// checks whether string is text
  bool get isTxt => RegexMatcher.match(this, RegexPattern.txt);

  /// checks whether string is docx
  bool get isDocx => RegexMatcher.match(this, RegexPattern.doc);

  /// checks whether string is xls
  bool get isXls => RegexMatcher.match(this, RegexPattern.xls);

  /// checks whether string is ppt
  bool get isPpt => RegexMatcher.match(this, RegexPattern.ppt);

  /// checks whether string is svg
  bool get isSvg => RegexMatcher.match(this, RegexPattern.svg);

  /// checks whether string is csv
  bool get isCsv => RegexMatcher.match(this, RegexPattern.csv);

  /// checks whether string is xml
  bool get isXml => RegexMatcher.match(this, RegexPattern.xml);

  /// checks whether string is archive
  bool get isArchive => RegexMatcher.match(this, RegexPattern.archive);

  /// checks whether string is json
  bool get isJson => RegexMatcher.match(this, RegexPattern.json);

  /// checks whether string is docx,pdf,xls,ppt, txt.csv,xml,archive or json
  bool get isFile =>
      isPdf ||
      isDocx ||
      isPpt ||
      isXls ||
      isTxt ||
      isXml ||
      isCsv ||
      isArchive ||
      isJson;
}

/// use to convert string into different cases
///
class _ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');

  final symbolSet = {' ', '.', '/', '_', '\\', '-'};

  _ReCase(String text) {
    originalText = text;
    _words = _groupIntoWords(text);
  }
  late String originalText;

  late List<String> _words;

  /// capitalize first letter
  String get capitalize => _upperCaseFirstLetter(originalText);

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getPascalCase(separator: ' ');

  /// Initials
  /// returns the initials of the string
  /// if the string is empty, returns an empty string
  /// if the string has one word, returns the first two characters
  /// if the string has two or more words, returns the first character of the first two words
  String get initials {
    if (_words.isEmpty) return '';
    if (_words.length == 1) {
      return '${_words.first[0].toUpperCase()}${_words.first[1].toUpperCase()}'
          .trim();
    }
    if (_words.length > 2) {
      return _words
          .getRange(0, 2)
          .map((word) => word[0].toUpperCase())
          .join()
          .trim();
    }
    return _words.map((word) => word[0].toUpperCase()).join().trim();
  }

  String _getCamelCase({String separator = ''}) {
    List<String> words = _words.map(_upperCaseFirstLetter).toList();
    if (_words.isNotEmpty) {
      words[0] = words[0].toLowerCase();
    }

    return words.join(separator);
  }

  String _getConstantCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String _getPascalCase({String separator = ''}) {
    List<String> words = _words.map(_upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String _getSentenceCase({String separator = ' '}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();
    if (_words.isNotEmpty) {
      words[0] = _upperCaseFirstLetter(words[0]);
    }
    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }

  List<String> _groupIntoWords(String text) {
    StringBuffer sb = StringBuffer();
    List<String> words = [];
    bool isAllCaps = text.toUpperCase() == text;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      String? nextChar = i + 1 == text.length ? null : text[i + 1];

      if (symbolSet.contains(char)) {
        continue;
      }

      sb.write(char);

      bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }
}
