import 'package:appainter/models/models.dart';
import 'package:flutter/material.dart';

class OutlinedBorderEnum extends EnumModel<OutlinedBorder> {
  OutlinedBorderEnum() : super(_values);

  static const Map<String, OutlinedBorder> _values = {
    'Beveled rectangle': BeveledRectangleBorder(),
    'Circle': CircleBorder(),
    'Continuous rectangle': ContinuousRectangleBorder(),
    'Rounded rectangle': RoundedRectangleBorder(),
    'Stadium': StadiumBorder(),
  };

  @override
  String? convertToString(OutlinedBorder? value) {
    switch (value.runtimeType) {
      case BeveledRectangleBorder:
        return 'Beveled rectangle';
      case CircleBorder:
        return 'Circle';
      case ContinuousRectangleBorder:
        return 'Continuous rectangle';
      case RoundedRectangleBorder:
        return 'Rounded rectangle';
      case StadiumBorder:
        return 'Stadium';
      default:
        return null;
    }
  }
}
