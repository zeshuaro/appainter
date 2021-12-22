import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';

import '../../../mocks.dart';
import '../../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;
  late ThemeData themeData;
  late Color testColor;

  late Color fillDefaultColor;
  late Color fillSelectedColor;
  late Color fillDisabledColor;

  late Color overlayPressedColor;
  late Color overlayHoveredColor;
  late Color overlayFocusedColor;

  setUpAll(() {
    themeData = ThemeData();

    fillDefaultColor = themeData.unselectedWidgetColor;
    fillSelectedColor = themeData.toggleableActiveColor;
    fillDisabledColor = themeData.disabledColor;

    overlayPressedColor = fillSelectedColor.withAlpha(kRadialReactionAlpha);
    overlayHoveredColor = themeData.hoverColor;
    overlayFocusedColor = themeData.focusColor;
  });

  setUp(() {
    cubit = AdvancedThemeCubit(
      appBarThemeCubit: MockAppBarThemeCubit(),
      tabBarThemeCubit: MockTabBarThemeCubit(),
      bottomNavigationBarThemeCubit: MockBottomNavigationBarThemeCubit(),
      floatingActionButtonThemeCubit: MockFloatingActionButtonThemeCubit(),
      elevatedButtonThemeCubit: MockElevatedButtonThemeCubit(),
    );
    testColor = getRandomColor();
  });

  group('radio fill color', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit default color',
      build: () => cubit,
      act: (cubit) => cubit.radioFillDefaultColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: testColor,
          MaterialState.selected: fillSelectedColor,
          MaterialState.disabled: fillDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.fillColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit selected color',
      build: () => cubit,
      act: (cubit) => cubit.radioFillSelectedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: fillDefaultColor,
          MaterialState.selected: testColor,
          MaterialState.disabled: fillDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.fillColor!,
          props,
        );
      },
    );
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit disabled color',
      build: () => cubit,
      act: (cubit) => cubit.radioFillDisabledColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: fillDefaultColor,
          MaterialState.selected: fillSelectedColor,
          MaterialState.disabled: testColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.fillColor!,
          props,
        );
      },
    );
  });

  group('radio overlay color', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit pressed color',
      build: () => cubit,
      act: (cubit) => cubit.radioOverlayPressedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: testColor,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.overlayColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit hovered color',
      build: () => cubit,
      act: (cubit) => cubit.radioOverlayHoveredColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: testColor,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.overlayColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit focused color',
      build: () => cubit,
      act: (cubit) => cubit.radioOverlayFocusedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: testColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.radioTheme.overlayColor!,
          props,
        );
      },
    );
  });

  group('radio material tap target size', () {
    for (var size in MaterialTapTargetSize.values) {
      final theme = ThemeData(
        radioTheme: RadioThemeData(materialTapTargetSize: size),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit $size',
        build: () => cubit,
        act: (cubit) {
          cubit.radioMaterialTapTargetSize(UtilService.enumToString(size));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('radio splash radius', () {
    final value = Random().nextDouble();
    final theme = ThemeData(
      radioTheme: RadioThemeData(splashRadius: value),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit new value',
      build: () => cubit,
      act: (cubit) => cubit.radioSplashRadiusChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
