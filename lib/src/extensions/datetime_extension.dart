import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
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

  /// add days to current date

  DateTime addDays(int days) => add(Duration(days: days));

  /// add hours to current date
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// add minutes to current date
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));

  /// add seconds to current date
  DateTime addSeconds(int seconds) => add(Duration(seconds: seconds));

  /// subtract days from current date
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// subtract hours from current date
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));

  /// subtract minutes from current date
  DateTime subtractMinutes(int minutes) => subtract(Duration(minutes: minutes));

  /// subtract seconds from current date
  DateTime subtractSeconds(int seconds) => subtract(Duration(seconds: seconds));

  /// parse string to DateTime
  DateTime formatParse(String inputString,
      [String pattern = DateFormat.YEAR_NUM_MONTH_DAY]) {
    return DateFormat(pattern).parseLoose(inputString);
  }

  /// return time stamp string
  String get timeStamp {
    return DateFormat('hh:mm:ss.SSS').format(this);
  }

  /// return time ago string
  String timeAgo([Locale? locale]) {
    final now = DateTime.now();

    var elapsed = (now.millisecondsSinceEpoch - millisecondsSinceEpoch).abs();

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;

    String result;
    if (seconds < 45) {
      result = '${seconds.round()} seconds ago';
    } else if (seconds < 90) {
      result = 'about a minute ago';
    } else if (minutes < 45) {
      result = '${minutes.round()} minutes ago';
    } else if (minutes < 90) {
      result = 'about an hour ago';
    } else if (hours < 24) {
      result = '${hours.round()} hours ago';
    } else if (hours < 48) {
      result = 'a day ago';
    } else if (days < 30) {
      result = '${days.round()} days ago';
    } else if (days < 60) {
      result = 'about a month ago';
    } else if (days < 365) {
      result = '${months.round()} months ago';
    } else {
      result = DateFormat.yMd(locale?.languageCode).format(this);
    }
    return result;
  }

  /// return fiscal year from date
  String fiscalYear(
    int startMonth, {
    int startDay = 1,
    FiscalYearFormat format = FiscalYearFormat.slashShort,
    bool usePrefix = false,
  }) {
    if (month > startMonth || (month == startMonth && day >= startDay)) {
      return format.format(year.toString(), (year + 1).toString(), usePrefix);
    } else {
      return format.format((year - 1).toString(), year.toString(), usePrefix);
    }
  }

  /// return current fiscal year
  static String currentFiscalYear(
    int startMonth, {
    int startDay = 1,
    FiscalYearFormat format = FiscalYearFormat.slashShort,
    bool usePrefix = false,
  }) {
    final date = DateTime.now();
    if (date.month > startMonth ||
        (date.month == startMonth && date.day >= startDay)) {
      return format.format(
          date.year.toString(), (date.year + 1).toString(), usePrefix);
    } else {
      return format.format(
          (date.year - 1).toString(), date.year.toString(), usePrefix);
    }
  }
}

enum FiscalYearFormat {
  /// 2020-2021
  hyphen,

  /// 2020/2021
  slash,

  /// 2020-21
  hyphenShort,

  /// 2020/21
  slashShort,

  /// 20
  singleShort,

  /// 2020
  single;

  /// format fiscal year
  String format(String startYear, String endYear, [bool usePrefix = false]) {
    String text = switch (this) {
      FiscalYearFormat.hyphen => '$startYear-$endYear',
      FiscalYearFormat.slash => '$startYear/$endYear',
      FiscalYearFormat.hyphenShort =>
        '${startYear.substring(2, startYear.length)}-${endYear.substring(2, endYear.length)}',
      FiscalYearFormat.slashShort =>
        '${startYear.substring(2, startYear.length)}/${endYear.substring(2, endYear.length)}',
      FiscalYearFormat.singleShort => startYear.substring(2, startYear.length),
      FiscalYearFormat.single => startYear,
    };
    if (usePrefix) {
      text = 'FY $text';
    }
    return text;
  }
}
