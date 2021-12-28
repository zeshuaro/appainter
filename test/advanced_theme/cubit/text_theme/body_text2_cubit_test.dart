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
    );
  });

  group('bodyText2ColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(color: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2ColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText2BackgroundColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(backgroundColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 background color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2BackgroundColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText2FontSizeChanged', () {
    final size = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: size),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 font size changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2FontSizeChanged(size.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var weight in MyFontWeight().values) {
    group('bodyText2FontWeightChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontWeight: weight),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 font weight changed to $weight',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2FontWeightChanged(
            MyFontWeight().stringFromEnum(weight)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var style in FontStyle.values) {
    group('bodyText2FontStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 font style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2FontStyleChanged(UtilService.enumToString(style));
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText2LetterSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(letterSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 letter spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2LetterSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  group('bodyText2WordSpacingChanged', () {
    final spacing = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(wordSpacing: spacing),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 word spacing changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2WordSpacingChanged(spacing.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var baseline in TextBaseline.values) {
    group('bodyText2TextBaselineChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(textBaseline: baseline),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 text baseline changed to $baseline',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2TextBaselineChanged(
            UtilService.enumToString(baseline),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText2HeightChanged', () {
    final height = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(height: height),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 height changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2HeightChanged(height.toString()),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var dist in TextLeadingDistribution.values) {
    group('bodyText2LeadingDistributionChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(leadingDistribution: dist),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 text baseline changed to $dist',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2LeadingDistributionChanged(
            UtilService.enumToString(dist),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  for (var decoration in MyTextDecoration().values) {
    group('bodyText2DecorationChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(decoration: decoration),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 decoration changed to $decoration',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2DecorationChanged(
            MyTextDecoration().stringFromEnum(decoration)!,
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText2DecorationColorChanged', () {
    final color = getRandomColor();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(decorationColor: color),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 decoration color changed',
      build: () => cubit,
      act: (cubit) => cubit.bodyText2DecorationColorChanged(color),
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });

  for (var style in TextDecorationStyle.values) {
    group('bodyText2DecorationStyleChanged', () {
      final theme = ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(decorationStyle: style),
        ),
      );

      blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'should emit body text 2 decoration style changed to $style',
        build: () => cubit,
        act: (cubit) {
          cubit.bodyText2DecorationStyleChanged(
            UtilService.enumToString(style),
          );
        },
        expect: () => [AdvancedThemeState(themeData: theme)],
      );
    });
  }

  group('bodyText2DecorationThicknessChanged', () {
    final thickness = Random().nextDouble();
    final theme = ThemeData(
      textTheme: TextTheme(
        bodyText2: TextStyle(decorationThickness: thickness),
      ),
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'should emit body text 2 decoration thickness changed',
      build: () => cubit,
      act: (cubit) {
        cubit.bodyText2DecorationThicknessChanged(thickness.toString());
      },
      expect: () => [AdvancedThemeState(themeData: theme)],
    );
  });
}
