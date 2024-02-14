import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor, [int opacity = 100]) {
    assert(opacity >= 0 && opacity <= 100);
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) {
      buffer.write(_fromOpacity(opacity));
    }
    buffer.write(hexColor.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }

  HexColor(final String hexColor, [int opacity = 100])
      : super(
          _getColorFromHex(hexColor, opacity),
        );
}

extension ColorHex on Color {
  /// Returns the [Color] from a hex string.
  /// The [hex] value can be 6 or 7 characters long.
  /// If the [hex] value is 7 characters long, the first character is
  /// assumed to be the opacity.
  /// The [opacity] value must be between 0 and 100.
  /// If the [opacity] value is not provided, it defaults to 100.
  /// ```dart
  /// Color color = ColorHex.fromHex('#FF0000');
  /// Color color = ColorHex.fromHex('#FF0000', 50);
  /// ```
  static Color fromHex(String hex, [int opacity = 100]) =>
      HexColor(hex, opacity);

  /// Returns the [Color] with the opacity set to [percent].
  /// The [percent] value must be between 0 and 100.
  /// ```dart
  /// Color color = Colors.red.percent(50);
  /// ```
  ///
  Color percent(int percent) {
    assert(percent >= 0 && percent <= 100);
    final buffer = StringBuffer();
    buffer.write(_fromOpacity(percent));
    final hex =
        (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Returns the hex value of the color.
  /// ```dart
  /// String hex = Colors.red.hex;
  /// ```
  String get hex {
    final color =
        (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
    return '#$color';
  }

  /// Returns the hex value of the color with the opacity.
  /// ```dart
  /// String hex = Colors.red.hexWithOpacity;
  /// ```
  String get hexWithOpacity {
    final hex =
        (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
    final opacity =
        (value >> 24).toRadixString(16).padLeft(2, '0').toUpperCase();
    return '#$opacity$hex';
  }
}

/// Returns the hex value of the opacity
String _fromOpacity(int percent) {
  final hexMap = <int, String>{
    100: 'FF',
    99: 'FC',
    98: 'FA',
    97: 'F7',
    96: 'F5',
    95: 'F2',
    94: 'F0',
    93: 'ED',
    92: 'EB',
    91: 'E8',
    90: 'E6',
    89: 'E3',
    88: 'E0',
    87: 'DE',
    86: 'DB',
    85: 'D9',
    84: 'D6',
    83: 'D4',
    82: 'D1',
    81: 'CF',
    80: 'CC',
    79: 'C9',
    78: 'C7',
    77: 'C4',
    76: 'C2',
    75: 'BF',
    74: 'BD',
    73: 'BA',
    72: 'B8',
    71: 'B5',
    70: 'B3',
    69: 'B0',
    68: 'AD',
    67: 'AB',
    66: 'A8',
    65: 'A6',
    64: 'A3',
    63: 'A1',
    62: '9E',
    61: '9C',
    60: '99',
    59: '96',
    58: '94',
    57: '91',
    56: '8F',
    55: '8C',
    54: '8A',
    53: '87',
    52: '85',
    51: '82',
    50: '80',
    49: '7D',
    48: '7A',
    47: '78',
    46: '75',
    45: '73',
    44: '70',
    43: '6E',
    42: '6B',
    41: '69',
    40: '66',
    39: '63',
    38: '61',
    37: '5E',
    36: '5C',
    35: '59',
    34: '57',
    33: '54',
    32: '52',
    31: '4F',
    30: '4D',
    29: '4A',
    28: '47',
    27: '45',
    26: '42',
    25: '40',
    24: '3D',
    23: '3B',
    22: '38',
    21: '36',
    20: '33',
    19: '30',
    18: '2E',
    17: '2B',
    16: '29',
    15: '26',
    14: '24',
    13: '21',
    12: '1F',
    11: '1C',
    10: '1A',
    9: '17',
    8: '14',
    7: '12',
    6: '0F',
    5: '0D',
    4: '0A',
    3: '08',
    2: '05',
    1: '03',
    0: '00',
  };
  return hexMap[percent] ?? 'FF';
}
