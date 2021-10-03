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

  group('switchThumbColorChanged', () {
    final color = getRandomColor();
    final thumbColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      if (states.contains(MaterialState.selected)) {
        return color;
      }
      return Colors.grey.shade50;
    });

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit thumb color changed',
      build: () => cubit,
      act: (cubit) => cubit.switchThumbColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.switchTheme.thumbColor!,
          thumbColor,
        );
      },
    );
  });

  group('switchTrackColorChanged', () {
    final color = getRandomColor();
    final trackColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.black12;
      }
      if (states.contains(MaterialState.selected)) {
        return color.withAlpha(0x80);
      }
      return const Color(0x52000000);
    });

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit track color changed',
      build: () => cubit,
      act: (cubit) => cubit.switchTrackColorChanged(color),
      verify: (cubit) {
        verifyMaterialProperty(
          cubit.state.themeData.switchTheme.trackColor!,
          trackColor,
        );
      },
    );
  });

  group('switchSplashRadiusChanged', () {
    final value = Random().nextDouble();
    final theme = ThemeData(switchTheme: SwitchThemeData(splashRadius: value));

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit splash radius changed',
      build: () => cubit,
      act: (cubit) => cubit.switchSplashRadiusChanged(value.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
