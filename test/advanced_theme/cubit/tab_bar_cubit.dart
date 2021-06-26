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

  group('tabBarLabelColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits tab bar label color',
      build: () => cubit,
      act: (cubit) => cubit.tabBarLabelColorChanged(color),
      expect: () {
        final tabBarTheme = state.themeData.tabBarTheme.copyWith(
          labelColor: color,
        );
        final expected = _getState(state.themeData, tabBarTheme);

        return [expected];
      },
    );
  });

  group('tabBarUnselectedLabelColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits tab bar unselected label color',
      build: () => cubit,
      act: (cubit) => cubit.tabBarUnselectedLabelColorChanged(color),
      expect: () {
        final tabBarTheme = state.themeData.tabBarTheme.copyWith(
          unselectedLabelColor: color,
        );
        final expected = _getState(state.themeData, tabBarTheme);

        return [expected];
      },
    );
  });
}

AdvancedThemeState _getState(ThemeData themeData, TabBarTheme tabBarTheme) {
  final theme = themeData.copyWith(tabBarTheme: tabBarTheme);
  return AdvancedThemeState(themeData: theme);
}
