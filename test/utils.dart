import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
