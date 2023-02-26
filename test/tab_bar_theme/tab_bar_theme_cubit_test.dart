import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late TabBarThemeCubit themeCubit;
  late TabBarLabelTextStyleCubit labelTextStyleCubit;
  late TabBarUnselectedLabelTextStyleCubit unselectedLabelTextStyleCubit;

  late TabBarTheme theme;
  late Color color;

  setUp(() {
    labelTextStyleCubit = TabBarLabelTextStyleCubit();
    unselectedLabelTextStyleCubit = TabBarUnselectedLabelTextStyleCubit();
    themeCubit = TabBarThemeCubit(
      labelTextStyleCubit: labelTextStyleCubit,
      unselectedLabelTextStyleCubit: unselectedLabelTextStyleCubit,
    );
    color = getRandomColor();

    final colorScheme = randomColorSchemeLight(shouldPrint: false);
    theme = ThemeData.from(colorScheme: colorScheme).tabBarTheme;
  });

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'emit theme',
    build: () => themeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [
      TabBarThemeState(theme: theme),
      TabBarThemeState(
        theme: theme.copyWith(
          labelStyle: TabBarThemeCubit.defaultLabelTextStyle,
        ),
      ),
      TabBarThemeState(
        theme: theme.copyWith(
          labelStyle: TabBarThemeCubit.defaultLabelTextStyle,
          unselectedLabelStyle: TabBarThemeCubit.defaultLabelTextStyle,
        ),
      ),
    ],
  );

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'emit label color',
    build: () => themeCubit,
    act: (cubit) => cubit.labelColorChanged(color),
    expect: () => [TabBarThemeState.withTheme(labelColor: color)],
  );

  blocTest<TabBarThemeCubit, TabBarThemeState>(
    'emit unselected label color',
    build: () => themeCubit,
    act: (cubit) => cubit.unselectedLabelColorChanged(color),
    expect: () => [TabBarThemeState.withTheme(unselectedLabelColor: color)],
  );

  group('test indicator size', () {
    for (var size in TabBarIndicatorSize.values) {
      blocTest<TabBarThemeCubit, TabBarThemeState>(
        'emit $size',
        build: () => themeCubit,
        act: (cubit) {
          cubit.indicatorSizeChanged(UtilService.enumToString(size));
        },
        expect: () => [TabBarThemeState.withTheme(indicatorSize: size)],
      );
    }
  });

  test('initialise label text style cubit', () {
    final cubit = TabBarLabelTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.titleSmall));
    expect(cubit.isBaseStyleBlack, equals(false));
  });

  test('initialise unselected label text style cubit', () {
    final cubit = TabBarUnselectedLabelTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.titleSmall));
    expect(cubit.isBaseStyleBlack, equals(false));
  });
}
