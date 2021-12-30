import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../brightness.dart';
import '../utils.dart';

void main() {
  late ColorThemeCubit colorThemeCubit;
  late ThemeData theme;
  late Color color;
  late Color backgroundColor;
  late Map<int, Color> swatch;
  late Brightness brightness;

  setUp(() {
    colorThemeCubit = ColorThemeCubit();
    color = getRandomColor();
  });

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme);
    },
    build: () => colorThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [ColorThemeState.fromTheme(theme)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit primary color',
    setUp: () {
      swatch = UtilService.getColorSwatch(color);
      backgroundColor = swatch[200]!;
      brightness = ThemeData.estimateBrightnessForColor(color);
    },
    build: () => colorThemeCubit,
    act: (cubit) => cubit.primaryColorChanged(color),
    expect: () {
      return [
        ColorThemeState(
          primaryColor: color,
          primaryColorBrightness: brightness,
          primaryColorLight: swatch[100],
          primaryColorDark: swatch[700],
          backgroundColor: backgroundColor,
          indicatorColor: color,
          secondaryHeaderColor: swatch[50],
          toggleableActiveColor: swatch[600],
        )
      ];
    },
  );

  group('test primary color brightness', () {
    for (var test in BrightnessTest.testCases) {
      blocTest<ColorThemeCubit, ColorThemeState>(
        'should emit ${test.brightness}',
        build: () => colorThemeCubit,
        act: (cubit) => cubit.primaryColorBrightnessChanged(test.isDark),
        expect: () {
          return [ColorThemeState(primaryColorBrightness: test.brightness)];
        },
      );
    }
  });

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit primary color light',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.primaryColorLightChanged(color),
    expect: () => [ColorThemeState(primaryColorLight: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit primary color dark',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.primaryColorDarkChanged(color),
    expect: () => [ColorThemeState(primaryColorDark: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit background color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    expect: () => [ColorThemeState(backgroundColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit bottom app bar color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.bottomAppBarColorChanged(color),
    expect: () => [ColorThemeState(bottomAppBarColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit canvas color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.canvasColorChanged(color),
    expect: () => [ColorThemeState(canvasColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit card color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.cardColorChanged(color),
    expect: () => [ColorThemeState(cardColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit dialog background color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.dialogBackgroundColorChanged(color),
    expect: () => [ColorThemeState(dialogBackgroundColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit disabled color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.disabledColorChanged(color),
    expect: () => [ColorThemeState(disabledColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit divider color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.dividerColorChanged(color),
    expect: () => [ColorThemeState(dividerColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit error color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.errorColorChanged(color),
    expect: () => [ColorThemeState(errorColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit focus color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.focusColorChanged(color),
    expect: () => [ColorThemeState(focusColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit highlight color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.highlightColorChanged(color),
    expect: () => [ColorThemeState(highlightColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit hint color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.hintColorChanged(color),
    expect: () => [ColorThemeState(hintColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit hover color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.hoverColorChanged(color),
    expect: () => [ColorThemeState(hoverColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit indicator color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.indicatorColorChanged(color),
    expect: () => [ColorThemeState(indicatorColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit scaffold background color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.scaffoldBackgroundColorChanged(color),
    expect: () => [ColorThemeState(scaffoldBackgroundColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit secondary header color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.secondaryHeaderColorChanged(color),
    expect: () => [ColorThemeState(secondaryHeaderColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit selected row color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.selectedRowColorChanged(color),
    expect: () => [ColorThemeState(selectedRowColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit shadow color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    expect: () => [ColorThemeState(shadowColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit splash color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.splashColorChanged(color),
    expect: () => [ColorThemeState(splashColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit toggleable active color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.toggleableActiveColorChanged(color),
    expect: () => [ColorThemeState(toggleableActiveColor: color)],
  );

  blocTest<ColorThemeCubit, ColorThemeState>(
    'should emit unselected widget color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.unselectedWidgetColorChanged(color),
    expect: () => [ColorThemeState(unselectedWidgetColor: color)],
  );
}
