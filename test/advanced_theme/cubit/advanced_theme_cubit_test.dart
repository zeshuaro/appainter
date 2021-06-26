import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import 'advanced_theme_utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() => cubit = AdvancedThemeCubit());

  test('initial state is AdvancedThemeState', () {
    expect(cubit.state, equals(AdvancedThemeState()));
  });

  group('themeDataChanged', () {
    final colorScheme = randomColorScheme(shouldPrint: false);
    final theme = ThemeData.from(colorScheme: colorScheme);
    final state = getAdvancedThemeState(theme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits themeDataChanged',
      build: () => cubit,
      act: (cubit) => cubit.themeDataChanged(theme),
      expect: () => [state],
    );
  });

  group('randomizedThemeRequested', () {
    final seed = 0;
    final colorScheme = randomColorSchemeLight(seed: seed, shouldPrint: false);
    final swatch = UtilService.getColorSwatch(colorScheme.primary);
    final theme = ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme).copyWith(
        primaryColorLight: swatch[100],
        primaryColorDark: swatch[700],
      ),
      Typography.englishLike2018,
    );
    final state = getAdvancedThemeState(theme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits randomizedThemeRequested',
      build: () => cubit,
      act: (cubit) => cubit.randomizedThemeRequested(seed),
      expect: () => [state],
    );
  });

  group('defaultThemeRequested', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits defaultThemeRequested',
      build: () => cubit,
      act: (cubit) => cubit.defaultThemeRequested(),
      expect: () => [AdvancedThemeState()],
    );
  });
}
