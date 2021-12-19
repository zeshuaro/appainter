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

  group('inputDecorationFloatingLabelBehaviorChanged', () {
    for (var behavior in FloatingLabelBehavior.values) {
      final theme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: behavior,
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits input decoration $behavior',
        build: () => cubit,
        act: (cubit) {
          cubit.inputDecorationFloatingLabelBehaviorChanged(
            UtilService.enumToString(behavior),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('inputDecorationFillColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: color,
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits input decoration fill color',
      build: () => cubit,
      act: (cubit) => cubit.inputDecorationFillColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('inputDecorationHoverColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: color,
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits input decoration hover color',
      build: () => cubit,
      act: (cubit) => cubit.inputDecorationHoverColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('inputDecorationAlignLabelWithHintChanged', () {
    for (var value in [true, false]) {
      final theme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: value,
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits input decoration align label with hint $value',
        build: () => cubit,
        act: (cubit) => cubit.inputDecorationAlignLabelWithHintChanged(value),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('inputDecorationFilledChanged', () {
    for (var value in [true, false]) {
      final theme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: value,
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits input decoration is filled $value',
        build: () => cubit,
        act: (cubit) => cubit.inputDecorationFilledChanged(value),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('inputDecorationIsCollapsedChanged', () {
    for (var value in [true, false]) {
      final theme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          isCollapsed: value,
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits input decoration is collapsed $value',
        build: () => cubit,
        act: (cubit) => cubit.inputDecorationIsCollapsedChanged(value),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('inputDecorationIsDenseChanged', () {
    for (var value in [true, false]) {
      final theme = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          isDense: value,
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits input decoration is dense $value',
        build: () => cubit,
        act: (cubit) => cubit.inputDecorationIsDenseChanged(value),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('inputDecorationErrorMaxLinesChanged', () {
    final value = Random().nextInt(10);
    final theme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: value,
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits input decoration error max lines $value',
      build: () => cubit,
      act: (cubit) {
        cubit.inputDecorationErrorMaxLinesChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('inputDecorationHelperMaxLinesChanged', () {
    final value = Random().nextInt(10);
    final theme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        helperMaxLines: value,
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits input decoration helper max lines $value',
      build: () => cubit,
      act: (cubit) {
        cubit.inputDecorationHelperMaxLinesChanged(value.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
