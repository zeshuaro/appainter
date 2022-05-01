import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UtilService {
  static Map<int, Color> getColorSwatch(Color color) {
    final swatch = <int, Color>{};
    final strengths = <double>[.05];
    final r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return swatch;
  }

  static String enumToString(dynamic value) {
    return value == null ? kNone : EnumToString.convertToString(value);
  }

  static T? stringToEnum<T>(List<T> enumValues, String? value) {
    return value != null ? EnumToString.fromString<T>(enumValues, value) : null;
  }

  static List<String> getEnumStrings(
    List<dynamic> values, {
    bool withNull = false,
  }) {
    final strings = values.map((value) => enumToString(value)).toList();
    if (withNull) {
      strings.insert(0, kNone);
    }

    return strings;
  }

  static Future<void> launchUrl(String url) async {
    final parsedUrl = Uri.parse(url);
    await url_launcher.canLaunchUrl(parsedUrl)
        ? await url_launcher.launchUrl(parsedUrl)
        : throw 'Could not launch $url';
  }
}
