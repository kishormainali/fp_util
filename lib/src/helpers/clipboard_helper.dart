import 'package:flutter/services.dart';

/// {@template clipboard_helper}
/// A helper class for working with the clipboard.
/// {@endtemplate}
abstract class ClipboardHelper {
  const ClipboardHelper._();

  /// Copies the given [text] to the clipboard.
  /// currently only supports plain text.
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Returns the current clipboard content.
  /// currently only supports plain text.
  static Future<String?> pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }
}
