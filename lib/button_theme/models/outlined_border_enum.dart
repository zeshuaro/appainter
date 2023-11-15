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
      case const (BeveledRectangleBorder):
        return 'Beveled rectangle';
      case const (CircleBorder):
        return 'Circle';
      case const (ContinuousRectangleBorder):
        return 'Continuous rectangle';
      case const (RoundedRectangleBorder):
        return 'Rounded rectangle';
      case const (StadiumBorder):
        return 'Stadium';
      default:
        return null;
    }
  }
}
