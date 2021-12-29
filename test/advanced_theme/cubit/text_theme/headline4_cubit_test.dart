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
      iconThemeCubit: MockIconThemeCubit(),
      inputDecorationThemeCubit: MockInputDecorationThemeCubit(),
      switchThemeCubit: MockSwitchThemeCubit(),
      checkboxThemeCubit: MockCheckboxThemeCubit(),
      radioThemeCubit: MockRadioThemeCubit(),
    );
  });

  group('headline4ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline4BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline4FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('headline4FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('headline4FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline4LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('headline4WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('headline4TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline4HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 height changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('headline4LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('headline4DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline4DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.headline4DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('headline4DecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit headline 4 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.headline4DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('headline4DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        headline4: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit headline 4 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.headline4DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
