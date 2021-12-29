import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

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

  TextTheme get textTheme {
    return TextTheme(
      headline1: headline1TextStyleCubit.state.style,
      headline2: headline2TextStyleCubit.state.style,
      headline3: headline3TextStyleCubit.state.style,
      headline4: headline4TextStyleCubit.state.style,
      headline5: headline5TextStyleCubit.state.style,
      headline6: headline6TextStyleCubit.state.style,
      subtitle1: subtitle1TextStyleCubit.state.style,
      subtitle2: subtitle2TextStyleCubit.state.style,
      bodyText1: bodyText1TextStyleCubit.state.style,
      bodyText2: bodyText2TextStyleCubit.state.style,
      button: buttonTextStyleCubit.state.style,
      caption: captionTextStyleCubit.state.style,
      overline: overlineTextStyleCubit.state.style,
    );
  }
}
