import 'dart:math';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late BottomNavigationBarThemeCubit cubit;
  late BottomNavigationBarLabelTextStyleCubit labelTextStyleCubit;
  late BottomNavigationBarUnselectedLabelTextStyleCubit
      unselectedLabelTextStyleCubit;

  late BottomNavigationBarThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    labelTextStyleCubit = BottomNavigationBarLabelTextStyleCubit();
    unselectedLabelTextStyleCubit =
        BottomNavigationBarUnselectedLabelTextStyleCubit();
    cubit = BottomNavigationBarThemeCubit(
      labelTextStyleCubit: labelTextStyleCubit,
      unselectedLabelTextStyleCubit: unselectedLabelTextStyleCubit,
    );
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    final colorScheme = randomColorSchemeLight(shouldPrint: false);
    theme = ThemeData.from(colorScheme: colorScheme).bottomNavigationBarTheme;
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'emit theme',
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [
      BottomNavigationBarThemeState(theme: theme),
      BottomNavigationBarThemeState(
        theme: theme.copyWith(
          selectedLabelStyle:
              BottomNavigationBarThemeCubit.defaultLabelTextStyle,
        ),
      ),
      BottomNavigationBarThemeState(
        theme: theme.copyWith(
          selectedLabelStyle:
              BottomNavigationBarThemeCubit.defaultLabelTextStyle,
          unselectedLabelStyle:
              BottomNavigationBarThemeCubit.defaultLabelTextStyle,
        ),
      ),
    ],
  );

  group('test type', () {
    for (var type in BottomNavigationBarType.values) {
      final showLabels =
          type == BottomNavigationBarType.shifting ? false : true;

      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'emit $type',
        build: () => cubit,
        act: (cubit) => cubit.typeChanged(UtilService.enumToString(type)),
        expect: () => [
          BottomNavigationBarThemeState.withThemeData(
            type: type,
            showUnselectedLabels: showLabels,
          ),
        ],
      );
    }
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [
      BottomNavigationBarThemeState.withThemeData(backgroundColor: color),
    ],
  );

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'emit selected item color',
    build: () => cubit,
    act: (cubit) => cubit.selectedItemColorChanged(color),
    expect: () => [
      BottomNavigationBarThemeState.withThemeData(selectedItemColor: color),
    ],
  );

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'emit unselected item color',
    build: () => cubit,
    act: (cubit) => cubit.unselectedItemColorChanged(color),
    expect: () => [
      BottomNavigationBarThemeState.withThemeData(unselectedItemColor: color),
    ],
  );

  group('test show selected labels', () {
    for (var isShow in [true, false]) {
      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'emit $isShow',
        build: () => cubit,
        act: (cubit) => cubit.showSelectedLabelsChanged(isShow),
        expect: () => [
          BottomNavigationBarThemeState.withThemeData(
            showSelectedLabels: isShow,
          ),
        ],
      );
    }
  });

  group('test show unselected labels', () {
    for (var isShow in [true, false]) {
      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'emit $isShow',
        build: () => cubit,
        act: (cubit) => cubit.showUnselectedLabelsChanged(isShow),
        expect: () => [
          BottomNavigationBarThemeState.withThemeData(
            showUnselectedLabels: isShow,
          ),
        ],
      );
    }
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'emit elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    expect: () => [
      BottomNavigationBarThemeState.withThemeData(elevation: doubleValue),
    ],
  );

  test('initialise label text style cubit', () {
    final cubit = BottomNavigationBarLabelTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.labelLarge));
    expect(cubit.isBaseStyleBlack, equals(false));
  });

  test('initialise unselected label text style cubit', () {
    final cubit = BottomNavigationBarUnselectedLabelTextStyleCubit();
    expect(cubit.typeScale, equals(TypeScale.labelLarge));
    expect(cubit.isBaseStyleBlack, equals(false));
  });
}
