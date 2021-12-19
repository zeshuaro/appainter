import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/enums/enums.dart';
import 'package:flutter_theme/services/services.dart';

import '../../../mocks.dart';
import '../../../utils.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(
      appBarThemeCubit: MockAppBarThemeCubit(),
      tabBarThemeCubit: MockTabBarThemeCubit(),
      bottomNavBarThemeCubit: MockBottomNavigationBarThemeCubit(),
    );
  });

  group('buttonTextColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text color changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('buttonTextBackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text background color changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextBackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('buttonTextFontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text font size changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextFontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('buttonTextFontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextFontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('buttonTextFontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextFontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('buttonTextLetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextLetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('buttonTextWordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextWordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('buttonTextTextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextTextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('buttonTextHeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text height changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextHeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('buttonTextLeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextLeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('buttonTextDecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextDecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('buttonTextDecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.buttonTextDecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('buttonTextDecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          button: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit button text decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.buttonTextDecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('buttonTextDecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        button: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit button text decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.buttonTextDecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
