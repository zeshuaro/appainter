import 'package:flutter/material.dart';

class UtilService {
  static Map<int, Color> getColorSwatch(Color color) {
    final swatch = <int, Color>{};
    final strengths = <double>[.05];
    final r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) strengths.add(0.1 * i);

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });

    return swatch;
  }

  static Color getOnColor({Color? color, bool? isColorDark}) {
    assert(color != null || isColorDark != null);
    final isDark = isColorDark ??
        ThemeData.estimateBrightnessForColor(color!) == Brightness.dark;

    return isDark ? Colors.white : Colors.black;
  }

  static bool isColorDark(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
  }
}
