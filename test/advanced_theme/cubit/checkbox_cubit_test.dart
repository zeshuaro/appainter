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

  group('checkboxFillColorChanged', () {
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
      act: (cubit) => cubit.checkboxFillColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.checkboxTheme.fillColor!,
          fillColor,
        );
      },
    );
  });

  group('checkboxCheckColorChanged', () {
    final color = getRandomColor();
    final checkColor = MaterialStateProperty.resolveWith((_) {
      return color;
    });

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit check color changed',
      build: () => cubit,
      act: (cubit) => cubit.checkboxCheckColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.checkboxTheme.checkColor!,
          checkColor,
        );
      },
    );
  });

  group('checkboxOverlayColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData();
    final overlayColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return theme.toggleableActiveColor.withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(MaterialState.focused)) {
        return theme.focusColor;
      }
      if (states.contains(MaterialState.hovered)) {
        return theme.hoverColor;
      }
      return color;
    });

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit overlay color changed',
      build: () => cubit,
      act: (cubit) => cubit.checkboxOverlayColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.checkboxTheme.overlayColor!,
          overlayColor,
        );
      },
    );
  });

  group('switchSplashRadiusChanged', () {
    final value = Random().nextDouble();
    final theme = ThemeData(
      checkboxTheme: CheckboxThemeData(splashRadius: value),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit splash radius changed',
      build: () => cubit,
      act: (cubit) => cubit.checkboxSplashRadiusChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
