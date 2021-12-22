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

  late Color thumbDefaultColor;
  late Color thumbSelectedColor;
  late Color thumbDisabledColor;

  late Color trackDefaultColor;
  late Color trackSelectedColor;
  late Color trackDisabledColor;

  late Color overlayPressedColor;
  late Color overlayHoveredColor;
  late Color overlayFocusedColor;

  setUpAll(() {
    themeData = ThemeData();

    thumbDefaultColor = Colors.grey.shade50;
    thumbSelectedColor = themeData.toggleableActiveColor;
    thumbDisabledColor = Colors.grey.shade400;

    trackDefaultColor = const Color(0x52000000);
    trackSelectedColor = thumbSelectedColor.withAlpha(0x80);
    trackDisabledColor = Colors.black12;

    overlayPressedColor = thumbSelectedColor.withAlpha(kRadialReactionAlpha);
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

  group('switch thumb color', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit default color',
      build: () => cubit,
      act: (cubit) => cubit.switchThumbDefaultColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: testColor,
          MaterialState.selected: thumbSelectedColor,
          MaterialState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.thumbColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit selected color',
      build: () => cubit,
      act: (cubit) => cubit.switchThumbSelectedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          MaterialState.selected: testColor,
          MaterialState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.thumbColor!,
          props,
        );
      },
    );
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit disabled color',
      build: () => cubit,
      act: (cubit) => cubit.switchThumbDisabledColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          MaterialState.selected: thumbSelectedColor,
          MaterialState.disabled: testColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.thumbColor!,
          props,
        );
      },
    );
  });

  group('switch track color', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit default color',
      build: () => cubit,
      act: (cubit) => cubit.switchTrackDefaultColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: testColor,
          MaterialState.selected: trackSelectedColor,
          MaterialState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.trackColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit selected color',
      build: () => cubit,
      act: (cubit) => cubit.switchTrackSelectedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          MaterialState.selected: testColor,
          MaterialState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.trackColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit disabled color',
      build: () => cubit,
      act: (cubit) => cubit.switchTrackDisabledColorChanged(testColor),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          MaterialState.selected: trackSelectedColor,
          MaterialState.disabled: testColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.trackColor!,
          props,
        );
      },
    );
  });

  group('switch material tap target size', () {
    for (var size in MaterialTapTargetSize.values) {
      final theme = ThemeData(
        switchTheme: SwitchThemeData(materialTapTargetSize: size),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit $size',
        build: () => cubit,
        act: (cubit) {
          cubit.switchMaterialTapTargetSize(UtilService.enumToString(size));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('switch overlay color', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit pressed color',
      build: () => cubit,
      act: (cubit) => cubit.switchOverlayPressedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: testColor,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.overlayColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit hovered color',
      build: () => cubit,
      act: (cubit) => cubit.switchOverlayHoveredColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: testColor,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.overlayColor!,
          props,
        );
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit focused color',
      build: () => cubit,
      act: (cubit) => cubit.switchOverlayFocusedColorChanged(testColor),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: testColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.switchTheme.overlayColor!,
          props,
        );
      },
    );
  });

  group('switch splash radius', () {
    final value = Random().nextDouble();
    final theme = ThemeData(switchTheme: SwitchThemeData(splashRadius: value));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit new value',
      build: () => cubit,
      act: (cubit) => cubit.switchSplashRadiusChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
