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

  group('elevatedBtnBgColorChanged', () {
    final color = getRandomColor();
    final style = ElevatedButton.styleFrom(
      primary: color,
      onSurface: ColorScheme.light().onSurface,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button background color',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnBgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.backgroundColor!,
          style.backgroundColor!,
        );
      },
    );
  });

  group('elevatedBtnFgColorChanged', () {
    final color = getRandomColor();
    final style = ElevatedButton.styleFrom(
      onPrimary: color,
      onSurface: ColorScheme.light().onSurface,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button foreground color',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnFgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.foregroundColor!,
          style.foregroundColor!,
        );
      },
    );
  });

  group('elevatedBtnOverlayColorChanged', () {
    final color = getRandomColor();
    final style = ElevatedButton.styleFrom(onPrimary: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button overlay color',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnOverlayColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.overlayColor!,
          style.overlayColor!,
        );
      },
    );
  });

  group('elevatedBtnShadowColorChanged', () {
    final color = getRandomColor();
    final style = ElevatedButton.styleFrom(shadowColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button shadow color',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnShadowColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.shadowColor!,
          style.shadowColor!,
        );
      },
    );
  });

  group('elevatedBtnElevationChanged', () {
    final value = Random().nextDouble();
    final style = ElevatedButton.styleFrom(elevation: value);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button elevation',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnElevationChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.elevation!,
          style.elevation!,
        );
      },
    );
  });

  group('elevatedBtnMinWidthChanged', () {
    final value = Random().nextDouble();
    final style = ElevatedButton.styleFrom(minimumSize: Size(value, 36));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button minimum width',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnMinWidthChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });

  group('elevatedBtnMinHeightChanged', () {
    final value = Random().nextDouble();
    final style = ElevatedButton.styleFrom(minimumSize: Size(64, value));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits elevated button minimum height',
      build: () => cubit,
      act: (cubit) => cubit.elevatedBtnMinHeightChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.elevatedButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });
}
