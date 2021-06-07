import 'package:flutter/material.dart';

import 'enum_model.dart';

class MyBottomNavBarType extends EnumModel<BottomNavigationBarType> {
  static const Map<String, BottomNavigationBarType> _values = {
    'Fixed': BottomNavigationBarType.fixed,
    'Shifting': BottomNavigationBarType.shifting,
  };

  MyBottomNavBarType() : super(_values);
}
