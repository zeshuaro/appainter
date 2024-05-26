import 'dart:math';

import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';

void main() {
  const defaultElevation = 2.0;
  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
  );
  final colorScheme = ThemeData().colorScheme;

  late Color color;
  late double doubleNum;

  late ColorThemeCubit colorThemeCubit;
  late ElevatedButtonThemeCubit sut;

  setUp(() {
    color = getRandomColor();
    doubleNum = Random().nextDouble();

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = ElevatedButtonThemeCubit(colorThemeCubit: colorThemeCubit);
  });

  test('default shape', () {
    final actual = sut.defaultShape;
    expect(actual, equals(shape));
  });

  test('get default style', () {
    final actual = sut.getDefaultStyle(colorScheme);
    final expected = ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 2,
      minimumSize: const Size(64, 36),
      shape: shape,
    );

    verifyMaterialProperty(actual.backgroundColor!, expected.backgroundColor!);
    verifyMaterialProperty(actual.foregroundColor!, expected.foregroundColor!);
    verifyMaterialProperty(actual.overlayColor!, expected.overlayColor!);
    verifyMaterialProperty(actual.shadowColor!, expected.shadowColor!);
    verifyMaterialProperty(actual.elevation!, expected.elevation!);
    verifyMaterialProperty(actual.shape!, expected.shape!);
  });

  group('background colors', () {
    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit default',
      build: () => sut,
      act: (cubit) {
        cubit.backgroundDefaultColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: color,
          WidgetState.disabled: colorScheme.onSurface.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.backgroundColor!,
          props,
        );
      },
    );

    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit disabled',
      build: () => sut,
      act: (cubit) => cubit.backgroundDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: colorScheme.primary,
          WidgetState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.backgroundColor!,
          props,
        );
      },
    );
  });

  group('elevations', () {
    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit default',
      build: () => sut,
      act: (cubit) => cubit.defaultElevationChanged(doubleNum.toString()),
      verify: (cubit) {
        final props = {
          null: doubleNum,
          WidgetState.disabled: 0,
          WidgetState.hovered: defaultElevation + 2,
          WidgetState.focused: defaultElevation + 2,
          WidgetState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.elevation!,
          props,
        );
      },
    );

    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit disabled',
      build: () => sut,
      act: (cubit) => cubit.disabledElevationChanged(doubleNum.toString()),
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          WidgetState.disabled: doubleNum,
          WidgetState.hovered: defaultElevation + 2,
          WidgetState.focused: defaultElevation + 2,
          WidgetState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.elevation!,
          props,
        );
      },
    );

    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit hovered',
      build: () => sut,
      act: (cubit) => cubit.hoveredElevationChanged(doubleNum.toString()),
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          WidgetState.disabled: 0,
          WidgetState.hovered: doubleNum,
          WidgetState.focused: defaultElevation + 2,
          WidgetState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.elevation!,
          props,
        );
      },
    );

    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit focused',
      build: () => sut,
      act: (cubit) => cubit.focusedElevationChanged(doubleNum.toString()),
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          WidgetState.disabled: 0,
          WidgetState.hovered: defaultElevation + 2,
          WidgetState.focused: doubleNum,
          WidgetState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.elevation!,
          props,
        );
      },
    );

    blocTest<ElevatedButtonThemeCubit, ButtonStyleState>(
      'emit pressed',
      build: () => sut,
      act: (cubit) {
        cubit.pressedElevationChanged(doubleNum.toString());
      },
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          WidgetState.disabled: 0,
          WidgetState.hovered: defaultElevation + 2,
          WidgetState.focused: defaultElevation + 2,
          WidgetState.pressed: doubleNum,
        };

        verifyMaterialPropertyByMap(
          cubit.state.style!.elevation!,
          props,
        );
      },
    );
  });
}
