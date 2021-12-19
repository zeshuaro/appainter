import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('appBarBackgroundColorChanged', () {
    final color = getRandomColor();
    final appBarTheme = AppBarTheme(backgroundColor: color);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar background color',
      build: () => cubit,
      act: (cubit) => cubit.appBarBackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarForegroundColorChanged', () {
    final color = getRandomColor();
    final appBarTheme = AppBarTheme(foregroundColor: color);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar foreground color',
      build: () => cubit,
      act: (cubit) => cubit.appBarForegroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarElevationChanged', () {
    final value = Random().nextDouble();
    final appBarTheme = AppBarTheme(elevation: value);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar elevation',
      build: () => cubit,
      act: (cubit) => cubit.appBarElevationChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarShadowColorChanged', () {
    final color = getRandomColor();
    final appBarTheme = AppBarTheme(shadowColor: color);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar shadow color',
      build: () => cubit,
      act: (cubit) => cubit.appBarShadowColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarCenterTitleChanged', () {
    for (var isCenter in [true, false]) {
      final appBarTheme = AppBarTheme(centerTitle: isCenter);
      final theme = ThemeData(appBarTheme: appBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit app bar centerTitle=$isCenter',
        build: () => cubit,
        act: (cubit) => cubit.appBarCenterTitleChanged(isCenter),
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('appBarTitleSpacingChanged', () {
    final value = Random().nextDouble();
    final appBarTheme = AppBarTheme(titleSpacing: value);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar title spacing',
      build: () => cubit,
      act: (cubit) => cubit.appBarTitleSpacingChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarToolBarHeightChanged', () {
    final value = Random().nextDouble();
    final appBarTheme = AppBarTheme(toolbarHeight: value);
    final theme = ThemeData(appBarTheme: appBarTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit app bar tool bar height',
      build: () => cubit,
      act: (cubit) => cubit.appBarToolBarHeightChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('appBarSystemUiOverlayStyleChanged', () {
    for (var style in MySystemUiOverlayStyle().values) {
      final appBarTheme = AppBarTheme(systemOverlayStyle: style);
      final theme = ThemeData(appBarTheme: appBarTheme);

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit app bar ${style.statusBarBrightness}',
        build: () => cubit,
        act: (cubit) {
          cubit.appBarSystemUiOverlayStyleChanged(
            MySystemUiOverlayStyle().stringFromEnum(style)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });
}
