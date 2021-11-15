import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../../utils.dart';

void main() {
  const defaultElevation = 2.0;
  final colorScheme = ThemeData().colorScheme;
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('elevatedButtonBackgroundDefaultColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button background default color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonBackgroundDefaultColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.disabled: colorScheme.onSurface.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.backgroundColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonBackgroundDisabledColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button background disabled color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonBackgroundDisabledColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: colorScheme.primary,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.backgroundColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonForegroundDefaultColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button foreground default color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonForegroundDefaultColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.disabled: colorScheme.onSurface.withOpacity(0.38),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonForegroundDisabledColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button foreground disabled color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonForegroundDisabledColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: colorScheme.onPrimary,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonOverlayHoveredColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button overlay hovered color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonOverlayHoveredColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: color,
          MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
          MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonOverlayFocusedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button overlay focused color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonOverlayFocusedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
          MaterialState.focused: color,
          MaterialState.pressed: colorScheme.onPrimary.withOpacity(0.24),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonOverlayPressedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button overlay pressed color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonOverlayPressedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.onPrimary.withOpacity(0.08),
          MaterialState.focused: colorScheme.onPrimary.withOpacity(0.24),
          MaterialState.pressed: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonShadowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button shadow color',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonShadowColorChanged(color);
      },
      verify: (cubit) {
        final props = {null: color};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.shadowColor!,
          props,
        );
      },
    );
  });

  group('elevatedButtonDefaultElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button default elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonDefaultElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {
          null: value,
          MaterialState.disabled: 0,
          MaterialState.hovered: defaultElevation + 2,
          MaterialState.focused: defaultElevation + 2,
          MaterialState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });

  group('elevatedButtonDisabledElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button disabled elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonDisabledElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          MaterialState.disabled: value,
          MaterialState.hovered: defaultElevation + 2,
          MaterialState.focused: defaultElevation + 2,
          MaterialState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });

  group('elevatedButtonHoveredElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button hovered elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonHoveredElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          MaterialState.disabled: 0,
          MaterialState.hovered: value,
          MaterialState.focused: defaultElevation + 2,
          MaterialState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });

  group('elevatedButtonFocusedElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button focused elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonFocusedElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          MaterialState.disabled: 0,
          MaterialState.hovered: defaultElevation + 2,
          MaterialState.focused: value,
          MaterialState.pressed: defaultElevation + 6,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });

  group('elevatedButtonPressedElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit elevated button pressed elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.elevatedButtonPressedElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {
          null: defaultElevation,
          MaterialState.disabled: 0,
          MaterialState.hovered: defaultElevation + 2,
          MaterialState.focused: defaultElevation + 2,
          MaterialState.pressed: value,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });
}
