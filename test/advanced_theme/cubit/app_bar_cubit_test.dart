import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;
  late AdvancedThemeState state;

  setUp(() {
    cubit = AdvancedThemeCubit();
    state = AdvancedThemeState();
  });

  group('appBarColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar color',
      build: () => cubit,
      act: (cubit) => cubit.appBarColorChanged(color),
      expect: () {
        final appBarTheme = state.themeData.appBarTheme.copyWith(color: color);
        final expected = _getState(state.themeData, appBarTheme);

        return [expected];
      },
    );
  });

  group('appBarShadowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar shadow color',
      build: () => cubit,
      act: (cubit) => cubit.appBarShadowColorChanged(color),
      expect: () {
        final appBarTheme = state.themeData.appBarTheme.copyWith(
          shadowColor: color,
        );
        final expected = _getState(state.themeData, appBarTheme);

        return [expected];
      },
    );
  });

  group('appBarBrightnessChanged', () {
    final tests = {true: Brightness.dark, false: Brightness.light};
    tests.forEach((isDark, brightness) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits app bar $brightness',
        build: () => cubit,
        act: (cubit) => cubit.appBarBrightnessChanged(isDark),
        expect: () {
          final appBarTheme = state.themeData.appBarTheme.copyWith(
            brightness: brightness,
          );
          final expected = _getState(state.themeData, appBarTheme);

          return [expected];
        },
      );
    });
  });

  group('appBarCenterTitleChanged', () {
    for (var isCenter in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits app bar center title $isCenter',
        build: () => cubit,
        act: (cubit) => cubit.appBarCenterTitleChanged(isCenter),
        expect: () {
          final appBarTheme = state.themeData.appBarTheme.copyWith(
            centerTitle: isCenter,
          );
          final expected = _getState(state.themeData, appBarTheme);

          return [expected];
        },
      );
    }
  });

  group('appBarElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar elevation',
      build: () => cubit,
      act: (cubit) => cubit.appBarElevationChanged(value.toString()),
      expect: () {
        final appBarTheme = state.themeData.appBarTheme.copyWith(
          elevation: value,
        );
        final expected = _getState(state.themeData, appBarTheme);

        return [expected];
      },
    );
  });

  group('appBarTitleSpacingChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits app bar title spacing',
      build: () => cubit,
      act: (cubit) => cubit.appBarTitleSpacingChanged(value.toString()),
      expect: () {
        final appBarTheme = state.themeData.appBarTheme.copyWith(
          titleSpacing: value,
        );
        final expected = _getState(state.themeData, appBarTheme);

        return [expected];
      },
    );
  });
}

AdvancedThemeState _getState(ThemeData themeData, AppBarTheme appBarTheme) {
  final theme = themeData.copyWith(appBarTheme: appBarTheme);
  return AdvancedThemeState(themeData: theme);
}
