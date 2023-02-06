import 'dart:math';

import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    expect: () => [
      FloatingActionButtonThemeState.withTheme(backgroundColor: color),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit foreground color',
    build: () => cubit,
    act: (cubit) => cubit.foregroundColorChanged(color),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(foregroundColor: color),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit focus color',
    build: () => cubit,
    act: (cubit) => cubit.focusColorChanged(color),
    expect: () => [FloatingActionButtonThemeState.withTheme(focusColor: color)],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit hover color',
    build: () => cubit,
    act: (cubit) => cubit.hoverColorChanged(color),
    expect: () => [FloatingActionButtonThemeState.withTheme(hoverColor: color)],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit splash color',
    build: () => cubit,
    act: (cubit) => cubit.splashColorChanged(color),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(splashColor: color),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(elevation: doubleValue),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit disabled elevation',
    build: () => cubit,
    act: (cubit) => cubit.disabledElevationChanged(doubleValue.toString()),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(disabledElevation: doubleValue),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit focus elevation',
    build: () => cubit,
    act: (cubit) => cubit.focusElevationChanged(doubleValue.toString()),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(focusElevation: doubleValue),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit highlight elevation',
    build: () => cubit,
    act: (cubit) => cubit.highlightElevationChanged(doubleValue.toString()),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(highlightElevation: doubleValue),
    ],
  );

  blocTest<FloatingActionButtonThemeCubit, FloatingActionButtonThemeState>(
    'should emit hover elevation',
    build: () => cubit,
    act: (cubit) => cubit.hoverElevationChanged(doubleValue.toString()),
    expect: () => [
      FloatingActionButtonThemeState.withTheme(hoverElevation: doubleValue),
    ],
  );
}
