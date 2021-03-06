import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  final colorScheme = ThemeData().colorScheme;

  late OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late OutlinedButtonThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    outlinedButtonThemeCubit = OutlinedButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).outlinedButtonTheme;
    },
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [OutlinedButtonThemeState(theme: theme)],
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit background color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.backgroundColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit foreground default color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.foregroundDefaultColorChanged(color),
    verify: (cubit) {
      final props = {
        null: color,
        MaterialState.disabled: colorScheme.onSurface.withOpacity(0.38),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit foreground disabled color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.foregroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.primary,
        MaterialState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit overlay hovered color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.overlayHoveredColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: color,
        MaterialState.focused: colorScheme.primary.withOpacity(0.12),
        MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit overlay focused color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.overlayFocusedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
        MaterialState.focused: color,
        MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit overlay pressed color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.overlayPressedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
        MaterialState.focused: colorScheme.primary.withOpacity(0.12),
        MaterialState.pressed: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit shadow color',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    verify: (cubit) {
      final props = {null: color};
      verifyMaterialPropertyByMap(cubit.state.theme.style!.shadowColor!, props);
    },
  );

  blocTest<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
    'should emit elevation',
    build: () => outlinedButtonThemeCubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {null: doubleValue};
      verifyMaterialPropertyByMap(cubit.state.theme.style!.elevation!, props);
    },
  );
}
