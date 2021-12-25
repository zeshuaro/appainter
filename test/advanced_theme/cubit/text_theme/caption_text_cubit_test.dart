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
      colorThemeCubit: MockColorThemeCubit(),
      appBarThemeCubit: MockAppBarThemeCubit(),
      tabBarThemeCubit: MockTabBarThemeCubit(),
      bottomNavigationBarThemeCubit: MockBottomNavigationBarThemeCubit(),
      floatingActionButtonThemeCubit: MockFloatingActionButtonThemeCubit(),
      elevatedButtonThemeCubit: MockElevatedButtonThemeCubit(),
      outlinedButtonThemeCubit: MockOutlinedButtonThemeCubit(),
      textButtonThemeCubit: MockTextButtonThemeCubit(),
    );
  });

  group('captionTextColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text color changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('captionTextBackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text background color changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextBackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('captionTextFontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text font size changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextFontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('captionTextFontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextFontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('captionTextFontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextFontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('captionTextLetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextLetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('captionTextWordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextWordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('captionTextTextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextTextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('captionTextHeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text height changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextHeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('captionTextLeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextLeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('captionTextDecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextDecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('captionTextDecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.captionTextDecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('captionTextDecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          caption: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit caption text decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.captionTextDecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('captionTextDecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        caption: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit caption text decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.captionTextDecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
