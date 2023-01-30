import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';
import 'mocks.dart';

void main() {
  late TestIconThemeCubit cubit;
  late IconThemeData theme;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = TestIconThemeCubit();
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  blocTest<TestIconThemeCubit, IconThemeState>(
    'emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).iconTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [IconThemeState(theme: theme)],
  );

  blocTest<TestIconThemeCubit, IconThemeState>(
    'emit color',
    build: () => cubit,
    act: (cubit) => cubit.colorChanged(color),
    expect: () => [IconThemeState.withThemeData(color: color)],
  );

  blocTest<TestIconThemeCubit, IconThemeState>(
    'emit size',
    build: () => cubit,
    act: (cubit) => cubit.sizeChanged(doubleStr),
    expect: () => [IconThemeState.withThemeData(size: doubleNum)],
  );

  blocTest<TestIconThemeCubit, IconThemeState>(
    'emit opacity',
    build: () => cubit,
    act: (cubit) => cubit.opacityChanged(doubleStr),
    expect: () => [IconThemeState.withThemeData(opacity: doubleNum)],
  );
}
