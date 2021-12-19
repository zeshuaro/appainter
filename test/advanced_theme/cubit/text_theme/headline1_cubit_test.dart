import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
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
    );
  });

  group('headline1ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline1BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline1FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('headline1FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('headline1FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline1LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline1WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('headline1TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline1HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 height changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('headline1LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('headline1DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline1DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline1DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline1DecorationStyleChanged', () {
    final theme = ThemeData(
      textTheme: const TextTheme(
        headline1: TextStyle(decorationStyle: null),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 decoration style changed to None',
      build: () => cubit,
      act: (cubit) {
        cubit.headline1DecorationStyleChanged(kNone);
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );

    for (var style in TextDecorationStyle.values) {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 1 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline1DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    }
  });

  group('headline1DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 1 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.headline1DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
