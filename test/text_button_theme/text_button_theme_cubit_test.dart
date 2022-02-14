import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  final colorScheme = ThemeData().colorScheme;

  late TextButtonThemeCubit textButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late TextButtonThemeData theme;
  late Color color;
  late double doubleValue;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    textButtonThemeCubit = TextButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<TextButtonThemeCubit, TextButtonThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).textButtonTheme;
    },
    build: () => textButtonThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [TextButtonThemeState(theme: theme)],
  );

  blocTest<TextButtonThemeCubit, TextButtonThemeState>(
    'should emit background color',
    build: () => textButtonThemeCubit,
    act: (cubit) => cubit.backgroundColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(
        cubit.state.theme.style!.backgroundColor!,
        props,
      );
    },
  );

  group('test foreground colors', () {
    blocTest<TextButtonThemeCubit, TextButtonThemeState>(
      'should emit default color',
      build: () => textButtonThemeCubit,
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

    blocTest<TextButtonThemeCubit, TextButtonThemeState>(
      'should emit disabled color',
      build: () => textButtonThemeCubit,
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
  });

  group('test overlay colors', () {
    blocTest<TextButtonThemeCubit, TextButtonThemeState>(
      'should emit hovered color',
      build: () => textButtonThemeCubit,
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

    blocTest<TextButtonThemeCubit, TextButtonThemeState>(
      'should emit focused color',
      build: () => textButtonThemeCubit,
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

    blocTest<TextButtonThemeCubit, TextButtonThemeState>(
      'should emit pressed color',
      build: () => textButtonThemeCubit,
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
  });

  blocTest<TextButtonThemeCubit, TextButtonThemeState>(
    'should emit shadow color',
    build: () => textButtonThemeCubit,
    act: (cubit) => cubit.shadowColorChanged(color),
    verify: (cubit) {
      final props = {null: color};
      verifyMaterialPropertyByMap(cubit.state.theme.style!.shadowColor!, props);
    },
  );

  blocTest<TextButtonThemeCubit, TextButtonThemeState>(
    'should emit elevation',
    build: () => textButtonThemeCubit,
    act: (cubit) => cubit.elevationChanged(doubleValue.toString()),
    verify: (cubit) {
      final props = {null: doubleValue};
      verifyMaterialPropertyByMap(cubit.state.theme.style!.elevation!, props);
    },
  );
}
