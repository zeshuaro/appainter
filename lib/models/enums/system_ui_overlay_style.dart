import 'package:flutter/services.dart';
import 'package:flutter_theme/models/enums/enum_model.dart';

class MySystemUiOverlayStyle extends EnumModel<SystemUiOverlayStyle> {
  static const Map<String, SystemUiOverlayStyle> _values = {
    'Light': SystemUiOverlayStyle.light,
    'Dark': SystemUiOverlayStyle.dark,
  };

  MySystemUiOverlayStyle() : super(_values);
}
