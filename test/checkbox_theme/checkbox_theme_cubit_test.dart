import 'dart:math';

import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  late CheckboxThemeCubit checkboxThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late CheckboxThemeData theme;
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
    fillSelectedColor = themeData.colorScheme.secondary;
    fillDisabledColor = themeData.disabledColor;

    overlayPressedColor = fillSelectedColor.withAlpha(kRadialReactionAlpha);
    overlayHoveredColor = themeData.hoverColor;
    overlayFocusedColor = themeData.focusColor;
  });

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    checkboxThemeCubit = CheckboxThemeCubit(colorThemeCubit: colorThemeCubit);
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<CheckboxThemeCubit, CheckboxThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).checkboxTheme;
    },
    build: () => checkboxThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [CheckboxThemeState(theme: theme)],
  );

  group('test fill colors', () {
    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit default color',
      build: () => checkboxThemeCubit,
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

    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit selected color',
      build: () => checkboxThemeCubit,
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
    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit disabled color',
      build: () => checkboxThemeCubit,
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

  blocTest<CheckboxThemeCubit, CheckboxThemeState>(
    'should emit check color',
    build: () => checkboxThemeCubit,
    act: (cubit) => cubit.checkColorChanged(color),
    verify: (cubit) {
      final props = {null: color};

      verifyMaterialPropertyByMap(cubit.state.theme.checkColor!, props);
    },
  );

  group('test overlay colors', () {
    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit pressed color',
      build: () => checkboxThemeCubit,
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

    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit hovered color',
      build: () => checkboxThemeCubit,
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

    blocTest<CheckboxThemeCubit, CheckboxThemeState>(
      'should emit focused color',
      build: () => checkboxThemeCubit,
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
      blocTest<CheckboxThemeCubit, CheckboxThemeState>(
        'should emit $size',
        build: () => checkboxThemeCubit,
        act: (cubit) {
          cubit.materialTapTargetSize(UtilService.enumToString(size));
        },
        expect: () => [
          CheckboxThemeState.withTheme(materialTapTargetSize: size),
        ],
      );
    }
  });

  blocTest<CheckboxThemeCubit, CheckboxThemeState>(
    'should emit splash radius',
    build: () => checkboxThemeCubit,
    act: (cubit) => cubit.splashRadiusChanged(doubleValue.toString()),
    expect: () => [CheckboxThemeState.withTheme(splashRadius: doubleValue)],
  );
}
