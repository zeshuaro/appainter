import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late BottomNavigationBarThemeCubit cubit;
  late BottomNavigationBarThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    cubit = BottomNavigationBarThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    final colorScheme = randomColorSchemeLight(shouldPrint: false);
    theme = ThemeData.from(colorScheme: colorScheme).bottomNavigationBarTheme;
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'should emit theme',
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [BottomNavigationBarThemeState(theme: theme)],
  );

  group('test type', () {
    for (var type in BottomNavigationBarType.values) {
      final showLabels =
          type == BottomNavigationBarType.shifting ? false : true;

      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'should emit $type',
        build: () => cubit,
        act: (cubit) => cubit.typeChanged(UtilService.enumToString(type)),
        expect: () {
          return [
            BottomNavigationBarThemeState(
              theme: BottomNavigationBarThemeData(
                type: type,
                showUnselectedLabels: showLabels,
              ),
            ),
          ];
        },
      );
    }
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'should emit background color',
    build: () => cubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () {
      return [
        BottomNavigationBarThemeState(
          theme: BottomNavigationBarThemeData(backgroundColor: color),
        ),
      ];
    },
  );

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'should emit selected item color',
    build: () => cubit,
    act: (cubit) => cubit.selectedItemColorChanged(color),
    expect: () {
      return [
        BottomNavigationBarThemeState(
          theme: BottomNavigationBarThemeData(selectedItemColor: color),
        ),
      ];
    },
  );

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'should emit unselected item color',
    build: () => cubit,
    act: (cubit) => cubit.unselectedItemColorChanged(color),
    expect: () {
      return [
        BottomNavigationBarThemeState(
          theme: BottomNavigationBarThemeData(unselectedItemColor: color),
        ),
      ];
    },
  );

  group('test show selected labels', () {
    for (var isShow in [true, false]) {
      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'should emit $isShow',
        build: () => cubit,
        act: (cubit) => cubit.showSelectedLabelsChanged(isShow),
        expect: () {
          return [
            BottomNavigationBarThemeState(
              theme: BottomNavigationBarThemeData(showSelectedLabels: isShow),
            ),
          ];
        },
      );
    }
  });

  group('test show unselected labels', () {
    for (var isShow in [true, false]) {
      blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
        'should emit $isShow',
        build: () => cubit,
        act: (cubit) => cubit.showUnselectedLabelsChanged(isShow),
        expect: () {
          return [
            BottomNavigationBarThemeState(
              theme: BottomNavigationBarThemeData(showUnselectedLabels: isShow),
            ),
          ];
        },
      );
    }
  });

  blocTest<BottomNavigationBarThemeCubit, BottomNavigationBarThemeState>(
    'should emit elevation',
    build: () => cubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    expect: () {
      return [
        BottomNavigationBarThemeState(
          theme: BottomNavigationBarThemeData(elevation: doubleValue),
        ),
      ];
    },
  );
}
