import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late FloatingActionButtonThemeCubit cubit;
  late FloatingActionButtonThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = FloatingActionButtonThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    final colorScheme = randomColorSchemeLight(shouldPrint: false);
    theme = ThemeData.from(colorScheme: colorScheme).floatingActionButtonTheme;
  });

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit theme',
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [FloatingActionButtonThemeState(theme: theme)],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(backgroundColor: color),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit foreground color',
    build: () => cubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(foregroundColor: color),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit hover color',
    build: () => cubit,
    act: (cubit) => cubit.hoverColorChanged(color),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(hoverColor: color),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit splash color',
    build: () => cubit,
    act: (cubit) => cubit.splashColorChanged(color),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(splashColor: color),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(elevation: doubleValue),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit disabled elevation',
    build: () => cubit,
    act: (cubit) => cubit.disabledElevationChanged(doubleValue.toString()),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(disabledElevation: doubleValue),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit focus elevation',
    build: () => cubit,
    act: (cubit) => cubit.focusElevationChanged(doubleValue.toString()),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(focusElevation: doubleValue),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit highlight elevation',
    build: () => cubit,
    act: (cubit) => cubit.highlightElevationChanged(doubleValue.toString()),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(highlightElevation: doubleValue),
        )
      ];
    },
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit hover elevation',
    build: () => cubit,
    act: (cubit) => cubit.hoverElevationChanged(doubleValue.toString()),
    expect: () {
      return [
        FloatingActionButtonThemeState(
          theme: FloatingActionButtonThemeData(hoverElevation: doubleValue),
        )
      ];
    },
  );
}
