import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../utils.dart';

void main() {
  late SwitchThemeCubit cubit;
  late SwitchThemeData theme;
  late Color color;
  late double doubleValue;

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
    final themeData = ThemeData();

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
    cubit = SwitchThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<SwitchThemeCubit, SwitchThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).switchTheme;
    },
    build: () => cubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [SwitchThemeState(theme: theme)],
  );

  group('test thumb colors', () {
    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit default color',
      build: () => cubit,
      act: (cubit) => cubit.thumbDefaultColorChanged(color),
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.selected: thumbSelectedColor,
          MaterialState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit selected color',
      build: () => cubit,
      act: (cubit) => cubit.thumbSelectedColorChanged(color),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          MaterialState.selected: color,
          MaterialState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit disabled color',
      build: () => cubit,
      act: (cubit) => cubit.thumbDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          MaterialState.selected: thumbSelectedColor,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );
  });

  group('test track colors', () {
    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit default color',
      build: () => cubit,
      act: (cubit) => cubit.trackDefaultColorChanged(color),
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.selected: trackSelectedColor,
          MaterialState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.trackColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit selected color',
      build: () => cubit,
      act: (cubit) => cubit.trackSelectedColorChanged(color),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          MaterialState.selected: color,
          MaterialState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.theme.trackColor!,
          props,
        );
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit disabled color',
      build: () => cubit,
      act: (cubit) => cubit.trackDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          MaterialState.selected: trackSelectedColor,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.theme.trackColor!,
          props,
        );
      },
    );
  });

  group('test material tap target size', () {
    for (var size in MaterialTapTargetSize.values) {
      blocTest<SwitchThemeCubit, SwitchThemeState>(
        'should emit $size',
        build: () => cubit,
        act: (cubit) {
          cubit.materialTapTargetSize(UtilService.enumToString(size));
        },
        expect: () => [
          SwitchThemeState(theme: SwitchThemeData(materialTapTargetSize: size)),
        ],
      );
    }
  });

  group('test overlay colors', () {
    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit pressed color',
      build: () => cubit,
      act: (cubit) => cubit.overlayPressedColorChanged(color),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: color,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit hovered color',
      build: () => cubit,
      act: (cubit) => cubit.overlayHoveredColorChanged(color),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: color,
          MaterialState.focused: overlayFocusedColor
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit focused color',
      build: () => cubit,
      act: (cubit) => cubit.overlayFocusedColorChanged(color),
      verify: (cubit) {
        final props = {
          MaterialState.pressed: overlayPressedColor,
          MaterialState.hovered: overlayHoveredColor,
          MaterialState.focused: color,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.overlayColor!, props);
      },
    );
  });

  blocTest<SwitchThemeCubit, SwitchThemeState>(
    'should emit splash radius',
    build: () => cubit,
    act: (cubit) => cubit.splashRadiusChanged(doubleValue.toString()),
    expect: () => [
      SwitchThemeState(theme: SwitchThemeData(splashRadius: doubleValue)),
    ],
  );
}
