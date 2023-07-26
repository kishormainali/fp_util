import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// year month day
  String get ymd => DateFormat.yMd().format(this);

  /// hour minute and seconds
  String get jms => DateFormat.jms().format(this);

  /// year month day format
  String yyMMdd({Locale? locale}) =>
      DateFormat('yy/MM/dd', locale?.languageCode).format(this);

  /// EEE, M/d/y format
  String yMEd([Locale? locale]) =>
      DateFormat.yMEd(locale?.languageCode).format(this);

  /// hour minute format
  String jm([Locale? locale]) =>
      DateFormat.jm(locale?.languageCode).format(this);

  /// format with custom pattern
  String format(String pattern, [Locale? locale]) =>
      DateFormat(pattern, locale?.languageCode).format(this);
}
