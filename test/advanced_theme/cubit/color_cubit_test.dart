import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../brightness.dart';
import '../../mocks.dart';
import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(appBarThemeCubit: MockAppBarThemeCubit());
  });

  group('primaryColorBrightnessChanged', () {
    for (var test in BrightnessTest.testCases) {
      final theme = ThemeData(primaryColorBrightness: test.brightness);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits primary color ${test.brightness}',
        build: () => cubit,
        act: (cubit) => cubit.primaryColorBrightnessChanged(test.isDark),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('primaryColorLightChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(primaryColorLight: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color light',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorLightChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('primaryColorDarkChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(primaryColorDark: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorDarkChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bgColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(backgroundColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits background color',
      build: () => cubit,
      act: (cubit) => cubit.bgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bottomAppBarColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(bottomAppBarColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom app bar color',
      build: () => cubit,
      act: (cubit) => cubit.bottomAppBarColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('canvasColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(canvasColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits canvas color',
      build: () => cubit,
      act: (cubit) => cubit.canvasColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('cardColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(cardColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits card color',
      build: () => cubit,
      act: (cubit) => cubit.cardColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('dialogBgColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(dialogBackgroundColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits dialog background color',
      build: () => cubit,
      act: (cubit) => cubit.dialogBgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('disabledColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(disabledColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits disabled color',
      build: () => cubit,
      act: (cubit) => cubit.disabledColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
      // verify: (cubit) => debugAdvancedThemeCubit(cubit, theme),
    );
  });

  group('dividerColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(dividerColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits divider color',
      build: () => cubit,
      act: (cubit) => cubit.dividerColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('errorColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(errorColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits error color',
      build: () => cubit,
      act: (cubit) => cubit.errorColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('focusColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(focusColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits focus color',
      build: () => cubit,
      act: (cubit) => cubit.focusColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('highlightColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(highlightColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits highlight color',
      build: () => cubit,
      act: (cubit) => cubit.highlightColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('hintColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(hintColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hint color',
      build: () => cubit,
      act: (cubit) => cubit.hintColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('hoverColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(hoverColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hover color',
      build: () => cubit,
      act: (cubit) => cubit.hoverColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('indicatorColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(indicatorColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits indicator color',
      build: () => cubit,
      act: (cubit) => cubit.indicatorColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('scaffoldBgColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(scaffoldBackgroundColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits scaffold background color',
      build: () => cubit,
      act: (cubit) => cubit.scaffoldBgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('secondaryHeaderolorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(secondaryHeaderColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits secondary header color',
      build: () => cubit,
      act: (cubit) => cubit.secondaryHeaderColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('selectedRowColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(selectedRowColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits selected row color',
      build: () => cubit,
      act: (cubit) => cubit.selectedRowColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('shadowColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(shadowColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits shadow row color',
      build: () => cubit,
      act: (cubit) => cubit.shadowColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('splashColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(splashColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits splash color',
      build: () => cubit,
      act: (cubit) => cubit.splashColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('toggleableActiveColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(toggleableActiveColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits toggleable active color',
      build: () => cubit,
      act: (cubit) => cubit.toggleableActiveColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('unselectedWidgetColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(unselectedWidgetColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits unselected widget color',
      build: () => cubit,
      act: (cubit) => cubit.unselectedWidgetColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
