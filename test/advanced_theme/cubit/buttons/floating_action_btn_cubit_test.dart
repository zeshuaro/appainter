import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('floatingActionBtnBgColorChanged', () {
    final color = getRandomColor();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      backgroundColor: color,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar background color',
      build: () => cubit,
      act: (cubit) => cubit.floatingActionBtnBgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnFgColorChanged', () {
    final color = getRandomColor();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      foregroundColor: color,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar foreground color',
      build: () => cubit,
      act: (cubit) => cubit.floatingActionBtnFgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnHoverColorChanged', () {
    final color = getRandomColor();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      hoverColor: color,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar hover color',
      build: () => cubit,
      act: (cubit) => cubit.floatingActionBtnHoverColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnSplashColorChanged', () {
    final color = getRandomColor();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      splashColor: color,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar splash color',
      build: () => cubit,
      act: (cubit) => cubit.floatingActionBtnSplashColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnElevationChanged', () {
    final value = Random().nextDouble();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      elevation: value,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar elevation',
      build: () => cubit,
      act: (cubit) => cubit.floatingActionBtnElevationChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnDisabledElevationChanged', () {
    final value = Random().nextDouble();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      disabledElevation: value,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.floatingActionBtnDisabledElevationChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnFocusElevationChanged', () {
    final value = Random().nextDouble();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      focusElevation: value,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar focus elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.floatingActionBtnFocusElevationChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnHighlightElevationChanged', () {
    final value = Random().nextDouble();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      highlightElevation: value,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar highlight elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.floatingActionBtnHighlightElevationChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('floatingActionBtnHoverElevationChanged', () {
    final value = Random().nextDouble();
    final floatingActionBtnTheme = FloatingActionButtonThemeData(
      hoverElevation: value,
    );
    final theme = ThemeData(floatingActionButtonTheme: floatingActionBtnTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits floating action bar hover elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.floatingActionBtnHoverElevationChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
