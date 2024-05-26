import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late ColorThemeCubit colorThemeCubit;
  late ThemeData theme;
  late ColorScheme colorScheme;
  late Color color;
  late Color onColor;
  late Map<int, Color> swatch;

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
    expect: () => [
      ColorThemeState(
        colorScheme: theme.colorScheme,
        primaryColor: theme.primaryColor,
        primaryColorLight: theme.primaryColorLight,
        primaryColorDark: theme.primaryColorDark,
        canvasColor: theme.canvasColor,
        cardColor: theme.cardColor,
        dialogBackgroundColor: theme.dialogBackgroundColor,
        disabledColor: theme.disabledColor,
        dividerColor: theme.dividerColor,
        focusColor: theme.focusColor,
        highlightColor: theme.highlightColor,
        hintColor: theme.hintColor,
        hoverColor: theme.hoverColor,
        indicatorColor: theme.indicatorColor,
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        secondaryHeaderColor: theme.secondaryHeaderColor,
        shadowColor: theme.shadowColor,
        splashColor: theme.splashColor,
        unselectedWidgetColor: theme.unselectedWidgetColor,
      ),
    ],
  );

  group('test primary color', () {
    for (var isDark in [true, false]) {
      blocTest<ColorThemeCubit, ColorThemeState>(
        'should emit primary color with isDark=$isDark',
        setUp: () {
          swatch = UtilService.getColorSwatch(color);
          colorScheme =
              isDark ? const ColorScheme.dark() : const ColorScheme.light();
          onColor = isDark ? Colors.white : Colors.black;
        },
        build: () => colorThemeCubit,
        act: (cubit) => cubit.primaryColorChanged(color, isDark),
        expect: () {
          return [
            ColorThemeState(
              colorScheme: colorScheme.copyWith(
                primary: color,
                onPrimary: onColor,
                secondary: color,
                onSecondary: onColor,
                surface: swatch[200],
              ),
              primaryColor: color,
              primaryColorLight: swatch[100],
              primaryColorDark: swatch[700],
              indicatorColor: color,
              secondaryHeaderColor: swatch[50],
            ),
          ];
        },
      );
    }
  });

  group('test secondary color', () {
    for (var isDark in [true, false]) {
      blocTest<ColorThemeCubit, ColorThemeState>(
        'should emit secondary color with isDark=$isDark',
        setUp: () {
          onColor = isDark ? Colors.white : Colors.black;
        },
        build: () => colorThemeCubit,
        act: (cubit) => cubit.secondaryColorChanged(color, isDark),
        expect: () {
          return [
            ColorThemeState(
              colorScheme: colorThemeCubit.state.colorScheme.copyWith(
                secondary: color,
                onSecondary: onColor,
              ),
            ),
          ];
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
    'emit surface color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.surfaceColorChanged(color),
    expect: () => [
      ColorThemeState(
        colorScheme: colorThemeCubit.state.colorScheme.copyWith(
          surface: color,
        ),
      ),
    ],
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
    expect: () => [
      ColorThemeState(
        colorScheme: colorThemeCubit.state.colorScheme.copyWith(
          error: color,
        ),
      ),
    ],
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
    'should emit unselected widget color',
    build: () => colorThemeCubit,
    act: (cubit) => cubit.unselectedWidgetColorChanged(color),
    expect: () => [ColorThemeState(unselectedWidgetColor: color)],
  );
}
