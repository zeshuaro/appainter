// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/simple_theme/simple_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

class MockBasicThemeService extends Mock implements BasicThemeService {}

void main() {
  late BasicThemeCubit cubit;
  late BasicThemeService service;

  late ColorScheme colorSchemeLight;
  late ColorScheme colorSchemeDark;
  late Color color;
  late int seed;

  setUpAll(() {
    colorSchemeLight = SimpleThemeState.getColorScheme(isDark: false);
    colorSchemeDark = SimpleThemeState.getColorScheme(isDark: true);
  });

  setUp(() {
    service = MockBasicThemeService();
    cubit = BasicThemeCubit(service: service);
    color = getRandomColor();
    seed = Random().nextInt(10);
  });

  group('test theme brightness', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, SimpleThemeState>(
        'should emit theme with isDark=$isDark',
        build: () => cubit,
        act: (cubit) => cubit.themeBrightnessChanged(isDark),
        expect: () => [
          SimpleThemeState(
            colorScheme: isDark ? colorSchemeDark : colorSchemeLight,
            isDark: isDark,
          ),
        ],
      );
    }
  });

  group('test random theme', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, SimpleThemeState>(
        'should emit randomized theme with isDark=$isDark',
        seed: () => SimpleThemeState(isDark: isDark),
        build: () => cubit,
        act: (cubit) => cubit.themeRandomized(seed),
        expect: () => [
          SimpleThemeState(
            colorScheme: randomColorScheme(
              seed: seed,
              isDark: isDark,
              shouldPrint: false,
            ),
            isDark: isDark,
          ),
        ],
      );
    }
  });

  group('test default theme', () {
    for (var isDark in [true, false]) {
      blocTest<BasicThemeCubit, SimpleThemeState>(
        'should emit default theme with isDark=$isDark',
        seed: () => SimpleThemeState(
          colorScheme: isDark ? colorSchemeLight : colorSchemeDark,
          isDark: isDark,
        ),
        build: () => cubit,
        act: (cubit) => cubit.themeReset(),
        expect: () => [
          SimpleThemeState(
            colorScheme: isDark ? colorSchemeDark : colorSchemeLight,
            isDark: isDark,
          ),
        ],
      );
    }
  });

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit seed color',
    build: () => cubit,
    act: (cubit) => cubit.seedColorChanged(color),
    expect: () => [
      SimpleThemeState(
        seedColor: color,
        colorScheme: ColorScheme.fromSeed(seedColor: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit primary color',
    setUp: () {
      when(() => service.getOnKeyColor(color)).thenReturn(color);
      when(() => service.getContainerColor(color)).thenReturn(color);
      when(() => service.getOnContainerColor(color)).thenReturn(color);
    },
    build: () => cubit,
    act: (cubit) => cubit.primaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          primary: color,
          onPrimary: color,
          primaryContainer: color,
          onPrimaryContainer: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on primary color',
    build: () => cubit,
    act: (cubit) => cubit.onPrimaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
          colorScheme: colorSchemeLight.copyWith(onPrimary: color)),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit primary container color',
    setUp: () => when(() => service.getOnContainerColor(color)).thenReturn(
      color,
    ),
    build: () => cubit,
    act: (cubit) => cubit.primaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          primaryContainer: color,
          onPrimaryContainer: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on primary container color',
    build: () => cubit,
    act: (cubit) => cubit.onPrimaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onPrimaryContainer: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit secondary color',
    setUp: () {
      when(() => service.getOnKeyColor(color)).thenReturn(color);
      when(() => service.getContainerColor(color)).thenReturn(color);
      when(() => service.getOnContainerColor(color)).thenReturn(color);
    },
    build: () => cubit,
    act: (cubit) => cubit.secondaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          secondary: color,
          onSecondary: color,
          secondaryContainer: color,
          onSecondaryContainer: color,
        ),
      )
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on secondary color',
    build: () => cubit,
    act: (cubit) => cubit.onSecondaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onSecondary: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit secondary container color',
    setUp: () => when(() => service.getOnContainerColor(color)).thenReturn(
      color,
    ),
    build: () => cubit,
    act: (cubit) => cubit.secondaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          secondaryContainer: color,
          onSecondaryContainer: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on secondary container color',
    build: () => cubit,
    act: (cubit) => cubit.onSecondaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onSecondaryContainer: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit tertiary color',
    setUp: () {
      when(() => service.getOnKeyColor(color)).thenReturn(color);
      when(() => service.getContainerColor(color)).thenReturn(color);
      when(() => service.getOnContainerColor(color)).thenReturn(color);
    },
    build: () => cubit,
    act: (cubit) => cubit.tertiaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          tertiary: color,
          onTertiary: color,
          tertiaryContainer: color,
          onTertiaryContainer: color,
        ),
      )
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on tertiary color',
    build: () => cubit,
    act: (cubit) => cubit.onTertiaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onTertiary: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit tertiary container color',
    setUp: () => when(() => service.getOnContainerColor(color)).thenReturn(
      color,
    ),
    build: () => cubit,
    act: (cubit) => cubit.tertiaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          tertiaryContainer: color,
          onTertiaryContainer: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on tertiary container color',
    build: () => cubit,
    act: (cubit) => cubit.onTertiaryContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onTertiaryContainer: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit error color',
    setUp: () {
      when(() => service.getOnKeyColor(color)).thenReturn(color);
      when(() => service.getContainerColor(color)).thenReturn(color);
      when(() => service.getOnContainerColor(color)).thenReturn(color);
    },
    build: () => cubit,
    act: (cubit) => cubit.errorColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          error: color,
          onError: color,
          errorContainer: color,
          onErrorContainer: color,
        ),
      )
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on error color',
    build: () => cubit,
    act: (cubit) => cubit.onErrorColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onError: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit error container color',
    setUp: () => when(() => service.getOnContainerColor(color)).thenReturn(
      color,
    ),
    build: () => cubit,
    act: (cubit) => cubit.errorContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          errorContainer: color,
          onErrorContainer: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on error container color',
    build: () => cubit,
    act: (cubit) => cubit.onErrorContainerColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onErrorContainer: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit background color',
    setUp: () => when(() => service.getOnNeutralColor(color)).thenReturn(color),
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          background: color,
          onBackground: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on background color',
    build: () => cubit,
    act: (cubit) => cubit.onBackgroundColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onBackground: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit surface color',
    setUp: () => when(() => service.getOnNeutralColor(color)).thenReturn(color),
    build: () => cubit,
    act: (cubit) => cubit.surfaceColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          surface: color,
          onSurface: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on surface color',
    build: () => cubit,
    act: (cubit) => cubit.onSurfaceColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onSurface: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit surface variant color',
    setUp: () => when(() => service.getOnSurfaceVariantColor(color)).thenReturn(
      color,
    ),
    build: () => cubit,
    act: (cubit) => cubit.surfaceVariantColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(
          surfaceVariant: color,
          onSurfaceVariant: color,
        ),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on surface variant color',
    build: () => cubit,
    act: (cubit) => cubit.onSurfaceVariantColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onSurfaceVariant: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit outline color',
    build: () => cubit,
    act: (cubit) => cubit.outlineColorChanged(color),
    expect: () => [
      SimpleThemeState(colorScheme: colorSchemeLight.copyWith(outline: color)),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit shadow color',
    build: () => cubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () => [
      SimpleThemeState(colorScheme: colorSchemeLight.copyWith(shadow: color)),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit inverse surface color',
    build: () => cubit,
    act: (cubit) => cubit.inverseSurfaceColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(inverseSurface: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit on inverse surface color',
    build: () => cubit,
    act: (cubit) => cubit.onInverseSurfaceColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(onInverseSurface: color),
      ),
    ],
  );

  blocTest<BasicThemeCubit, SimpleThemeState>(
    'should emit inverse primary color',
    build: () => cubit,
    act: (cubit) => cubit.inversePrimaryColorChanged(color),
    expect: () => [
      SimpleThemeState(
        colorScheme: colorSchemeLight.copyWith(inversePrimary: color),
      ),
    ],
  );
}
