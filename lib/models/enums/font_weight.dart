import 'package:flutter/painting.dart';

import 'enum_model.dart';

class MyFontWeight extends EnumModel<FontWeight> {
  static const Map<String, FontWeight> _values = {
    'Thin': FontWeight.w100,
    'Extra light': FontWeight.w200,
    'Light': FontWeight.w300,
    'Normal': FontWeight.w400,
    'Medium': FontWeight.w500,
    'Semi bold': FontWeight.w600,
    'Bold': FontWeight.w700,
    'Extra bold': FontWeight.w800,
    'Black': FontWeight.w900,
  };

  MyFontWeight() : super(_values);
}
