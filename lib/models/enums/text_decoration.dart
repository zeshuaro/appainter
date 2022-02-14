import 'package:flutter/painting.dart';

import 'enum_model.dart';

class MyTextDecoration extends EnumModel<TextDecoration> {
  static const Map<String, TextDecoration> _values = {
    'None': TextDecoration.none,
    'Underline': TextDecoration.underline,
    'Line through': TextDecoration.lineThrough,
    'Overline': TextDecoration.overline,
  };

  MyTextDecoration() : super(_values);
}
