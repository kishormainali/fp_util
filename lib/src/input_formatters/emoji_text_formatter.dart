import 'package:flutter/services.dart';

import '../constants/constants.dart';

/// {@template emoji_text_formatter}
/// A [TextInputFormatter] that allows/deny  emoji characters.
/// {@endtemplate}
class EmojiTextFormatter extends TextInputFormatter {
  /// {@macro emoji_text_formatter}
  ///
  /// Creates a formatter that allows emoji characters.
  ///
  /// emoji characters are not replaced.
  const EmojiTextFormatter.allow() : _allow = true;

  /// {@macro emoji_text_formatter}
  ///
  /// Creates a formatter that denies only emoji characters.
  ///
  /// emoji characters are replaced with empty string.
  const EmojiTextFormatter.deny() : _allow = false;

  /// Whether this formatter allows or denies emoji characters.
  final bool _allow;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_allow) {
      return TextEditingValue(
        text: newValue.text,
        selection: newValue.selection,
      );
    }
    var text = newValue.text.replaceAll(emojiRegExp, '');
    var selection = newValue.selection;
    if (oldValue.text == text) {
      selection = oldValue.selection;
    }
    return TextEditingValue(text: text, selection: selection);
  }
}
