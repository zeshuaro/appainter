import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'text_theme_cubit.g.dart';
part 'text_theme_state.dart';

class TextThemeCubit extends Cubit<TextThemeState> {
  final Headline1TextStyleCubit headline1TextStyleCubit;
  final Headline2TextStyleCubit headline2TextStyleCubit;
  final Headline3TextStyleCubit headline3TextStyleCubit;
  final Headline4TextStyleCubit headline4TextStyleCubit;
  final Headline5TextStyleCubit headline5TextStyleCubit;
  final Headline6TextStyleCubit headline6TextStyleCubit;

  final Subtitle1TextStyleCubit subtitle1TextStyleCubit;
  final Subtitle2TextStyleCubit subtitle2TextStyleCubit;
  final BodyText1TextStyleCubit bodyText1TextStyleCubit;
  final BodyText2TextStyleCubit bodyText2TextStyleCubit;

  final ButtonTextStyleCubit buttonTextStyleCubit;
  final CaptionTextStyleCubit captionTextStyleCubit;
  final OverlineTextStyleCubit overlineTextStyleCubit;

  TextThemeCubit({
    required this.headline1TextStyleCubit,
    required this.headline2TextStyleCubit,
    required this.headline3TextStyleCubit,
    required this.headline4TextStyleCubit,
    required this.headline5TextStyleCubit,
    required this.headline6TextStyleCubit,
    required this.subtitle1TextStyleCubit,
    required this.subtitle2TextStyleCubit,
    required this.bodyText1TextStyleCubit,
    required this.bodyText2TextStyleCubit,
    required this.buttonTextStyleCubit,
    required this.captionTextStyleCubit,
    required this.overlineTextStyleCubit,
  }) : super(const TextThemeState());

  void themeBrightnessChanged(bool isDark) {
    headline1TextStyleCubit.styleBrightnessChanged(isDark);
    headline2TextStyleCubit.styleBrightnessChanged(isDark);
    headline3TextStyleCubit.styleBrightnessChanged(isDark);
    headline4TextStyleCubit.styleBrightnessChanged(isDark);
    headline5TextStyleCubit.styleBrightnessChanged(isDark);
    headline6TextStyleCubit.styleBrightnessChanged(isDark);

    subtitle1TextStyleCubit.styleBrightnessChanged(isDark);
    subtitle2TextStyleCubit.styleBrightnessChanged(isDark);
    bodyText1TextStyleCubit.styleBrightnessChanged(isDark);
    bodyText2TextStyleCubit.styleBrightnessChanged(isDark);

    buttonTextStyleCubit.styleBrightnessChanged(isDark);
    captionTextStyleCubit.styleBrightnessChanged(isDark);
    overlineTextStyleCubit.styleBrightnessChanged(isDark);
  }

  void themeChanged(TextTheme theme) {
    headline1TextStyleCubit.styleChanged(theme.headline1);
    headline2TextStyleCubit.styleChanged(theme.headline2);
    headline3TextStyleCubit.styleChanged(theme.headline3);
    headline4TextStyleCubit.styleChanged(theme.headline4);
    headline5TextStyleCubit.styleChanged(theme.headline5);
    headline6TextStyleCubit.styleChanged(theme.headline6);

    subtitle1TextStyleCubit.styleChanged(theme.subtitle1);
    subtitle2TextStyleCubit.styleChanged(theme.subtitle2);
    bodyText1TextStyleCubit.styleChanged(theme.bodyText1);
    bodyText2TextStyleCubit.styleChanged(theme.bodyText2);

    buttonTextStyleCubit.styleChanged(theme.button);
    captionTextStyleCubit.styleChanged(theme.caption);
    overlineTextStyleCubit.styleChanged(theme.overline);
  }

  void fontFamilyChanged(FontData data) {
    emit(state.copyWith(fontFamily: data.family));
  }
}
