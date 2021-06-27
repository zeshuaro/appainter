import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('iconThemeColorChanged', () {
    final color = getRandomColor();
    final iconTheme = IconThemeData(color: color);
    final theme = ThemeData(iconTheme: iconTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits icon theme color',
      build: () => cubit,
      act: (cubit) => cubit.iconThemeColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('iconThemeSizeChanged', () {
    final value = Random().nextDouble();
    final iconTheme = IconThemeData(color: Colors.black87, size: value);
    final theme = ThemeData(iconTheme: iconTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits icon theme size',
      build: () => cubit,
      act: (cubit) => cubit.iconThemeSizeChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('iconThemeOpacityChanged', () {
    final value = Random().nextDouble();
    final iconTheme = IconThemeData(color: Colors.black87, opacity: value);
    final theme = ThemeData(iconTheme: iconTheme);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits icon theme opacity',
      build: () => cubit,
      act: (cubit) => cubit.iconThemeOpacityChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
