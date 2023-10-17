import 'package:flutter/services.dart';

/// {@template no_space_text_formatter}
/// A [TextInputFormatter] that filters out spaces.
/// {@endtemplate}
class NoSpaceTextFormatter extends FilteringTextInputFormatter {
  NoSpaceTextFormatter() : super.allow(RegExp(r'[^\s]+'));
}
