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
  final chipTheme = ThemeData().chipTheme;
  late AdvancedThemeCubit cubit;

  setUp(() {
    cubit = AdvancedThemeCubit(appBarThemeCubit: MockAppBarThemeCubit());
  });

  group('bodyText1ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(color: color),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText1BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(backgroundColor: color),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText1FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: size),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
      // verify: (cubit) => debugAdvancedThemeCubit(cubit, theme),
    );
  });

  for (var weight in MyFontWeight().values) {
    group('bodyText1FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontWeight: weight),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('bodyText1FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontStyle: style),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText1LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(letterSpacing: spacing),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText1WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(wordSpacing: spacing),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('bodyText1TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(textBaseline: baseline),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText1HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(height: height),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 height changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('bodyText1LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(leadingDistribution: dist),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('bodyText1DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(decoration: decoration),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText1DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(decorationColor: color),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText1DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('bodyText1DecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(decorationStyle: style),
        ),
        chipTheme: chipTheme,
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 1 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText1DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText1DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(decorationThickness: thickness),
      ),
      chipTheme: chipTheme,
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 1 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.bodyText1DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
