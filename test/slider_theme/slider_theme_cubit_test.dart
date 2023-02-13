import 'dart:math';

import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late SliderThemeCubit cubit;
  late SliderThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = SliderThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).sliderTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [SliderThemeState(theme: theme)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit track height',
    build: () => cubit,
    act: (cubit) => cubit.trackHeightChanged(doubleValue.toString()),
    expect: () => [SliderThemeState.withTheme(trackHeight: doubleValue)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit active track color',
    build: () => cubit,
    act: (cubit) => cubit.activeTrackColorChanged(color),
    expect: () => [SliderThemeState.withTheme(activeTrackColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit inactive track color',
    build: () => cubit,
    act: (cubit) => cubit.inactiveTrackColorChanged(color),
    expect: () => [SliderThemeState.withTheme(inactiveTrackColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit disabled active track color',
    build: () => cubit,
    act: (cubit) => cubit.disabledActiveTrackColorChanged(color),
    expect: () => [SliderThemeState.withTheme(disabledActiveTrackColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit disabled inactive track color',
    build: () => cubit,
    act: (cubit) => cubit.disabledInactiveTrackColorChanged(color),
    expect: () => [
      SliderThemeState.withTheme(disabledInactiveTrackColor: color),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit active tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.activeTickMarkColorChanged(color),
    expect: () => [SliderThemeState.withTheme(activeTickMarkColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit inactive tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.inactiveTickMarkColorChanged(color),
    expect: () => [SliderThemeState.withTheme(inactiveTickMarkColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit disabled active tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.disabledActiveTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState.withTheme(disabledActiveTickMarkColor: color),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit disabled inactive tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.disabledInactiveTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState.withTheme(disabledInactiveTickMarkColor: color),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit thumb color',
    build: () => cubit,
    act: (cubit) => cubit.thumbColorChanged(color),
    expect: () => [SliderThemeState.withTheme(thumbColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit disabled thumb color',
    build: () => cubit,
    act: (cubit) => cubit.disabledThumbColorChanged(color),
    expect: () => [SliderThemeState.withTheme(disabledThumbColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit overlapping shape stroke color',
    build: () => cubit,
    act: (cubit) => cubit.overlappingShapeStrokeColorChanged(color),
    expect: () => [
      SliderThemeState.withTheme(overlappingShapeStrokeColor: color),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit overlay color',
    build: () => cubit,
    act: (cubit) => cubit.overlayColorChanged(color),
    expect: () => [SliderThemeState.withTheme(overlayColor: color)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'emit value indicator color',
    build: () => cubit,
    act: (cubit) => cubit.valueIndicatorColorChanged(color),
    expect: () => [SliderThemeState.withTheme(valueIndicatorColor: color)],
  );
}
