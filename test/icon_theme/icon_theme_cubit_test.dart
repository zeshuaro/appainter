import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late IconThemeCubit cubit;
  late IconThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = IconThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<IconThemeCubit, IconThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).iconTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [IconThemeState(theme: theme)],
  );

  blocTest<IconThemeCubit, IconThemeState>(
    'should emit color',
    build: () => cubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [IconThemeState(theme: IconThemeData(color: color))],
  );

  blocTest<IconThemeCubit, IconThemeState>(
    'should emit size',
    build: () => cubit,
    act: (cubit) => cubit.sizeChanged(doubleValue.toString()),
    expect: () => [IconThemeState(theme: IconThemeData(size: doubleValue))],
  );

  blocTest<IconThemeCubit, IconThemeState>(
    'should emit opacity',
    build: () => cubit,
    act: (cubit) => cubit.opacityChanged(doubleValue.toString()),
    expect: () => [IconThemeState(theme: IconThemeData(opacity: doubleValue))],
  );
}
