import 'package:flutter/services.dart';
import 'package:fp_util/fp_util.dart';

/// {@template upper_case_text_formatter}
/// A [TextInputFormatter] that formats text to upper case.
/// {@endtemplate}
class UpperCaseTextFormatter extends TextInputFormatter {
  /// {@macro upper_case_text_formatter}
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

/// {@template lower_case_text_formatter}
/// A [TextInputFormatter] that formats text to lower case.
/// {@endtemplate}
class LowerCaseTextFormatter extends TextInputFormatter {
  /// {@macro lower_case_text_formatter}
  const LowerCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

/// {@template sentence_case_text_formatter}
/// A [TextInputFormatter] that formats text to sentence case.
/// {@endtemplate}
class SentenceCaseTextFormatter extends TextInputFormatter {
  /// {@macro sentence_case_text_formatter}
  const SentenceCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    final offset = text.length;
    text = text.sentenceCase;
    if (text.length < offset) {
      text = '$text ';
    }
    return TextEditingValue(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: offset,
        extentOffset: offset,
      ),
    );
  }
}

/// {@template title_case_text_formatter}
/// A [TextInputFormatter] that formats text to title case.
/// {@endtemplate}
class TitleCaseTextFormatter extends TextInputFormatter {
  /// {@macro title_case_text_formatter}
  const TitleCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    final offset = text.length;
    text = text.titleCase;
    if (text.length < offset) {
      text = '$text ';
    }
    return TextEditingValue(
      text: text,
      selection: newValue.selection.copyWith(
        baseOffset: offset,
        extentOffset: offset,
      ),
    );
  }
}
