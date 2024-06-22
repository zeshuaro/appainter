import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';

void main() {
  const seed = 0;
  late ThemeData theme;

  late AdvancedThemeCubit advancedThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late AppBarThemeCubit appBarThemeCubit;
  late TabBarThemeCubit tabBarThemeCubit;
  late BottomNavigationBarThemeCubit bottomNavBarThemeCubit;
  late FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  late ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  late FilledButtonThemeCubit filledButtonThemeCubit;
  late OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  late TextButtonThemeCubit textButtonThemeCubit;
  late IconThemeCubit iconThemeCubit;
  late InputDecorationThemeCubit inputDecorationThemeCubit;
  late SwitchThemeCubit switchThemeCubit;
  late CheckboxThemeCubit checkboxThemeCubit;
  late RadioThemeCubit radioThemeCubit;
  late SliderThemeCubit sliderThemeCubit;
  late TextThemeCubit textThemeCubit;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    appBarThemeCubit = MockAppBarThemeCubit();
    tabBarThemeCubit = MockTabBarThemeCubit();
    bottomNavBarThemeCubit = MockBottomNavigationBarThemeCubit();
    floatingActionButtonThemeCubit = MockFloatingActionButtonThemeCubit();
    elevatedButtonThemeCubit = MockElevatedButtonThemeCubit();
    filledButtonThemeCubit = MockFilledButtonThemeCubit();
    outlinedButtonThemeCubit = MockOutlinedButtonThemeCubit();
    textButtonThemeCubit = MockTextButtonThemeCubit();
    iconThemeCubit = MockIconThemeCubit();
    inputDecorationThemeCubit = MockInputDecorationThemeCubit();
    switchThemeCubit = MockSwitchThemeCubit();
    checkboxThemeCubit = MockCheckboxThemeCubit();
    radioThemeCubit = MockRadioThemeCubit();
    sliderThemeCubit = MockSliderThemeCubit();
    textThemeCubit = MockTextThemeCubit();

    advancedThemeCubit = AdvancedThemeCubit(
      colorThemeCubit: colorThemeCubit,
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
      filledButtonThemeCubit: filledButtonThemeCubit,
      outlinedButtonThemeCubit: outlinedButtonThemeCubit,
      textButtonThemeCubit: textButtonThemeCubit,
      iconThemeCubit: iconThemeCubit,
      inputDecorationThemeCubit: inputDecorationThemeCubit,
      switchThemeCubit: switchThemeCubit,
      checkboxThemeCubit: checkboxThemeCubit,
      radioThemeCubit: radioThemeCubit,
      sliderThemeCubit: sliderThemeCubit,
      textThemeCubit: textThemeCubit,
    );
  });

  void verifyThemeChanged(ThemeData theme) {
    verify(() => colorThemeCubit.themeChanged(theme)).called(1);
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
      () => elevatedButtonThemeCubit.styleChanged(
        theme.elevatedButtonTheme.style,
      ),
    ).called(1);
    verify(
      () => filledButtonThemeCubit.styleChanged(theme.filledButtonTheme.style),
    ).called(1);
    verify(
      () => outlinedButtonThemeCubit.styleChanged(
        theme.outlinedButtonTheme.style,
      ),
    ).called(1);
    verify(
      () => textButtonThemeCubit.styleChanged(theme.textButtonTheme.style),
    ).called(1);
    verify(() => iconThemeCubit.themeChanged(theme.iconTheme)).called(1);
    verify(
      () => inputDecorationThemeCubit.themeChanged(theme.inputDecorationTheme),
    ).called(1);
    verify(() => switchThemeCubit.themeChanged(theme.switchTheme)).called(1);
    verify(
      () => checkboxThemeCubit.themeChanged(theme.checkboxTheme),
    ).called(1);
    verify(() => radioThemeCubit.themeChanged(theme.radioTheme)).called(1);
    verify(() => sliderThemeCubit.themeChanged(theme.sliderTheme)).called(1);
    verify(() => textThemeCubit.themeChanged(theme.textTheme)).called(1);
  }

  group('test theme brightness', () {
    for (var isDark in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit theme brightness with isDark=$isDark',
        setUp: () {
          theme = _getDefaultTheme(isDark: isDark);
        },
        build: () => advancedThemeCubit,
        act: (cubit) => cubit.themeBrightnessChanged(isDark),
        expect: () => [AdvancedThemeState(isDark: isDark)],
        verify: (cubit) {
          verify(() => colorThemeCubit.themeChanged(theme)).called(1);
          verify(() => textThemeCubit.themeBrightnessChanged(isDark));
        },
      );
    }
  });

  group('test new theme', () {
    for (var isDark in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit new theme with isDark=$isDark',
        setUp: () {
          final colorScheme = randomColorScheme(
            isDark: isDark,
            shouldPrint: false,
          );
          theme = ThemeData.localize(
            ThemeData.from(colorScheme: colorScheme),
            Typography.englishLike2018,
          );
        },
        build: () => advancedThemeCubit,
        act: (cubit) => cubit.themeChanged(theme),
        verify: (cubit) => verifyThemeChanged(theme),
      );
    }
  });

  group('test random theme', () {
    for (var isDark in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit random theme with isDark=$isDark',
        setUp: () {
          final colorScheme = randomColorScheme(
            seed: seed,
            isDark: isDark,
            shouldPrint: false,
          );
          theme = ThemeData.localize(
            ThemeData.from(colorScheme: colorScheme),
            Typography.englishLike2018,
          );
        },
        build: () => advancedThemeCubit,
        seed: () => AdvancedThemeState(isDark: isDark),
        act: (cubit) => cubit.themeRandomized(seed),
        verify: (cubit) => verifyThemeChanged(theme),
      );
    }
  });

  group('test default theme', () {
    for (var isDark in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit default theme with isDark=$isDark',
        setUp: () {
          theme = ThemeData.localize(
            _getDefaultTheme(isDark: isDark),
            Typography.englishLike2018,
          );
        },
        build: () => advancedThemeCubit,
        seed: () => AdvancedThemeState(isDark: isDark),
        act: (cubit) => cubit.themeReset(),
        verify: (cubit) => verifyThemeChanged(theme),
      );
    }
  });

  group('test use material 3', () {
    for (var useMaterial3 in [true, false]) {
      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit useMaterial3=$useMaterial3',
        build: () => advancedThemeCubit,
        seed: () => AdvancedThemeState(useMaterial3: !useMaterial3),
        act: (cubit) => cubit.useMaterial3Changed(useMaterial3),
        expect: () => [AdvancedThemeState(useMaterial3: useMaterial3)],
      );
    }
  });
}

ThemeData _getDefaultTheme({required bool isDark}) {
  return isDark ? ThemeData.dark() : ThemeData.light();
}
