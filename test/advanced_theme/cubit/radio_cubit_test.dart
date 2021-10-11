import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit();
  });

  group('radioFillColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData();
    final fillColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return theme.disabledColor;
      }
      if (states.contains(MaterialState.selected)) {
        return color;
      }
      return theme.unselectedWidgetColor;
    });

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit fill color changed',
      build: () => cubit,
      act: (cubit) => cubit.radioFillColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.radioTheme.fillColor!,
          fillColor,
        );
      },
    );
  });

  group('radioSplashRadiusChanged', () {
    final value = Random().nextDouble();
    final theme = ThemeData(
      radioTheme: RadioThemeData(splashRadius: value),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit splash radius changed',
      build: () => cubit,
      act: (cubit) => cubit.radioSplashRadiusChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
