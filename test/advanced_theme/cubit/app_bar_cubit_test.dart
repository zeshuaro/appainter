import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../brightness.dart';
import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('appBarColorChanged', () {
    final color = getRandomColor();
    final appBarTheme = AppBarTheme(color: color);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar color',
      build: () => cubit,
      act: (cubit) => cubit.appBarColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarShadowColorChanged', () {
    final color = getRandomColor();
    final appBarTheme = AppBarTheme(shadowColor: color);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar shadow color',
      build: () => cubit,
      act: (cubit) => cubit.appBarShadowColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarBrightnessChanged', () {
    for (var test in BrightnessTest.testCases) {
      final appBarTheme = AppBarTheme(brightness: test.brightness);
      final theme = ThemeData(appBarTheme: appBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits app bar ${test.brightness}',
        build: () => cubit,
        act: (cubit) => cubit.appBarBrightnessChanged(test.isDark),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('appBarCenterTitleChanged', () {
    for (var isCenter in [true, false]) {
      final appBarTheme = AppBarTheme(centerTitle: isCenter);
      final theme = ThemeData(appBarTheme: appBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits app bar centerTitle=$isCenter',
        build: () => cubit,
        act: (cubit) => cubit.appBarCenterTitleChanged(isCenter),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('appBarElevationChanged', () {
    final value = Random().nextDouble();
    final appBarTheme = AppBarTheme(elevation: value);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar elevation',
      build: () => cubit,
      act: (cubit) => cubit.appBarElevationChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarTitleSpacingChanged', () {
    final value = Random().nextDouble();
    final appBarTheme = AppBarTheme(titleSpacing: value);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar title spacing',
      build: () => cubit,
      act: (cubit) => cubit.appBarTitleSpacingChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
