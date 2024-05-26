import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Color getRandomColor() => Color(Random().nextInt(0xffffffff)).withOpacity(1);

WidgetStateProperty<T?> getMaterialStateProperty<T>(
  Map<WidgetState?, T?> properties,
) {
  return WidgetStateProperty.resolveWith((states) {
    for (var entry in properties.entries) {
      if (states.contains(entry.key)) return entry.value;
    }
    if (properties.containsKey(null)) return properties[null];
    return null;
  });
}

void verifyMaterialProperty(
  WidgetStateProperty propA,
  WidgetStateProperty propB,
) {
  expect(checkMaterialProperty(propA, propB), equals(true));
}

void verifyMaterialPropertyByMap<T>(
  WidgetStateProperty propA,
  Map<WidgetState?, T?> properties,
) {
  final propB = getMaterialStateProperty(properties);
  expect(checkMaterialProperty(propA, propB), equals(true));
}

bool checkMaterialProperty(
  WidgetStateProperty propA,
  WidgetStateProperty propB,
) {
  if (propA.resolve({}) != propB.resolve({})) return false;
  for (var state in WidgetState.values) {
    final states = {state};
    if (propA.resolve(states) != propB.resolve(states)) return false;
  }
  return true;
}
