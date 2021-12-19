import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';

import '../../mocks.dart';
import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(
      appBarThemeCubit: MockAppBarThemeCubit(),
      tabBarThemeCubit: MockTabBarThemeCubit(),
    );
  });

  group('bottomNavBarTypeChanged', () {
    for (var type in BottomNavigationBarType.values) {
      final showUnselectedLabels =
          type == BottomNavigationBarType.shifting ? false : true;
      final bottomNavBarTheme = BottomNavigationBarThemeData(
        type: type,
        showUnselectedLabels: showUnselectedLabels,
      );
      final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits bottom navigation bar $type',
        build: () => cubit,
        act: (cubit) {
          cubit.bottomNavBarTypeChanged(UtilService.enumToString(type));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('bottomNavBarBgColorChanged', () {
    final color = getRandomColor();
    final bottomNavBarTheme = BottomNavigationBarThemeData(
      backgroundColor: color,
    );
    final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom navigation bar background color',
      build: () => cubit,
      act: (cubit) => cubit.bottomNavBarBgColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bottomNavBarSelectedItemColorChanged', () {
    final color = getRandomColor();
    final bottomNavBarTheme = BottomNavigationBarThemeData(
      selectedItemColor: color,
    );
    final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom navigation bar selected item color',
      build: () => cubit,
      act: (cubit) => cubit.bottomNavBarSelectedItemColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bottomNavBarUnselectedItemColorChanged', () {
    final color = getRandomColor();
    final bottomNavBarTheme = BottomNavigationBarThemeData(
      unselectedItemColor: color,
    );
    final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom navigation bar unselected item color',
      build: () => cubit,
      act: (cubit) => cubit.bottomNavBarUnselectedItemColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bottomNavBarShowSelectedLabelsChanged', () {
    for (var isShow in [true, false]) {
      final bottomNavBarTheme = BottomNavigationBarThemeData(
        showSelectedLabels: isShow,
      );
      final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits bottom navigation bar showSelectedLabeld=$isShow',
        build: () => cubit,
        act: (cubit) => cubit.bottomNavBarShowSelectedLabelsChanged(isShow),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('bottomNavBarShowUnselectedLabelsChanged', () {
    for (var isShow in [true, false]) {
      final bottomNavBarTheme = BottomNavigationBarThemeData(
        showUnselectedLabels: isShow,
      );
      final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits bottom navigation bar showUnselectedLabels=$isShow',
        build: () => cubit,
        act: (cubit) => cubit.bottomNavBarShowUnselectedLabelsChanged(isShow),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('bottomNavBarElevationChanged', () {
    final value = Random().nextDouble();
    final bottomNavBarTheme = BottomNavigationBarThemeData(
      elevation: value,
    );
    final theme = ThemeData(bottomNavigationBarTheme: bottomNavBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom navigation bar elevation',
      build: () => cubit,
      act: (cubit) => cubit.bottomNavBarElevationChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
