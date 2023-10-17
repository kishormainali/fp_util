import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// {@template masked_text_formatter}
/// A [TextInputFormatter] that formats text using [MaskTextInputFormatter].
/// {@endtemplate}
class MaskedTextFormatter extends MaskTextInputFormatter {
  MaskedTextFormatter._(
    String mask, {
    Map<String, RegExp>? filter,
    String? initialText,
    MaskAutoCompletionType maskType = MaskAutoCompletionType.lazy,
  }) : super(
          mask: mask,
          filter: filter,
          initialText: initialText,
          type: maskType,
        );

  /// Creates a formatter that formats text using [MaskTextInputFormatter].
  /// if [filter] is null then it uses default filter of [MaskTextInputFormatter].
  factory MaskedTextFormatter.custom({
    required String mask,
    Map<String, RegExp>? filter,
    String? initialText,
    bool lazy = true,
  }) =>
      MaskedTextFormatter._(
        mask,
        filter: filter,
        initialText: initialText,
        maskType:
            lazy ? MaskAutoCompletionType.lazy : MaskAutoCompletionType.eager,
      );

  /// Creates a formatter that formats phone numbers.
  factory MaskedTextFormatter.phone(
          {String mask = '+# (###) ### ####', String? initialText}) =>
      MaskedTextFormatter._(
        mask,
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats central provident fund numbers.
  factory MaskedTextFormatter.cpf({String? initialText}) =>
      MaskedTextFormatter._(
        '###.###.###-##',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats date.
  factory MaskedTextFormatter.date({String? initialText}) =>
      MaskedTextFormatter._(
        '##/##/####',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats time.
  factory MaskedTextFormatter.time({String? initialText}) =>
      MaskedTextFormatter._(
        '##:##',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats date and time.
  factory MaskedTextFormatter.dateTime({String? initialText}) =>
      MaskedTextFormatter._(
        '##/##/#### ##:##',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats credit/debit card numbers.
  factory MaskedTextFormatter.card({String? initialText}) =>
      MaskedTextFormatter._(
        '#### #### #### ####',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats credit/debit card expiry dates.
  factory MaskedTextFormatter.cardExpirationDate({String? initialText}) =>
      MaskedTextFormatter._(
        '##/##',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats credit/debit card cvv number.
  factory MaskedTextFormatter.cardCVV({String? initialText}) =>
      MaskedTextFormatter._(
        '###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats money.
  factory MaskedTextFormatter.money({
    String mask = 'R\$ #.##0,00',
    String? initialText,
  }) =>
      MaskedTextFormatter._(
        mask,
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats australian business number.
  factory MaskedTextFormatter.abn({String? initialText}) =>
      MaskedTextFormatter._(
        '## ### ### ###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats australian company number.
  factory MaskedTextFormatter.acn({String? initialText}) =>
      MaskedTextFormatter._(
        '### ### ###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats social security number.
  factory MaskedTextFormatter.ssn({String? initialText}) =>
      MaskedTextFormatter._(
        '###-##-####',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats social insurance numbers.
  factory MaskedTextFormatter.sin({String? initialText}) =>
      MaskedTextFormatter._(
        '###-###-###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats bank state branch numbers.
  factory MaskedTextFormatter.bsb({String? initialText}) =>
      MaskedTextFormatter._(
        '###-###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats sort codes.
  factory MaskedTextFormatter.sortCode({String? initialText}) =>
      MaskedTextFormatter._(
        '##-##-##',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats swift codes.
  factory MaskedTextFormatter.swiftCode(
          {String mask = '######## ###', String? initialText}) =>
      MaskedTextFormatter._(
        mask,
        filter: {'#': RegExp(r'[A-Z0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats imei numbers.
  factory MaskedTextFormatter.imei({String? initialText}) =>
      MaskedTextFormatter._(
        '##-####-#######-#',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats isbn numbers.
  factory MaskedTextFormatter.isbn({String? initialText}) =>
      MaskedTextFormatter._(
        '###-##-#####-##-#',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats mac addresses.
  factory MaskedTextFormatter.macAddress({String? initialText}) =>
      MaskedTextFormatter._(
        '##:##:##:##:##:##',
        filter: {'#': RegExp(r'[0-9a-fA-F]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats ipv4 addresses.
  factory MaskedTextFormatter.ipv4({String? initialText}) =>
      MaskedTextFormatter._(
        '###.###.###.###',
        filter: {'#': RegExp(r'[0-9]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats ipv6 addresses.
  factory MaskedTextFormatter.ipv6({String? initialText}) =>
      MaskedTextFormatter._(
        '####:####:####:####:####:####:####:####',
        filter: {'#': RegExp(r'[0-9a-fA-F]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats color hex code.
  factory MaskedTextFormatter.colorHex({String? initialText}) =>
      MaskedTextFormatter._(
        '#******',
        filter: {'*': RegExp(r'[0-9a-fA-F]')},
        initialText: initialText,
      );

  /// Creates a formatter that formats hexadecimal numbers.
  factory MaskedTextFormatter.hex({String? initialText}) =>
      MaskedTextFormatter._(
        '########',
        filter: {'#': RegExp(r'[0-9a-fA-F]')},
        initialText: initialText,
      );
}
