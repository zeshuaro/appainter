import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../../mocks.dart';

void main() {
  late AdvancedThemeCubit advancedThemeCubit;
  late AppBarThemeCubit appBarThemeCubit;
  late TabBarThemeCubit tabBarThemeCubit;
  late BottomNavigationBarThemeCubit bottomNavBarThemeCubit;
  late FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    tabBarThemeCubit = MockTabBarThemeCubit();
    bottomNavBarThemeCubit = MockBottomNavigationBarThemeCubit();
    floatingActionButtonThemeCubit = MockFloatingActionButtonThemeCubit();

    advancedThemeCubit = AdvancedThemeCubit(
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
    );
  });

  void _verifyThemeChanged(ThemeData theme) {
    verify(() {
      appBarThemeCubit.themeChanged(theme.appBarTheme);
    }).called(1);
    verify(() {
      tabBarThemeCubit.themeChanged(theme.tabBarTheme);
    }).called(1);
    verify(() {
      bottomNavBarThemeCubit.themeChanged(theme.bottomNavigationBarTheme);
    }).called(1);
    verify(() {
      floatingActionButtonThemeCubit.themeChanged(
        theme.floatingActionButtonTheme,
      );
    }).called(1);
  }

  test('initial state is AdvancedThemeState', () {
    expect(advancedThemeCubit.state, equals(AdvancedThemeState()));
  });

  group('themeDataChanged', () {
    final colorScheme = randomColorScheme(shouldPrint: false);
    final theme = ThemeData.from(colorScheme: colorScheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits themeDataChanged',
      build: () => advancedThemeCubit,
      act: (cubit) => cubit.themeDataChanged(theme),
      expect: () => [AdvancedThemeState(themeData: theme)],
      verify: (cubit) => _verifyThemeChanged(theme),
    );
  });

  group('randomizedThemeRequested', () {
    const seed = 0;
    final colorScheme = randomColorSchemeLight(seed: seed, shouldPrint: false);
    final theme = ThemeData.from(colorScheme: colorScheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits randomizedThemeRequested',
      build: () => advancedThemeCubit,
      act: (cubit) => cubit.randomizedThemeRequested(seed),
      expect: () => [AdvancedThemeState(themeData: theme)],
      verify: (cubit) => _verifyThemeChanged(theme),
    );
  });

  group('defaultThemeRequested', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits defaultThemeRequested',
      build: () => advancedThemeCubit,
      act: (cubit) => cubit.defaultThemeRequested(),
      expect: () => [AdvancedThemeState()],
    );
  });
}
