import 'package:appainter/models/models.dart';
import 'package:flutter/material.dart';

class InputBorderEnum extends EnumModel<InputBorder> {
  InputBorderEnum() : super(_values);

  static const Map<String, InputBorder> _values = {
    'Underline': UnderlineInputBorder(),
    'Outline': OutlineInputBorder(),
  };

  @override
  String? convertToString(InputBorder? value) {
    return value != null
        ? value.isOutline == true
            ? 'Outline'
            : 'Underline'
        : null;
  }
}
