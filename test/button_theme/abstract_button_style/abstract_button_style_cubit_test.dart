import 'dart:math';

import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';
import 'mocks.dart';

void main() {
  const defaultElevation = 2.0;
  const buttonStyle = ButtonStyle();
  final colorScheme = ThemeData().colorScheme;

  late Color color;
  late double doubleNum;

  late ColorThemeCubit colorThemeCubit;
  late TestButtonStyleCubit sut;

  setUp(() {
    color = getRandomColor();
    doubleNum = Random().nextDouble();

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = TestButtonStyleCubit(colorThemeCubit: colorThemeCubit);
  });

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit style',
    build: () => sut,
    act: (cubit) => cubit.styleChanged(buttonStyle),
    expect: () => [const ButtonStyleState(style: buttonStyle)],
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit null style',
    build: () => sut,
    act: (cubit) => cubit.styleChanged(null),
    expect: () => [const ButtonStyleState(style: null)],
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit background default color',
    build: () => sut,
    act: (cubit) {
      cubit.backgroundDefaultColorChanged(color);
    },
    verify: (cubit) {
      final props = {
        null: color,
        MaterialState.disabled: colorScheme.onSurface.withOpacity(0.12),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.backgroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit background disabled color',
    build: () => sut,
    act: (cubit) => cubit.backgroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.primary,
        MaterialState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.backgroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit foreground default color',
    build: () => sut,
    act: (cubit) => cubit.foregroundDefaultColorChanged(color),
    verify: (cubit) {
      final props = {
        null: color,
        MaterialState.disabled: colorScheme.onSurface.withOpacity(0.38),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit foreground disabled color',
    build: () => sut,
    act: (cubit) => cubit.foregroundDisabledColorChanged(color),
    verify: (cubit) {
      final props = {
        null: colorScheme.onPrimary,
        MaterialState.disabled: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.foregroundColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit overlay hovered color',
    build: () => sut,
    act: (cubit) => cubit.overlayHoveredColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: color,
        MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
        MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit overlay focused color',
    build: () => sut,
    act: (cubit) => cubit.overlayFocusedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        MaterialState.focused: color,
        MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button overlay pressed color',
    build: () => sut,
    act: (cubit) => cubit.overlayPressedColorChanged(color),
    verify: (cubit) {
      final props = {
        MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
        MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
        MaterialState.pressed: color,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.overlayColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button shadow color',
    build: () => sut,
    act: (cubit) => cubit.shadowColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(
        cubit.state.style!.shadowColor!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit default elevation',
    build: () => sut,
    act: (cubit) => cubit.defaultElevationChanged(doubleNum.toString()),
    verify: (cubit) {
      final props = {
        null: doubleNum,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.elevation!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button disabled elevation',
    build: () => sut,
    act: (cubit) => cubit.disabledElevationChanged(doubleNum.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: doubleNum,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.elevation!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit hovered elevation',
    build: () => sut,
    act: (cubit) => cubit.hoveredElevationChanged(doubleNum.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: doubleNum,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.elevation!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit focused elevation',
    build: () => sut,
    act: (cubit) => cubit.focusedElevationChanged(doubleNum.toString()),
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: doubleNum,
        MaterialState.pressed: defaultElevation + 6,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.elevation!,
        props,
      );
    },
  );

  blocTest<TestButtonStyleCubit, ButtonStyleState>(
    'emit elevated button pressed elevation',
    build: () => sut,
    act: (cubit) {
      cubit.pressedElevationChanged(doubleNum.toString());
    },
    verify: (cubit) {
      final props = {
        null: defaultElevation,
        MaterialState.disabled: 0,
        MaterialState.hovered: defaultElevation + 2,
        MaterialState.focused: defaultElevation + 2,
        MaterialState.pressed: doubleNum,
      };

      verifyMaterialPropertyByMap(
        cubit.state.style!.elevation!,
        props,
      );
    },
  );
}
