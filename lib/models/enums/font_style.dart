import 'package:flutter/painting.dart';

import 'enum_model.dart';

class MyFontStyle extends EnumModel<FontStyle> {
  static const Map<String, FontStyle> _values = {
    'Normal': FontStyle.normal,
    'Italic': FontStyle.italic,
  };

  MyFontStyle() : super(_values);
}
