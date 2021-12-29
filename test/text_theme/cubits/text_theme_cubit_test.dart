import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late TextThemeCubit textThemeCubit;
  late TextTheme textTheme;

  late Headline1TextStyleCubit headline1TextStyleCubit;
  late Headline2TextStyleCubit headline2TextStyleCubit;
  late Headline3TextStyleCubit headline3TextStyleCubit;
  late Headline4TextStyleCubit headline4TextStyleCubit;
  late Headline5TextStyleCubit headline5TextStyleCubit;
  late Headline6TextStyleCubit headline6TextStyleCubit;

  late Subtitle1TextStyleCubit subtitle1TextStyleCubit;
  late Subtitle2TextStyleCubit subtitle2TextStyleCubit;
  late BodyText1TextStyleCubit bodyText1TextStyleCubit;
  late BodyText2TextStyleCubit bodyText2TextStyleCubit;

  late ButtonTextStyleCubit buttonTextStyleCubit;
  late CaptionTextStyleCubit captionTextStyleCubit;
  late OverlineTextStyleCubit overlineTextStyleCubit;

  setUp(() {
    textTheme = ThemeData().textTheme;
    headline1TextStyleCubit = MockHeadline1TextStyleCubit();
    headline2TextStyleCubit = MockHeadline2TextStyleCubit();
    headline3TextStyleCubit = MockHeadline3TextStyleCubit();
    headline4TextStyleCubit = MockHeadline4TextStyleCubit();
    headline5TextStyleCubit = MockHeadline5TextStyleCubit();
    headline6TextStyleCubit = MockHeadline6TextStyleCubit();

    subtitle1TextStyleCubit = MockSubtitle1TextStyleCubit();
    subtitle2TextStyleCubit = MockSubtitle2TextStyleCubit();
    bodyText1TextStyleCubit = MockBodyText1TextStyleCubit();
    bodyText2TextStyleCubit = MockBodyText2TextStyleCubit();

    buttonTextStyleCubit = MockButtonTextStyleCubit();
    captionTextStyleCubit = MockCaptionTextStyleCubit();
    overlineTextStyleCubit = MockOverlineTextStyleCubit();

    textThemeCubit = TextThemeCubit(
      headline1TextStyleCubit: headline1TextStyleCubit,
      headline2TextStyleCubit: headline2TextStyleCubit,
      headline3TextStyleCubit: headline3TextStyleCubit,
      headline4TextStyleCubit: headline4TextStyleCubit,
      headline5TextStyleCubit: headline5TextStyleCubit,
      headline6TextStyleCubit: headline6TextStyleCubit,
      subtitle1TextStyleCubit: subtitle1TextStyleCubit,
      subtitle2TextStyleCubit: subtitle2TextStyleCubit,
      bodyText1TextStyleCubit: bodyText1TextStyleCubit,
      bodyText2TextStyleCubit: bodyText2TextStyleCubit,
      buttonTextStyleCubit: buttonTextStyleCubit,
      captionTextStyleCubit: captionTextStyleCubit,
      overlineTextStyleCubit: overlineTextStyleCubit,
    );
  });

  blocTest<TextThemeCubit, TextThemeState>(
    'should emit text style',
    build: () => textThemeCubit,
    act: (cubit) => cubit.themeChanged(textTheme),
    verify: (cubit) {
      verify(
        () => headline1TextStyleCubit.styleChanged(textTheme.headline1),
      ).called(1);
      verify(
        () => headline2TextStyleCubit.styleChanged(textTheme.headline2),
      ).called(1);
      verify(
        () => headline3TextStyleCubit.styleChanged(textTheme.headline3),
      ).called(1);
      verify(
        () => headline4TextStyleCubit.styleChanged(textTheme.headline4),
      ).called(1);
      verify(
        () => headline5TextStyleCubit.styleChanged(textTheme.headline5),
      ).called(1);
      verify(
        () => headline6TextStyleCubit.styleChanged(textTheme.headline6),
      ).called(1);

      verify(
        () => subtitle1TextStyleCubit.styleChanged(textTheme.subtitle1),
      ).called(1);
      verify(
        () => subtitle2TextStyleCubit.styleChanged(textTheme.subtitle2),
      ).called(1);
      verify(
        () => bodyText1TextStyleCubit.styleChanged(textTheme.bodyText1),
      ).called(1);
      verify(
        () => bodyText2TextStyleCubit.styleChanged(textTheme.bodyText2),
      ).called(1);

      verify(
        () => buttonTextStyleCubit.styleChanged(textTheme.button),
      ).called(1);
      verify(
        () => captionTextStyleCubit.styleChanged(textTheme.caption),
      ).called(1);
      verify(
        () => overlineTextStyleCubit.styleChanged(textTheme.overline),
      ).called(1);
    },
  );
}
