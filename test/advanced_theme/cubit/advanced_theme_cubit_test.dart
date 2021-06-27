import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() => cubit = AdvancedThemeCubit());

  test('initial state is AdvancedThemeState', () {
    expect(cubit.state, equals(AdvancedThemeState()));
  });

  group('themeDataChanged', () {
    final colorScheme = randomColorScheme(shouldPrint: false);
    final theme = ThemeData.from(colorScheme: colorScheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits themeDataChanged',
      build: () => cubit,
      act: (cubit) => cubit.themeDataChanged(theme),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('randomizedThemeRequested', () {
    final seed = 0;
    final colorScheme = randomColorSchemeLight(seed: seed, shouldPrint: false);
    final swatch = UtilService.getColorSwatch(colorScheme.primary);
    final theme = ThemeData.from(colorScheme: colorScheme).copyWith(
      primaryColorLight: swatch[100],
      primaryColorDark: swatch[700],
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits randomizedThemeRequested',
      build: () => cubit,
      act: (cubit) => cubit.randomizedThemeRequested(seed),
      expect: () => [AdvancedThemeState(themeData: theme)],
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
