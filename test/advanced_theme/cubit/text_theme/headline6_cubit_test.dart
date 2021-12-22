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
      bottomNavigationBarThemeCubit: MockBottomNavigationBarThemeCubit(),
      floatingActionButtonThemeCubit: MockFloatingActionButtonThemeCubit(),
      elevatedButtonThemeCubit: MockElevatedButtonThemeCubit(),
      outlinedButtonThemeCubit: MockOutlinedButtonThemeCubit(),
    );
  });

  group('headline6ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline6BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline6FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('headline6FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('headline6FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline6LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline6WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('headline6TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline6HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 height changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('headline6LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('headline6DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline6DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline6DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('headline6DecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 6 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline6DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline6DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline6: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 6 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.headline6DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
