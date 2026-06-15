import 'package:flutter/material.dart';

class ReclaimColors {
  ReclaimColors._();

  static const int _primaryValue = 0xFFC47B88;
  static const int _secondaryValue = 0xFFA3B59C;
  static const int _tertiaryValue = 0xFF9C87D9;
  static const int _errorValue = 0xFFBA1A1A;
  static const int _neutralValue = 0xFF777773;
  static const int _neutralVariantValue = 0xFF8E76A3;
  static const int _yellowValue = 0xFFDDA76B;
  static const int _blueValue = 0xFF76CFC0;

  static const MaterialColor pink = MaterialColor(
    _primaryValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF3F0015),
      20: Color(0xFF5F1128),
      30: Color(0xFF7D293E),
      40: Color(0xFF9B4055),
      50: Color(_primaryValue),
      60: Color(0xFFD87186),
      70: Color(0xFFF88AA0),
      80: Color(0xFFFFB2BE),
      90: Color(0xFFFFD9DE),
      95: Color(0xFFFFECEE),
      98: Color(0xFFFFF8F7),
      99: Color(0xFFFFFBFF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor green = MaterialColor(
    _secondaryValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF002202),
      20: Color(0xFF003906),
      30: Color(0xFF0D5213),
      40: Color(0xFF2A6B29),
      50: Color(_secondaryValue),
      60: Color(0xFF5DA056),
      70: Color(0xFF77BB6E),
      80: Color(0xFF92D787),
      90: Color(0xFFADF4A1),
      95: Color(0xFFC9FFBD),
      98: Color(0xFFECFFE3),
      99: Color(0xFFF6FFEF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor lavender = MaterialColor(
    _tertiaryValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF21005D),
      20: Color(0xFF371E73),
      30: Color(0xFF4E378B),
      40: Color(0xFF6650A4),
      50: Color(_tertiaryValue),
      60: Color(0xFF9983DB),
      70: Color(0xFFB59DF8),
      80: Color(0xFFCEBDFF),
      90: Color(0xFFE8DDFF),
      95: Color(0xFFF5EEFF),
      98: Color(0xFFFDF7FF),
      99: Color(0xFFFFFBFF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor red = MaterialColor(
    _errorValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF410002),
      20: Color(0xFF690005),
      30: Color(0xFF93000A),
      40: Color(0xFFBA1A1A),
      50: Color(0xFFDE3730),
      60: Color(0xFFFF5449),
      70: Color(0xFFFF897D),
      80: Color(0xFFFFB4AB),
      90: Color(0xFFFFDAD6),
      95: Color(0xFFFFEDEA),
      99: Color(0xFFFFFBFF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor neutral = MaterialColor(
    _neutralValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF1B1C19),
      15: Color(0xFF252623),
      20: Color(0xFF30312D),
      30: Color(0xFF474743),
      35: Color(0xFF52534F),
      40: Color(0xFF5E5F5A),
      50: Color(_neutralValue),
      60: Color(0xFF91918C),
      70: Color(0xFFACABA6),
      80: Color(0xFFC8C6C1),
      90: Color(0xFFE4E2DD),
      95: Color(0xFFF3EFE6),
      99: Color(0xFFFEFCF6),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor neutralVariant = MaterialColor(
    _neutralVariantValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF2F2835),
      20: Color(0xFF4D3F58),
      30: Color(0xFF68517B),
      40: Color(0xFF7E6395),
      50: Color(_neutralVariantValue),
      60: Color(0xFFA389B9),
      70: Color(0xFFAF99C2),
      80: Color(0xFFCDBCDC),
      90: Color(0xFFDACDE4),
      95: Color(0xFFE6DDED),
      99: Color(0xFFFAF5FF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor yellow = MaterialColor(
    _yellowValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF241A00),
      20: Color(0xFF3D2E00),
      30: Color(0xFF584400),
      40: Color(0xFF755B00),
      50: Color(_yellowValue),
      60: Color(0xFFB18C0E),
      70: Color(0xFFCEA62E),
      80: Color(0xFFECC248),
      90: Color(0xFFEFD9A6),
      95: Color(0xFFFFEFCF),
      98: Color(0xFFFFF8F1),
      99: Color(0xFFFFFBFF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor blue = MaterialColor(
    _blueValue,
    <int, Color>{
      0: Color(0xFF000000),
      10: Color(0xFF00201D),
      20: Color(0xFF003732),
      30: Color(0xFF005049),
      40: Color(0xFF006A60),
      50: Color(_blueValue),
      60: Color(0xFF8BD7C9),
      70: Color(0xFFA0DFD2),
      80: Color(0xFFBBEAE0),
      90: Color(0xFFD6F5EE),
      95: Color(0xFFEBFAF6),
      98: Color(0xFFF7FDFB),
      99: Color(0xFFFBFFFE),
      100: Color(0xFFFFFFFF),
    },
  );
}
