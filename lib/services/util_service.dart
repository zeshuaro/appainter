import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static bool isColorDark(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
  }

  static String enumToString(dynamic value) {
    return EnumToString.convertToString(value, camelCase: true);
  }

  static List<String> getEnumStrings(List<dynamic> values) {
    return values.map((value) => enumToString(value)).toList();
  }

  static Future<void> launchUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
