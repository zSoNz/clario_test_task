import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

abstract class ColorConstants {
  static Color disabled = hexToColor('#151D5133');
  static Color stroke = Colors.transparent;
  static Color strokeFocused = hexToColor('#6F91BC');
  static Color strokeDark = hexToColor('#404658');
  static Color statesError = hexToColor('#FF8080');
  static Color statesSuccess = hexToColor('#27B274').withOpacity(0.7);

  static Color surfacePrimary = hexToColor('#F4F9FF');
  static Color surfacePrimaryLighter = hexToColor('#E0EDFB');

  static Color onSurfacePrimary = hexToColor('#4A4E71');

  static Color surfaceButtonPrimary = hexToColor('#4B65FF');
  static Color surfaceButtonLighter = hexToColor('#70C3FF');

  static Color onSurfaceButtonPrimary = hexToColor('#FFFFFF');

  static LinearGradient surfacePrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [surfacePrimary, surfacePrimaryLighter],
  );

  static LinearGradient onSurfacePrimaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [surfaceButtonLighter, surfaceButtonPrimary],
  );
}
