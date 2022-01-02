// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:appainter/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../../utils.dart';

void main() {
  final brightnessTests = {true: Colors.black, false: Colors.white};
  late BasicThemeCubit cubit;

  setUp(() => cubit = BasicThemeCubit());

  test('initial state is BasicThemeState', () {
    expect(cubit.state, equals(BasicThemeState()));
  });

  group('randomizedThemeRequested', () {
    const seed = 0;
    final colorScheme = randomColorSchemeLight(seed: seed, shouldPrint: false);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits randomized theme',
      build: () => cubit,
      act: (cubit) => cubit.randomizedThemeRequested(seed),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('defaultThemeRequested', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits default theme',
      build: () => cubit,
      act: (cubit) => cubit.defaultThemeRequested(),
      expect: () => [BasicThemeState()],
    );
  });

  group('primaryColorChanged', () {
    final color = getRandomColor();
    final swatch = UtilService.getColorSwatch(color);
    final colorDark = swatch[700]!;
    final onColor = _getOnColor(color);
    final colorScheme = ColorScheme.light(
      primary: color,
      primaryVariant: colorDark,
      onPrimary: onColor,
      secondary: color,
      secondaryVariant: colorDark,
      onSecondary: onColor,
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits primary color',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('primaryColorBrightnessChanged', () {
    brightnessTests.forEach((isDark, color) {
      final colorScheme = ColorScheme.light(onPrimary: color);

      blocTest<BasicThemeCubit, BasicThemeState>(
        'emits on primary isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.primaryColorBrightnessChanged(isDark),
        expect: () => [BasicThemeState(colorScheme: colorScheme)],
      );
    });
  });

  group('primaryColorDarkChanged', () {
    final color = getRandomColor();
    final colorScheme = ColorScheme.light(primaryVariant: color);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits primary color dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorDarkChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('secondaryColorChanged', () {
    final color = getRandomColor();
    final swatch = UtilService.getColorSwatch(color);
    final onColor = _getOnColor(color);
    final colorScheme = ColorScheme.light(
      secondary: color,
      secondaryVariant: swatch[700]!,
      onSecondary: onColor,
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits secondary color',
      build: () => cubit,
      act: (cubit) => cubit.secondaryColorChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('secondaryColorBrightnessChanged', () {
    brightnessTests.forEach((isDark, color) {
      final colorScheme = ColorScheme.light(onSecondary: color);

      blocTest<BasicThemeCubit, BasicThemeState>(
        'emits on secondary isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.secondaryColorBrightnessChanged(isDark),
        expect: () => [BasicThemeState(colorScheme: colorScheme)],
      );
    });
  });

  group('secondaryColorDarkChanged', () {
    final color = getRandomColor();
    final colorScheme = ColorScheme.light(secondaryVariant: color);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits secondary color dark',
      build: () => cubit,
      act: (cubit) => cubit.secondaryColorDarkChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('surfaceColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = ColorScheme.light(
      surface: color,
      onSurface: onColor,
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits surface color',
      build: () => cubit,
      act: (cubit) => cubit.surfaceColorChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('surfaceColorBrightnessChanged', () {
    brightnessTests.forEach((isDark, color) {
      final colorScheme = ColorScheme.light(onSurface: color);

      blocTest<BasicThemeCubit, BasicThemeState>(
        'emits on surface isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.surfaceColorBrightnessChanged(isDark),
        expect: () => [BasicThemeState(colorScheme: colorScheme)],
      );
    });
  });

  group('backgroundColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = ColorScheme.light(
      background: color,
      onBackground: onColor,
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits background color',
      build: () => cubit,
      act: (cubit) => cubit.backgroundColorChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('backgroundColorBrightnessChanged', () {
    brightnessTests.forEach((isDark, color) {
      final colorScheme = ColorScheme.light(onBackground: color);

      blocTest<BasicThemeCubit, BasicThemeState>(
        'emits on background isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.backgroundColorBrightnessChanged(isDark),
        expect: () => [BasicThemeState(colorScheme: colorScheme)],
      );
    });
  });

  group('errorColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = ColorScheme.light(
      error: color,
      onError: onColor,
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits error color',
      build: () => cubit,
      act: (cubit) => cubit.errorColorChanged(color),
      expect: () => [BasicThemeState(colorScheme: colorScheme)],
    );
  });

  group('errorColorBrightnessChanged', () {
    brightnessTests.forEach((isDark, color) {
      final colorScheme = ColorScheme.light(onError: color);

      blocTest<BasicThemeCubit, BasicThemeState>(
        'emits on error isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.errorColorBrightnessChanged(isDark),
        expect: () => [BasicThemeState(colorScheme: colorScheme)],
      );
    });
  });
}

Color _getOnColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}
