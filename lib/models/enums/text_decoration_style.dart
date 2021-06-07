import 'package:flutter/painting.dart';

import 'enum_model.dart';

class MyTextDecorationStyle extends EnumModel<TextDecorationStyle> {
  static const Map<String, TextDecorationStyle> _values = {
    'Solid': TextDecorationStyle.solid,
    'Dashed': TextDecorationStyle.dashed,
    'Dotted': TextDecorationStyle.dotted,
    'Wavy': TextDecorationStyle.wavy,
    'Double': TextDecorationStyle.double,
  };

  MyTextDecorationStyle() : super(_values);
}
