import 'package:flutter/material.dart';

import 'enum_model.dart';

class MyTabBarIndicatorSize extends EnumModel<TabBarIndicatorSize> {
  static const Map<String, TabBarIndicatorSize> _values = {
    'Label': TabBarIndicatorSize.label,
    'Tab': TabBarIndicatorSize.tab,
  };

  MyTabBarIndicatorSize() : super(_values);
}
