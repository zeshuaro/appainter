import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late TabBarThemeCubit cubit;
  late TabBarTheme theme;
  late Color color;

  setUp(() {
    cubit = TabBarThemeCubit();
    color = getRandomColor();

    final colorScheme = randomColorSchemeLight(shouldPrint: false);
    theme = ThemeData.from(colorScheme: colorScheme).tabBarTheme;
  });

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'should emit theme',
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [TabBarThemeState(theme: theme)],
  );

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'should emit label color',
    build: () => cubit,
    act: (cubit) => cubit.labelColorChanged(color),
    expect: () => [TabBarThemeState(theme: TabBarTheme(labelColor: color))],
  );

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'should emit unselected label color',
    build: () => cubit,
    act: (cubit) => cubit.unselectedLabelColorChanged(color),
    expect: () {
      return [
        TabBarThemeState(theme: TabBarTheme(unselectedLabelColor: color)),
      ];
    },
  );

  group('test indicator size', () {
    for (var size in TabBarIndicatorSize.values) {
      blocTest<TabBarThemeCubit, TabBarThemeState>(
        'should emit $size',
        build: () => cubit,
        act: (cubit) {
          cubit.indicatorSizeChanged(UtilService.enumToString(size));
        },
        expect: () {
          return [TabBarThemeState(theme: TabBarTheme(indicatorSize: size))];
        },
      );
    }
  });
}
