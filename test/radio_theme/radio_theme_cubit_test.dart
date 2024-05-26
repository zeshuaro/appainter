import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  late RadioThemeCubit radioThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late RadioThemeData theme;
  late Color color;
  late double doubleValue;

  late Color fillDefaultColor;
  late Color fillSelectedColor;
  late Color fillDisabledColor;

  late Color overlayPressedColor;
  late Color overlayHoveredColor;
  late Color overlayFocusedColor;

  setUpAll(() {
    final themeData = ThemeData();

    fillDefaultColor = themeData.unselectedWidgetColor;
    fillSelectedColor = themeData.primaryColor;
    fillDisabledColor = themeData.disabledColor;

    overlayPressedColor = fillSelectedColor.withAlpha(kRadialReactionAlpha);
    overlayHoveredColor = themeData.hoverColor;
    overlayFocusedColor = themeData.focusColor;
  });

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    radioThemeCubit = RadioThemeCubit(colorThemeCubit: colorThemeCubit);
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<RadioThemeCubit, RadioThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).radioTheme;
    },
    build: () => radioThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [RadioThemeState(theme: theme)],
  );

  group('test fill colors', () {
    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit default color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.fillDefaultColorChanged(color),
      verify: (cubit) {
        final props = {
          null: color,
          WidgetState.selected: fillSelectedColor,
          WidgetState.disabled: fillDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.fillColor!, props);
      },
    );

    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit selected color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.fillSelectedColorChanged(color),
      verify: (cubit) {
        final props = {
          null: fillDefaultColor,
          WidgetState.selected: color,
          WidgetState.disabled: fillDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.fillColor!, props);
      },
    );
    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit disabled color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.fillDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: fillDefaultColor,
          WidgetState.selected: fillSelectedColor,
          WidgetState.disabled: color,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.fillColor!, props);
      },
    );
  });

  group('test overlay colors', () {
    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit pressed color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.overlayPressedColorChanged(color),
      verify: (cubit) {
        final props = {
          WidgetState.pressed: color,
          WidgetState.hovered: overlayHoveredColor,
          WidgetState.focused: overlayFocusedColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );

    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit hovered color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.overlayHoveredColorChanged(color),
      verify: (cubit) {
        final props = {
          WidgetState.pressed: overlayPressedColor,
          WidgetState.hovered: color,
          WidgetState.focused: overlayFocusedColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );

    blocTest<RadioThemeCubit, RadioThemeState>(
      'should emit focused color',
      build: () => radioThemeCubit,
      act: (cubit) => cubit.overlayFocusedColorChanged(color),
      verify: (cubit) {
        final props = {
          WidgetState.pressed: overlayPressedColor,
          WidgetState.hovered: overlayHoveredColor,
          WidgetState.focused: color,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );
  });

  group('test material tap target size', () {
    for (var size in MaterialTapTargetSize.values) {
      blocTest<RadioThemeCubit, RadioThemeState>(
        'should emit $size',
        build: () => radioThemeCubit,
        act: (cubit) {
          cubit.materialTapTargetSize(UtilService.enumToString(size));
        },
        expect: () => [
          RadioThemeState(theme: RadioThemeData(materialTapTargetSize: size)),
        ],
      );
    }
  });

  blocTest<RadioThemeCubit, RadioThemeState>(
    'should emit splash radius',
    build: () => radioThemeCubit,
    act: (cubit) => cubit.splashRadiusChanged(doubleValue.toString()),
    expect: () => [
      RadioThemeState(theme: RadioThemeData(splashRadius: doubleValue)),
    ],
  );
}
