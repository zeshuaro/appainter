import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  const defaultElevation = 2.0;
  final colorScheme = ThemeData().colorScheme;

  late ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late ElevatedButtonThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    elevatedButtonThemeCubit = ElevatedButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).elevatedButtonTheme;
    },
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [ElevatedButtonThemeState(theme: theme)],
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit background default color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.backgroundDefaultColorChanged(color),
    verify: (cubit) {
      final props = {
        null: color,
        MaterialState.disabled: colorScheme.onSurface.withOpacity(0.12),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.backgroundColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit background disabled color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.backgroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.primary,
        MaterialState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.backgroundColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit foreground default color',
    build: () => elevatedButtonThemeCubit,
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

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit foreground disabled color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.foregroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.onPrimary,
        MaterialState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit overlay hovered color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.overlayHoveredColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: color,
        MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
        MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit overlay focused color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.overlayFocusedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        MaterialState.focused: color,
        MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit elevated button overlay pressed color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.overlayPressedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
        MaterialState.pressed: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit elevated button shadow color',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.shadowColor!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit default elevation',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.defaultElevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {
        null: doubleValue,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.elevation!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit elevated button disabled elevation',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.disabledElevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: doubleValue,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.elevation!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit hovered elevation',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.hoveredElevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: doubleValue,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.elevation!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit focused elevation',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) => cubit.focusedElevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: doubleValue,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.elevation!,
        props,
      );
    },
  );

  blocTest<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
    'should emit elevated button pressed elevation',
    build: () => elevatedButtonThemeCubit,
    act: (cubit) {
      cubit.pressedElevationChanged(doubleValue.toString());
    },
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: doubleValue,
      };

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.elevation!,
        props,
      );
    },
  );
}
