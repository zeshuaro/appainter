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
    cubit = AdvancedThemeCubit(appBarThemeCubit: MockAppBarThemeCubit());
  });

  group('headline5ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline5BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline5FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('headline5FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('headline5FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline5LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline5WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('headline5TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline5HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 height changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('headline5LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('headline5DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline5DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline5DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('headline5DecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline5: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 5 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline5DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline5DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline5: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 5 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.headline5DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
