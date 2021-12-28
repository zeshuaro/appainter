import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../../mocks.dart';

void main() {
  late AdvancedThemeCubit advancedThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late AppBarThemeCubit appBarThemeCubit;
  late TabBarThemeCubit tabBarThemeCubit;
  late BottomNavigationBarThemeCubit bottomNavBarThemeCubit;
  late FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  late ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  late OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  late TextButtonThemeCubit textButtonThemeCubit;
  late IconThemeCubit iconThemeCubit;
  late InputDecorationThemeCubit inputDecorationThemeCubit;

  setUpAll(() {
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    appBarThemeCubit = MockAppBarThemeCubit();
    tabBarThemeCubit = MockTabBarThemeCubit();
    bottomNavBarThemeCubit = MockBottomNavigationBarThemeCubit();
    floatingActionButtonThemeCubit = MockFloatingActionButtonThemeCubit();
    elevatedButtonThemeCubit = MockElevatedButtonThemeCubit();
    outlinedButtonThemeCubit = MockOutlinedButtonThemeCubit();
    textButtonThemeCubit = MockTextButtonThemeCubit();
    iconThemeCubit = MockIconThemeCubit();
    inputDecorationThemeCubit = MockInputDecorationThemeCubit();

    advancedThemeCubit = AdvancedThemeCubit(
      colorThemeCubit: colorThemeCubit,
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
      outlinedButtonThemeCubit: outlinedButtonThemeCubit,
      textButtonThemeCubit: textButtonThemeCubit,
      iconThemeCubit: iconThemeCubit,
      inputDecorationThemeCubit: inputDecorationThemeCubit,
    );
  });

  void _verifyThemeChanged(ThemeData theme) {
    verify(() => colorThemeCubit.themeChanged(any())).called(1);
    verify(() => appBarThemeCubit.themeChanged(theme.appBarTheme)).called(1);
    verify(() => tabBarThemeCubit.themeChanged(theme.tabBarTheme)).called(1);
    verify(
      () => bottomNavBarThemeCubit.themeChanged(theme.bottomNavigationBarTheme),
    ).called(1);
    verify(() {
      floatingActionButtonThemeCubit.themeChanged(
        theme.floatingActionButtonTheme,
      );
    }).called(1);
    verify(
      () => elevatedButtonThemeCubit.themeChanged(theme.elevatedButtonTheme),
    ).called(1);
    verify(
      () => outlinedButtonThemeCubit.themeChanged(theme.outlinedButtonTheme),
    ).called(1);
    verify(
      () => textButtonThemeCubit.themeChanged(theme.textButtonTheme),
    ).called(1);
    verify(() => iconThemeCubit.themeChanged(theme.iconTheme)).called(1);
    verify(
      () => inputDecorationThemeCubit.themeChanged(theme.inputDecorationTheme),
    ).called(1);
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
