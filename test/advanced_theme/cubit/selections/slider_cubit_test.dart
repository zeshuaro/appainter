import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../../mocks.dart';
import '../../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(appBarThemeCubit: MockAppBarThemeCubit());
  });

  group('sliderTrackHeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(sliderTheme: SliderThemeData(trackHeight: height));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider track height changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderTrackHeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderActiveTrackColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(activeTrackColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider active track color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderActiveTrackColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderInactiveTrackColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(inactiveTrackColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider inactive track color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderInactiveTrackColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderDisabledActiveTrackColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(disabledActiveTrackColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider disabled active track color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderDisabledActiveTrackColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderDisabledInactiveTrackColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(disabledInactiveTrackColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider disabled inactive track color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderDisabledInactiveTrackColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderActiveTickMarkColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(activeTickMarkColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider active tick mark color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderActiveTickMarkColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderInactiveTickMarkColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(inactiveTickMarkColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider inactive tick mark color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderInactiveTickMarkColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderDisabledActiveTickMarkColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(disabledActiveTickMarkColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider inactive tick mark color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderDisabledActiveTickMarkColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderDisabledInactiveTickMarkColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(disabledInactiveTickMarkColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider disabled inactive tick mark color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderDisabledInactiveTickMarkColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderThumbColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(sliderTheme: SliderThemeData(thumbColor: color));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider thumb color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderThumbColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderDisabledThumbColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(disabledThumbColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider overlapping shape stroke color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderDisabledThumbColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderOverlappingShapeStrokeColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(overlappingShapeStrokeColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider overlapping shape stroke color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderOverlappingShapeStrokeColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderOverlayColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(sliderTheme: SliderThemeData(overlayColor: color));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider overlay color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderOverlayColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('sliderValueIndicatorColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      sliderTheme: SliderThemeData(valueIndicatorColor: color),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit slider value indicator color changed',
      build: () => cubit,
      act: (cubit) => cubit.sliderValueIndicatorColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
