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
    );
  });

  group('textButtonBackgroundColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button background color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonBackgroundColorChanged(color);
      },
      verify: (cubit) {
        final props = {null: color};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.backgroundColor!,
          props,
        );
      },
    );
  });

  group('textButtonForegroundDefaultColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button foreground default color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonForegroundDefaultColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: color,
          MaterialState.disabled: colorScheme.onSurface.withOpacity(0.38),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('textButtonForegroundDisabledColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button foreground disabled color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonForegroundDisabledColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          null: colorScheme.primary,
          MaterialState.disabled: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.foregroundColor!,
          props,
        );
      },
    );
  });

  group('textButtonOverlayHoveredColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button overlay hovered color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonOverlayHoveredColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: color,
          MaterialState.focused: colorScheme.primary.withOpacity(0.12),
          MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('textButtonOverlayFocusedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button overlay focused color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonOverlayFocusedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
          MaterialState.focused: color,
          MaterialState.pressed: colorScheme.primary.withOpacity(0.12),
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('textButtonOverlayPressedColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button overlay pressed color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonOverlayPressedColorChanged(color);
      },
      verify: (cubit) {
        final props = {
          MaterialState.hovered: colorScheme.primary.withOpacity(0.04),
          MaterialState.focused: colorScheme.primary.withOpacity(0.12),
          MaterialState.pressed: color,
        };

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.overlayColor!,
          props,
        );
      },
    );
  });

  group('textButtonShadowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button shadow color',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonShadowColorChanged(color);
      },
      verify: (cubit) {
        final props = {null: color};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.shadowColor!,
          props,
        );
      },
    );
  });

  group('textButtonElevationChanged', () {
    final value = Random().nextDouble();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit text button elevation',
      build: () => cubit,
      act: (cubit) {
        cubit.textButtonElevationChanged(value.toString());
      },
      verify: (cubit) {
        final props = {null: value};

        verifyMaterialPropertyByMap(
          cubit.state.themeData.textButtonTheme.style!.elevation!,
          props,
        );
      },
    );
  });
}
