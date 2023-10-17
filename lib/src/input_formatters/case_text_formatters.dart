import 'package:flutter/services.dart';
import 'package:fp_util/fp_util.dart';

/// {@template upper_case_text_formatter}
/// A [TextInputFormatter] that formats text to upper case.
/// {@endtemplate}
class UpperCaseTextFormatter extends TextInputFormatter {
  /// {@macro upper_case_text_formatter}
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.sentenceCase,
      selection: newValue.selection,
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.titleCase,
      selection: newValue.selection,
    );
  }
}

/// {@template capitalize_case_text_formatter}
/// A [TextInputFormatter] that formats text to capitalize case.
/// {@endtemplate}
class CapitalizeCaseTextFormatter extends TextInputFormatter {
  /// {@macro capitalize_case_text_formatter}
  const CapitalizeCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.capitalize,
      selection: newValue.selection,
    );
  }
}
