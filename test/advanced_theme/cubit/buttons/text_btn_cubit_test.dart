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

  group('textBtnBgColorChanged', () {
    final color = getRandomColor();
    final style = TextButton.styleFrom(backgroundColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button background color',
      build: () => cubit,
      act: (cubit) => cubit.textBtnBgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.backgroundColor!,
          style.backgroundColor!,
        );
      },
    );
  });

  group('textBtnFgColorChanged', () {
    final color = getRandomColor();
    final style = TextButton.styleFrom(
      primary: color,
      onSurface: ColorScheme.light().onSurface,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button foreground color',
      build: () => cubit,
      act: (cubit) => cubit.textBtnFgColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.foregroundColor!,
          style.foregroundColor!,
        );
      },
    );
  });

  group('textBtnOverlayColorChanged', () {
    final color = getRandomColor();
    final style = TextButton.styleFrom(primary: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button overlay color',
      build: () => cubit,
      act: (cubit) => cubit.textBtnOverlayColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.overlayColor!,
          style.overlayColor!,
        );
      },
    );
  });

  group('textBtnShadowColorChanged', () {
    final color = getRandomColor();
    final style = TextButton.styleFrom(shadowColor: color);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button shadow color',
      build: () => cubit,
      act: (cubit) => cubit.textBtnShadowColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.shadowColor!,
          style.shadowColor!,
        );
      },
    );
  });

  group('textBtnElevationChanged', () {
    final value = Random().nextDouble();
    final style = TextButton.styleFrom(elevation: value);

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button elevation',
      build: () => cubit,
      act: (cubit) => cubit.textBtnElevationChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.elevation!,
          style.elevation!,
        );
      },
    );
  });

  group('textBtnMinWidthChanged', () {
    final value = Random().nextDouble();
    final style = TextButton.styleFrom(minimumSize: Size(value, 36));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button minimum width',
      build: () => cubit,
      act: (cubit) => cubit.textBtnMinWidthChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });

  group('textBtnMinHeightChanged', () {
    final value = Random().nextDouble();
    final style = TextButton.styleFrom(minimumSize: Size(64, value));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits text button minimum height',
      build: () => cubit,
      act: (cubit) => cubit.textBtnMinHeightChanged(value.toString()),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.textButtonTheme.style!.minimumSize!,
          style.minimumSize!,
        );
      },
    );
  });
}
