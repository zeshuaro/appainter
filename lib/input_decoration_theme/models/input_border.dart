import 'package:flutter/material.dart';
import 'package:appainter/models/models.dart';

class MyInputBorder extends EnumModel<InputBorder> {
  static const Map<String, InputBorder> _values = {
    'Underline': UnderlineInputBorder(),
    'Outline': OutlineInputBorder(),
  };

  MyInputBorder() : super(_values);
}
