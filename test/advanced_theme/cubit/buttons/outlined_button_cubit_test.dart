import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../../mocks.dart';
import '../../../utils.dart';

void main() {
  final colorScheme = ThemeData().colorScheme;
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(
      appBarThemeCubit: MockAppBarThemeCubit(),
      tabBarThemeCubit: MockTabBarThemeCubit(),
      bottomNavigationBarThemeCubit: MockBottomNavigationBarThemeCubit(),
      floatingActionButtonThemeCubit: MockFloatingActionButtonThemeCubit(),
      elevatedButtonThemeCubit: MockElevatedButtonThemeCubit(),
    );
  });

  group('outlinedButtonBackgroundColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button background color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonBackgroundColorChanged(color);
      },
      verify: (cubit) {
        final props = {null: color};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.backgroundColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonForegroundDefaultColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button foreground default color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonForegroundDefaultColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.disabled: colorScheme.onSurface.withOpacity(0.38),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonForegroundDisabledColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button foreground disabled color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonForegroundDisabledColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: colorScheme.primary,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonOverlayHoveredColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button overlay hovered color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonOverlayHoveredColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: color,
          MaterialState.focused: colorScheme.primary.withOpacity(0.12),
          MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonOverlayFocusedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button overlay focused color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonOverlayFocusedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
          MaterialState.focused: color,
          MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonOverlayPressedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button overlay pressed color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonOverlayPressedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
          MaterialState.focused: colorScheme.primary.withOpacity(0.12),
          MaterialState.pressed: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonShadowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button shadow color',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonShadowColorChanged(color);
      },
      verify: (cubit) {
        final props = {null: color};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.shadowColor!,
          props,
        );
      },
    );
  });

  group('outlinedButtonElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit outlined button elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.outlinedButtonElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {null: value};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.outlinedButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });
}
