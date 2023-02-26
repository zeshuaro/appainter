import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'text_theme_cubit.g.dart';
part 'text_theme_state.dart';

class TextThemeCubit extends Cubit<TextThemeState> {
  TextThemeCubit({
    required this.displayLargeTextStyleCubit,
    required this.displayMediumTextStyleCubit,
    required this.displaySmallTextStyleCubit,
    required this.headlineLargeTextStyleCubit,
    required this.headlineMediumTextStyleCubit,
    required this.headlineSmallTextStyleCubit,
    required this.titleLargeTextStyleCubit,
    required this.titleMediumTextStyleCubit,
    required this.titleSmallTextStyleCubit,
    required this.labelLargeTextStyleCubit,
    required this.labelMediumTextStyleCubit,
    required this.labelSmallTextStyleCubit,
    required this.bodyLargeTextStyleCubit,
    required this.bodyMediumTextStyleCubit,
    required this.bodySmallTextStyleCubit,
  }) : super(const TextThemeState());

  final DisplayLargeTextStyleCubit displayLargeTextStyleCubit;
  final DisplayMediumTextStyleCubit displayMediumTextStyleCubit;
  final DisplaySmallTextStyleCubit displaySmallTextStyleCubit;

  final HeadlineLargeTextStyleCubit headlineLargeTextStyleCubit;
  final HeadlineMediumTextStyleCubit headlineMediumTextStyleCubit;
  final HeadlineSmallTextStyleCubit headlineSmallTextStyleCubit;

  final TitleLargeTextStyleCubit titleLargeTextStyleCubit;
  final TitleMediumTextStyleCubit titleMediumTextStyleCubit;
  final TitleSmallTextStyleCubit titleSmallTextStyleCubit;

  final LabelLargeTextStyleCubit labelLargeTextStyleCubit;
  final LabelMediumTextStyleCubit labelMediumTextStyleCubit;
  final LabelSmallTextStyleCubit labelSmallTextStyleCubit;

  final BodyLargeTextStyleCubit bodyLargeTextStyleCubit;
  final BodyMediumTextStyleCubit bodyMediumTextStyleCubit;
  final BodySmallTextStyleCubit bodySmallTextStyleCubit;

  void themeBrightnessChanged(bool isDark) {
    displayLargeTextStyleCubit.styleBrightnessChanged(isDark);
    displayMediumTextStyleCubit.styleBrightnessChanged(isDark);
    displaySmallTextStyleCubit.styleBrightnessChanged(isDark);

    headlineLargeTextStyleCubit.styleBrightnessChanged(isDark);
    headlineMediumTextStyleCubit.styleBrightnessChanged(isDark);
    headlineSmallTextStyleCubit.styleBrightnessChanged(isDark);

    titleLargeTextStyleCubit.styleBrightnessChanged(isDark);
    titleMediumTextStyleCubit.styleBrightnessChanged(isDark);
    titleSmallTextStyleCubit.styleBrightnessChanged(isDark);

    labelLargeTextStyleCubit.styleBrightnessChanged(isDark);
    labelMediumTextStyleCubit.styleBrightnessChanged(isDark);
    labelSmallTextStyleCubit.styleBrightnessChanged(isDark);

    bodyLargeTextStyleCubit.styleBrightnessChanged(isDark);
    bodyMediumTextStyleCubit.styleBrightnessChanged(isDark);
    bodySmallTextStyleCubit.styleBrightnessChanged(isDark);
  }

  void themeChanged(TextTheme theme) {
    displayLargeTextStyleCubit.styleChanged(theme.displayLarge);
    displayMediumTextStyleCubit.styleChanged(theme.displayMedium);
    displaySmallTextStyleCubit.styleChanged(theme.displaySmall);

    headlineLargeTextStyleCubit.styleChanged(theme.headlineLarge);
    headlineMediumTextStyleCubit.styleChanged(theme.headlineMedium);
    headlineSmallTextStyleCubit.styleChanged(theme.headlineSmall);

    titleLargeTextStyleCubit.styleChanged(theme.titleLarge);
    titleMediumTextStyleCubit.styleChanged(theme.titleMedium);
    titleSmallTextStyleCubit.styleChanged(theme.titleSmall);

    labelLargeTextStyleCubit.styleChanged(theme.labelLarge);
    labelMediumTextStyleCubit.styleChanged(theme.labelMedium);
    labelSmallTextStyleCubit.styleChanged(theme.labelSmall);

    bodyLargeTextStyleCubit.styleChanged(theme.bodyLarge);
    bodyMediumTextStyleCubit.styleChanged(theme.bodyMedium);
    bodySmallTextStyleCubit.styleChanged(theme.bodySmall);
  }

  void fontFamilyChanged(FontData data) {
    emit(state.copyWith(fontFamily: data.family));
  }
}
