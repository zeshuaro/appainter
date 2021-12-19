import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';

import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('tabBarLabelColorChanged', () {
    final color = getRandomColor();
    final tabBarTheme = TabBarTheme(labelColor: color);
    final theme = ThemeData(tabBarTheme: tabBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits tab bar label color',
      build: () => cubit,
      act: (cubit) => cubit.tabBarLabelColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('tabBarUnselectedLabelColorChanged', () {
    final color = getRandomColor();
    final tabBarTheme = TabBarTheme(unselectedLabelColor: color);
    final theme = ThemeData(tabBarTheme: tabBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits tab bar unselected label color',
      build: () => cubit,
      act: (cubit) => cubit.tabBarUnselectedLabelColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('tabBarIndicatorSizeChanged', () {
    for (var size in TabBarIndicatorSize.values) {
      final tabBarTheme = TabBarTheme(indicatorSize: size);
      final theme = ThemeData(tabBarTheme: tabBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits tab bar $size',
        build: () => cubit,
        act: (cubit) {
          cubit.tabBarIndicatorSizeChanged(UtilService.enumToString(size));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });
}
