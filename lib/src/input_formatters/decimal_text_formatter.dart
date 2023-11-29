import 'package:flutter/services.dart';

/// {@template decimal_text_formatter}
/// A [TextInputFormatter] limits the maximum number of digits after the decimal
/// {@endtemplate}
class DecimalTextFormatter extends FilteringTextInputFormatter {
  DecimalTextFormatter(double decimalRange)
      : super.allow(
          RegExp(r'^\d+\.{0,1}\d{0,' + decimalRange.toString() + r'}'),
        );
}
