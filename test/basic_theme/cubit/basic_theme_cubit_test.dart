// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../../utils.dart';

void main() {
  late BasicThemeCubit cubit;

  setUp(() => cubit = BasicThemeCubit());

  test('initial state is BasicThemeState', () {
    expect(BasicThemeCubit().state, equals(BasicThemeState()));
  });

  group('randomizedThemeRequested', () {
    final seed = 0;
    final colorScheme = randomColorSchemeLight(seed: seed, shouldPrint: false);
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits randomized theme',
      build: () => cubit,
      act: (cubit) => cubit.randomizedThemeRequested(seed),
      expect: () => [state],
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
    final colorDark = swatch[700];
    final onColor = _getOnColor(color);
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          primary: color,
          primaryVariant: colorDark,
          onPrimary: onColor,
          secondary: color,
          secondaryVariant: colorDark,
          onSecondary: onColor,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits primary color',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorChanged(color),
      expect: () => [state],
    );
  });

  group('primaryColorBrightnessChanged', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on primary color black',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(true),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onPrimary: Colors.black,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on primary color white',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(false),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onPrimary: Colors.white,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );
  });

  group('primaryColorDarkChanged', () {
    final color = getRandomColor();
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          primaryVariant: color,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits primary color dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorDarkChanged(color),
      expect: () => [state],
    );
  });

  group('accentColorChanged', () {
    final color = getRandomColor();
    final swatch = UtilService.getColorSwatch(color);
    final onColor = _getOnColor(color);
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          secondary: color,
          secondaryVariant: swatch[700],
          onSecondary: onColor,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits accent color',
      build: () => cubit,
      act: (cubit) => cubit.accentColorChanged(color),
      expect: () => [state],
    );
  });

  group('accentColorBrightnessChanged', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on accent color black',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(true),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onSecondary: Colors.black,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on accent color white',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(false),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onSecondary: Colors.white,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );
  });

  group('accentColorDarkChanged', () {
    final color = getRandomColor();
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          secondaryVariant: color,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits accent color dark',
      build: () => cubit,
      act: (cubit) => cubit.accentColorDarkChanged(color),
      expect: () => [state],
    );
  });

  group('surfaceColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          surface: color,
          onSurface: onColor,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits surface color',
      build: () => cubit,
      act: (cubit) => cubit.surfaceColorChanged(color),
      expect: () => [state],
    );
  });

  group('surfaceColorBrightnessChanged', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on surface color black',
      build: () => cubit,
      act: (cubit) => cubit.surfaceColorBrightnessChanged(true),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onSurface: Colors.black,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on surface color white',
      build: () => cubit,
      act: (cubit) => cubit.surfaceColorBrightnessChanged(false),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onSurface: Colors.white,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );
  });

  group('bgColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          background: color,
          onBackground: onColor,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits background color',
      build: () => cubit,
      act: (cubit) => cubit.bgColorChanged(color),
      expect: () => [state],
    );
  });

  group('bgColorBrightnessChanged', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on background color black',
      build: () => cubit,
      act: (cubit) => cubit.bgColorBrightnessChanged(true),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onBackground: Colors.black,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on background color white',
      build: () => cubit,
      act: (cubit) => cubit.bgColorBrightnessChanged(false),
      expect: () {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onBackground: Colors.white,
            );
        final state = _getState(colorScheme);

        return [state];
      },
    );
  });

  group('errorColorChanged', () {
    final color = getRandomColor();
    final onColor = _getOnColor(color);
    final colorScheme = BasicThemeState().colorScheme.copyWith(
          error: color,
          onError: onColor,
        );
    final state = _getState(colorScheme);

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits error color',
      build: () => cubit,
      act: (cubit) => cubit.errorColorChanged(color),
      expect: () => [state],
    );
  });

  group('errorColorBrightnessChanged', () {
    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on error color black',
      build: () => cubit,
      act: (cubit) => cubit.errorColorBrightnessChanged(true),
      verify: (cubit) {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onError: Colors.black,
            );
        final state = _getState(colorScheme);

        return cubit.state == state;
      },
    );

    blocTest<BasicThemeCubit, BasicThemeState>(
      'emits on error color white',
      build: () => cubit,
      act: (cubit) => cubit.errorColorBrightnessChanged(false),
      verify: (cubit) {
        final colorScheme = BasicThemeState().colorScheme.copyWith(
              onError: Colors.white,
            );
        final state = _getState(colorScheme);

        return cubit.state == state;
      },
    );
  });
}

BasicThemeState _getState(ColorScheme colorScheme) {
  return BasicThemeState(
    themeData: ThemeData.from(colorScheme: colorScheme),
    colorScheme: colorScheme,
  );
}

Color _getOnColor(Color color) {
  return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
      ? Colors.white
      : Colors.black;
}
