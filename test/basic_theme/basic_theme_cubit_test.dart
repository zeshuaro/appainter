// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:appainter/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../brightness.dart';
import '../utils.dart';

void main() {
  late BasicThemeCubit cubit;
  late ColorScheme colorScheme;
  late ColorScheme colorSchemeLight;
  late ColorScheme colorSchemeDark;
  late Color color;
  late int seed;

  setUpAll(() {
    colorSchemeLight = const ColorScheme.light();
    colorSchemeDark = const ColorScheme.dark();
  });

  setUp(() {
    cubit = BasicThemeCubit();
    color = getRandomColor();
  });

  group('test theme brightness', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit theme with isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.themeBrightnessChanged(isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: isDark ? colorSchemeDark : colorSchemeLight,
            isDark: isDark,
          ),
        ],
      );
    }
  });

  group('test random theme', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit randomized theme with isDark=$isDark',
        setUp: () {
          seed = Random().nextInt(10);
          colorScheme = randomColorScheme(
            seed: seed,
            isDark: isDark,
            shouldPrint: false,
          );
        },
        seed: () => BasicThemeState(isDark: isDark),
        build: () => cubit,
        act: (cubit) => cubit.themeRandomized(seed),
        expect: () => [
          BasicThemeState(colorScheme: colorScheme, isDark: isDark),
        ],
      );
    }
  });

  group('test default theme', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit default theme with isDark=$isDark',
        seed: () => BasicThemeState(
          colorScheme: isDark ? colorSchemeLight : colorSchemeDark,
          isDark: isDark,
        ),
        build: () => cubit,
        act: (cubit) => cubit.themeReset(),
        expect: () => [
          BasicThemeState(
            colorScheme: isDark ? colorSchemeDark : colorSchemeLight,
            isDark: isDark,
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit primary color',
    setUp: () {
      final swatch = UtilService.getColorSwatch(color);
      final colorDark = swatch[700]!;
      final onColor = _getOnColor(color);
      colorScheme = ColorScheme.light(
        primary: color,
        primaryVariant: colorDark,
        onPrimary: onColor,
        secondary: color,
        secondaryVariant: colorDark,
        onSecondary: onColor,
      );
    },
    build: () => cubit,
    act: (cubit) => cubit.primaryColorChanged(color),
    expect: () => [BasicThemeState(colorScheme: colorScheme)],
  );

  group('test primary color brightness', () {
    for (var testCase in BrightnessTest.testCases) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit on primary isDark=${testCase.isDark}',
        build: () => cubit,
        act: (cubit) => cubit.primaryColorBrightnessChanged(testCase.isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: ColorScheme.light(onPrimary: testCase.color),
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit primary color dark',
    build: () => cubit,
    act: (cubit) => cubit.primaryColorDarkChanged(color),
    expect: () => [
      BasicThemeState(colorScheme: ColorScheme.light(primaryVariant: color)),
    ],
  );

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit secondary color',
    setUp: () {
      final swatch = UtilService.getColorSwatch(color);
      final onColor = _getOnColor(color);
      colorScheme = ColorScheme.light(
        secondary: color,
        secondaryVariant: swatch[700]!,
        onSecondary: onColor,
      );
    },
    build: () => cubit,
    act: (cubit) => cubit.secondaryColorChanged(color),
    expect: () => [BasicThemeState(colorScheme: colorScheme)],
  );

  group('test secondary color brightness', () {
    for (var testCase in BrightnessTest.testCases) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit on secondary isDark=${testCase.isDark}',
        build: () => cubit,
        act: (cubit) => cubit.secondaryColorBrightnessChanged(testCase.isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: ColorScheme.light(onSecondary: testCase.color),
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit secondary color dark',
    build: () => cubit,
    act: (cubit) => cubit.secondaryColorDarkChanged(color),
    expect: () => [
      BasicThemeState(colorScheme: ColorScheme.light(secondaryVariant: color)),
    ],
  );

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit surface color',
    setUp: () {
      final onColor = _getOnColor(color);
      colorScheme = ColorScheme.light(surface: color, onSurface: onColor);
    },
    build: () => cubit,
    act: (cubit) => cubit.surfaceColorChanged(color),
    expect: () => [BasicThemeState(colorScheme: colorScheme)],
  );

  group('test surface color brightness', () {
    for (var testCase in BrightnessTest.testCases) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit on surface isDark=${testCase.isDark}',
        build: () => cubit,
        act: (cubit) => cubit.surfaceColorBrightnessChanged(testCase.isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: ColorScheme.light(onSurface: testCase.color),
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit background color',
    setUp: () {
      final onColor = _getOnColor(color);
      colorScheme = ColorScheme.light(
        background: color,
        onBackground: onColor,
      );
    },
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [BasicThemeState(colorScheme: colorScheme)],
  );

  group('test background color brightness', () {
    for (var testCase in BrightnessTest.testCases) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit on background isDark=${testCase.isDark}',
        build: () => cubit,
        act: (cubit) => cubit.backgroundColorBrightnessChanged(testCase.isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: ColorScheme.light(onBackground: testCase.color),
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, BasicThemeState>(
    'should emit error color',
    setUp: () {
      final onColor = _getOnColor(color);
      colorScheme = ColorScheme.light(error: color, onError: onColor);
    },
    build: () => cubit,
    act: (cubit) => cubit.errorColorChanged(color),
    expect: () => [BasicThemeState(colorScheme: colorScheme)],
  );

  group('test error color brightness', () {
    for (var testCase in BrightnessTest.testCases) {
      blocTest<BasicThemeCubit, BasicThemeState>(
        'should emit on error isDark=${testCase.isDark}',
        build: () => cubit,
        act: (cubit) => cubit.errorColorBrightnessChanged(testCase.isDark),
        expect: () => [
          BasicThemeState(
            colorScheme: ColorScheme.light(onError: testCase.color),
          ),
        ],
      );
    }
  });
}

Color _getOnColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}
