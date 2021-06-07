// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/cubits/cubits.dart';

import '../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() => cubit = AdvancedThemeCubit());

  group('primaryColorBrightnessChanged', () {
    var isDark = false;
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color brightness light',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(isDark),
      verify: (cubit) {
        return cubit.state.themeData.primaryColorBrightness == Brightness.light;
      },
    );

    isDark = true;
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color brightness dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(isDark),
      verify: (cubit) {
        return cubit.state.themeData.primaryColorBrightness == Brightness.dark;
      },
    );
  });

  group('primaryColorLightChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color light',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorLightChanged(color),
      verify: (cubit) => cubit.state.themeData.primaryColorLight == color,
    );
  });

  group('primaryColorDarkChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorDarkChanged(color),
      verify: (cubit) => cubit.state.themeData.primaryColorDark == color,
    );
  });

  group('accentColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color',
      build: () => cubit,
      act: (cubit) => cubit.accentColorChanged(color),
      verify: (cubit) => cubit.state.themeData.accentColor == color,
    );
  });

  group('accentColorBrightnessChanged', () {
    var isDark = false;
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color brightness light',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(isDark),
      verify: (cubit) {
        return cubit.state.themeData.accentColorBrightness == Brightness.light;
      },
    );

    isDark = true;
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color brightness dark',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(isDark),
      verify: (cubit) {
        return cubit.state.themeData.accentColorBrightness == Brightness.dark;
      },
    );
  });

  group('bgColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits background color',
      build: () => cubit,
      act: (cubit) => cubit.bgColorChanged(color),
      verify: (cubit) => cubit.state.themeData.backgroundColor == color,
    );
  });

  group('bottomAppBarColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom app bar color',
      build: () => cubit,
      act: (cubit) => cubit.bottomAppBarColorChanged(color),
      verify: (cubit) => cubit.state.themeData.bottomAppBarColor == color,
    );
  });

  group('canvasColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits canvas color',
      build: () => cubit,
      act: (cubit) => cubit.canvasColorChanged(color),
      verify: (cubit) => cubit.state.themeData.canvasColor == color,
    );
  });

  group('cardColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits card color',
      build: () => cubit,
      act: (cubit) => cubit.cardColorChanged(color),
      verify: (cubit) => cubit.state.themeData.cardColor == color,
    );
  });

  group('dialogBgColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits dialog background color',
      build: () => cubit,
      act: (cubit) => cubit.dialogBgColorChanged(color),
      verify: (cubit) => cubit.state.themeData.dialogBackgroundColor == color,
    );
  });

  group('disabledColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits disabled color',
      build: () => cubit,
      act: (cubit) => cubit.disabledColorChanged(color),
      verify: (cubit) => cubit.state.themeData.disabledColor == color,
    );
  });

  group('dividerColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits divider color',
      build: () => cubit,
      act: (cubit) => cubit.dividerColorChanged(color),
      verify: (cubit) => cubit.state.themeData.dividerColor == color,
    );
  });

  group('errorColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits error color',
      build: () => cubit,
      act: (cubit) => cubit.errorColorChanged(color),
      verify: (cubit) => cubit.state.themeData.errorColor == color,
    );
  });

  group('focusColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits focus color',
      build: () => cubit,
      act: (cubit) => cubit.focusColorChanged(color),
      verify: (cubit) => cubit.state.themeData.focusColor == color,
    );
  });

  group('highlightColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits highlight color',
      build: () => cubit,
      act: (cubit) => cubit.highlightColorChanged(color),
      verify: (cubit) => cubit.state.themeData.highlightColor == color,
    );
  });

  group('hintColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hint color',
      build: () => cubit,
      act: (cubit) => cubit.hintColorChanged(color),
      verify: (cubit) => cubit.state.themeData.hintColor == color,
    );
  });

  group('hoverColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hover color',
      build: () => cubit,
      act: (cubit) => cubit.hoverColorChanged(color),
      verify: (cubit) => cubit.state.themeData.hoverColor == color,
    );
  });

  group('indicatorColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits indicator color',
      build: () => cubit,
      act: (cubit) => cubit.indicatorColorChanged(color),
      verify: (cubit) => cubit.state.themeData.indicatorColor == color,
    );
  });

  group('scaffoldBgColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits scaffold background color',
      build: () => cubit,
      act: (cubit) => cubit.scaffoldBgColorChanged(color),
      verify: (cubit) => cubit.state.themeData.scaffoldBackgroundColor == color,
    );
  });

  group('secondaryHeaderolorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits secondary header color',
      build: () => cubit,
      act: (cubit) => cubit.secondaryHeaderColorChanged(color),
      verify: (cubit) => cubit.state.themeData.secondaryHeaderColor == color,
    );
  });

  group('selectedRowColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits selected row color',
      build: () => cubit,
      act: (cubit) => cubit.selectedRowColorChanged(color),
      verify: (cubit) => cubit.state.themeData.selectedRowColor == color,
    );
  });

  group('shadowColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits shadow row color',
      build: () => cubit,
      act: (cubit) => cubit.shadowColorChanged(color),
      verify: (cubit) => cubit.state.themeData.shadowColor == color,
    );
  });

  group('splashColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits splash row color',
      build: () => cubit,
      act: (cubit) => cubit.splashColorChanged(color),
      verify: (cubit) => cubit.state.themeData.splashColor == color,
    );
  });

  group('toggleableActiveColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits toggleable active color',
      build: () => cubit,
      act: (cubit) => cubit.toggleableActiveColorChanged(color),
      verify: (cubit) => cubit.state.themeData.toggleableActiveColor == color,
    );
  });

  group('unselectedWidgetColorChanged', () {
    final color = getRandomColor();
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits unselected widget color',
      build: () => cubit,
      act: (cubit) => cubit.unselectedWidgetColorChanged(color),
      verify: (cubit) => cubit.state.themeData.unselectedWidgetColor == color,
    );
  });
}
