import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

import '../mocks.dart';
import '../utils.dart';

void main() {
  late SwitchThemeCubit switchThemeCubit;
  late ColorThemeCubit colorThemeCubit;
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
    thumbSelectedColor = themeData.primaryColor;
    thumbDisabledColor = Colors.grey.shade400;

    trackDefaultColor = const Color(0x52000000);
    trackSelectedColor = thumbSelectedColor.withAlpha(0x80);
    trackDisabledColor = Colors.black12;

    overlayPressedColor = thumbSelectedColor.withAlpha(kRadialReactionAlpha);
    overlayHoveredColor = themeData.hoverColor;
    overlayFocusedColor = themeData.focusColor;
  });

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    switchThemeCubit = SwitchThemeCubit(colorThemeCubit: colorThemeCubit);
    color = getRandomColor();
    doubleValue = Random().nextDouble();
  });

  blocTest<SwitchThemeCubit, SwitchThemeState>(
    'should emit theme',
    setUp: () {
      final colorScheme = randomColorSchemeLight(shouldPrint: false);
      theme = ThemeData.from(colorScheme: colorScheme).switchTheme;
    },
    build: () => switchThemeCubit,
    act: (cubit) => cubit.themeChanged(theme),
    expect: () => [SwitchThemeState(theme: theme)],
  );

  group('test thumb colors', () {
    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit default color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.thumbDefaultColorChanged(color),
      verify: (cubit) {
        final props = {
          null: color,
          WidgetState.selected: thumbSelectedColor,
          WidgetState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit selected color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.thumbSelectedColorChanged(color),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          WidgetState.selected: color,
          WidgetState.disabled: thumbDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit disabled color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.thumbDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: thumbDefaultColor,
          WidgetState.selected: thumbSelectedColor,
          WidgetState.disabled: color,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.thumbColor!, props);
      },
    );
  });

  group('test track colors', () {
    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit default color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.trackDefaultColorChanged(color),
      verify: (cubit) {
        final props = {
          null: color,
          WidgetState.selected: trackSelectedColor,
          WidgetState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(cubit.state.theme.trackColor!, props);
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit selected color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.trackSelectedColorChanged(color),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          WidgetState.selected: color,
          WidgetState.disabled: trackDisabledColor,
        };

        verifyMaterialPropertyByMap(
          cubit.state.theme.trackColor!,
          props,
        );
      },
    );

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit disabled color',
      build: () => switchThemeCubit,
      act: (cubit) => cubit.trackDisabledColorChanged(color),
      verify: (cubit) {
        final props = {
          null: trackDefaultColor,
          WidgetState.selected: trackSelectedColor,
          WidgetState.disabled: color,
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
        build: () => switchThemeCubit,
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
      build: () => switchThemeCubit,
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

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit hovered color',
      build: () => switchThemeCubit,
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

    blocTest<SwitchThemeCubit, SwitchThemeState>(
      'should emit focused color',
      build: () => switchThemeCubit,
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

  blocTest<SwitchThemeCubit, SwitchThemeState>(
    'should emit splash radius',
    build: () => switchThemeCubit,
    act: (cubit) => cubit.splashRadiusChanged(doubleValue.toString()),
    expect: () => [
      SwitchThemeState(theme: SwitchThemeData(splashRadius: doubleValue)),
    ],
  );
}
