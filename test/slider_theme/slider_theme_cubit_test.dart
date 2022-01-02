import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
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
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).sliderTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [SliderThemeState(theme: theme)],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit track height',
    build: () => cubit,
    act: (cubit) => cubit.trackHeightChanged(doubleValue.toString()),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(trackHeight: doubleValue)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit active track color',
    build: () => cubit,
    act: (cubit) => cubit.activeTrackColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(activeTrackColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit inactive track color',
    build: () => cubit,
    act: (cubit) => cubit.inactiveTrackColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(inactiveTrackColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit disabled active track color',
    build: () => cubit,
    act: (cubit) => cubit.disabledActiveTrackColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(disabledActiveTrackColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit disabled inactive track color',
    build: () => cubit,
    act: (cubit) => cubit.disabledInactiveTrackColorChanged(color),
    expect: () => [
      SliderThemeState(
        theme: SliderThemeData(disabledInactiveTrackColor: color),
      ),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit active tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.activeTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(activeTickMarkColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit inactive tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.inactiveTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(inactiveTickMarkColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit disabled active tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.disabledActiveTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState(
        theme: SliderThemeData(disabledActiveTickMarkColor: color),
      ),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit disabled inactive tick mark color',
    build: () => cubit,
    act: (cubit) => cubit.disabledInactiveTickMarkColorChanged(color),
    expect: () => [
      SliderThemeState(
        theme: SliderThemeData(disabledInactiveTickMarkColor: color),
      ),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit thumb color',
    build: () => cubit,
    act: (cubit) => cubit.thumbColorChanged(color),
    expect: () => [SliderThemeState(theme: SliderThemeData(thumbColor: color))],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit disabled thumb color',
    build: () => cubit,
    act: (cubit) => cubit.disabledThumbColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(disabledThumbColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit overlapping shape stroke color',
    build: () => cubit,
    act: (cubit) => cubit.overlappingShapeStrokeColorChanged(color),
    expect: () => [
      SliderThemeState(
        theme: SliderThemeData(overlappingShapeStrokeColor: color),
      ),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit overlay color',
    build: () => cubit,
    act: (cubit) => cubit.overlayColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(overlayColor: color)),
    ],
  );

  blocTest<SliderThemeCubit, SliderThemeState>(
    'should emit value indicator color',
    build: () => cubit,
    act: (cubit) => cubit.valueIndicatorColorChanged(color),
    expect: () => [
      SliderThemeState(theme: SliderThemeData(valueIndicatorColor: color)),
    ],
  );
}
