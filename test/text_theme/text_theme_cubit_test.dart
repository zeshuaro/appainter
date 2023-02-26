import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  const fontFamily = 'fontFamily';
  late TextThemeCubit textThemeCubit;
  late TextTheme textTheme;

  late DisplayLargeTextStyleCubit displayLargeTextStyleCubit;
  late DisplayMediumTextStyleCubit displayMediumTextStyleCubit;
  late DisplaySmallTextStyleCubit displaySmallTextStyleCubit;

  late HeadlineLargeTextStyleCubit headlineLargeTextStyleCubit;
  late HeadlineMediumTextStyleCubit headlineMediumTextStyleCubit;
  late HeadlineSmallTextStyleCubit headlineSmallTextStyleCubit;

  late TitleLargeTextStyleCubit titleLargeTextStyleCubit;
  late TitleMediumTextStyleCubit titleMediumTextStyleCubit;
  late TitleSmallTextStyleCubit titleSmallTextStyleCubit;

  late LabelLargeTextStyleCubit labelLargeTextStyleCubit;
  late LabelMediumTextStyleCubit labelMediumTextStyleCubit;
  late LabelSmallTextStyleCubit labelSmallTextStyleCubit;

  late BodyLargeTextStyleCubit bodyLargeTextStyleCubit;
  late BodyMediumTextStyleCubit bodyMediumTextStyleCubit;
  late BodySmallTextStyleCubit bodySmallTextStyleCubit;

  setUp(() {
    textTheme = ThemeData().textTheme;

    displayLargeTextStyleCubit = MockDisplayLargeTextStyleCubit();
    displayMediumTextStyleCubit = MockDisplayMediumTextStyleCubit();
    displaySmallTextStyleCubit = MockDisplaySmallTextStyleCubit();

    headlineLargeTextStyleCubit = MockHeadlineLargeTextStyleCubit();
    headlineMediumTextStyleCubit = MockHeadlineMediumTextStyleCubit();
    headlineSmallTextStyleCubit = MockHeadlineSmallTextStyleCubit();

    titleLargeTextStyleCubit = MockTitleLargeTextStyleCubit();
    titleMediumTextStyleCubit = MockTitleMediumTextStyleCubit();
    titleSmallTextStyleCubit = MockTitleSmallTextStyleCubit();

    labelLargeTextStyleCubit = MockLabelLargeTextStyleCubit();
    labelMediumTextStyleCubit = MockLabelMediumTextStyleCubit();
    labelSmallTextStyleCubit = MockLabelSmallTextStyleCubit();

    bodyLargeTextStyleCubit = MockBodyLargeTextStyleCubit();
    bodyMediumTextStyleCubit = MockBodyMediumTextStyleCubit();
    bodySmallTextStyleCubit = MockBodySmallTextStyleCubit();

    textThemeCubit = TextThemeCubit(
      displayLargeTextStyleCubit: displayLargeTextStyleCubit,
      displayMediumTextStyleCubit: displayMediumTextStyleCubit,
      displaySmallTextStyleCubit: displaySmallTextStyleCubit,
      headlineLargeTextStyleCubit: headlineLargeTextStyleCubit,
      headlineMediumTextStyleCubit: headlineMediumTextStyleCubit,
      headlineSmallTextStyleCubit: headlineSmallTextStyleCubit,
      titleLargeTextStyleCubit: titleLargeTextStyleCubit,
      titleMediumTextStyleCubit: titleMediumTextStyleCubit,
      titleSmallTextStyleCubit: titleSmallTextStyleCubit,
      labelLargeTextStyleCubit: labelLargeTextStyleCubit,
      labelMediumTextStyleCubit: labelMediumTextStyleCubit,
      labelSmallTextStyleCubit: labelSmallTextStyleCubit,
      bodyLargeTextStyleCubit: bodyLargeTextStyleCubit,
      bodyMediumTextStyleCubit: bodyMediumTextStyleCubit,
      bodySmallTextStyleCubit: bodySmallTextStyleCubit,
    );
  });

  group('test theme brightness', () {
    for (var isDark in [true, false]) {
      blocTest<TextThemeCubit, TextThemeState>(
        'should emit text style with isDark=$isDark',
        build: () => textThemeCubit,
        act: (cubit) => cubit.themeBrightnessChanged(isDark),
        verify: (cubit) {
          verify(
            () => displayLargeTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => displayMediumTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => displaySmallTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => headlineLargeTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => headlineMediumTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => headlineSmallTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => titleLargeTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => titleMediumTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => titleSmallTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => labelLargeTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => labelMediumTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
          verify(
            () => labelSmallTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => bodyLargeTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => bodyMediumTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);

          verify(
            () => bodySmallTextStyleCubit.styleBrightnessChanged(isDark),
          ).called(1);
        },
      );
    }
  });

  blocTest<TextThemeCubit, TextThemeState>(
    'should emit text style',
    build: () => textThemeCubit,
    act: (cubit) => cubit.themeChanged(textTheme),
    verify: (cubit) {
      verify(
        () => displayLargeTextStyleCubit.styleChanged(textTheme.displayLarge),
      ).called(1);
      verify(
        () => displayMediumTextStyleCubit.styleChanged(textTheme.displayMedium),
      ).called(1);
      verify(
        () => displaySmallTextStyleCubit.styleChanged(textTheme.displaySmall),
      ).called(1);

      verify(
        () => headlineLargeTextStyleCubit.styleChanged(textTheme.headlineLarge),
      ).called(1);
      verify(
        () =>
            headlineMediumTextStyleCubit.styleChanged(textTheme.headlineMedium),
      ).called(1);
      verify(
        () => headlineSmallTextStyleCubit.styleChanged(textTheme.headlineSmall),
      ).called(1);

      verify(
        () => titleLargeTextStyleCubit.styleChanged(textTheme.titleLarge),
      ).called(1);
      verify(
        () => titleMediumTextStyleCubit.styleChanged(textTheme.titleMedium),
      ).called(1);
      verify(
        () => titleSmallTextStyleCubit.styleChanged(textTheme.titleSmall),
      ).called(1);

      verify(
        () => labelLargeTextStyleCubit.styleChanged(textTheme.labelLarge),
      ).called(1);
      verify(
        () => labelMediumTextStyleCubit.styleChanged(textTheme.labelMedium),
      ).called(1);
      verify(
        () => labelSmallTextStyleCubit.styleChanged(textTheme.labelSmall),
      ).called(1);

      verify(
        () => bodyLargeTextStyleCubit.styleChanged(textTheme.bodyLarge),
      ).called(1);

      verify(
        () => bodyMediumTextStyleCubit.styleChanged(textTheme.bodyMedium),
      ).called(1);

      verify(
        () => bodySmallTextStyleCubit.styleChanged(textTheme.bodySmall),
      ).called(1);
    },
  );

  blocTest<TextThemeCubit, TextThemeState>(
    'should emit font family',
    build: () => textThemeCubit,
    act: (cubit) => cubit.fontFamilyChanged(
      const FontData(fontFamily, TextStyle()),
    ),
    expect: () => [const TextThemeState(fontFamily: fontFamily)],
  );
}
