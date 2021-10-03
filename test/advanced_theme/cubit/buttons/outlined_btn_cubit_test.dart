import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('outlinedBtnBgColorChanged', () {
    final color = getRandomColor();
    final style = OutlinedButton.styleFrom(backgroundColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button background color',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnBgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.backgroundColor!,
          style.backgroundColor!,
        );
      },
    );
  });

  group('outlinedBtnFgColorChanged', () {
    final color = getRandomColor();
    final style = OutlinedButton.styleFrom(
      primary: color,
      onSurface: const ColorScheme.light().onSurface,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button foreground color',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnFgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.foregroundColor!,
          style.foregroundColor!,
        );
      },
    );
  });

  group('outlinedBtnOverlayColorChanged', () {
    final color = getRandomColor();
    final style = OutlinedButton.styleFrom(primary: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button overlay color',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnOverlayColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.overlayColor!,
          style.overlayColor!,
        );
      },
    );
  });

  group('outlinedBtnShadowColorChanged', () {
    final color = getRandomColor();
    final style = OutlinedButton.styleFrom(shadowColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button shadow color',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnShadowColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.shadowColor!,
          style.shadowColor!,
        );
      },
    );
  });

  group('outlinedBtnElevationChanged', () {
    final value = Random().nextDouble();
    final style = OutlinedButton.styleFrom(elevation: value);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button elevation',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnElevationChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.elevation!,
          style.elevation!,
        );
      },
    );
  });

  group('outlinedBtnMinWidthChanged', () {
    final value = Random().nextDouble();
    final style = OutlinedButton.styleFrom(minimumSize: Size(value, 36));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button minimum width',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnMinWidthChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });

  group('outlinedBtnMinHeightChanged', () {
    final value = Random().nextDouble();
    final style = OutlinedButton.styleFrom(minimumSize: Size(64, value));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits outlined button minimum height',
      build: () => cubit,
      act: (cubit) => cubit.outlinedBtnMinHeightChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.outlinedButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });
}
