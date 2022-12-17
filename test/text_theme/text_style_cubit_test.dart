import 'package:appainter/abstract_text_style/consts.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('initialise text style cubits', () {
    expect(Headline1TextStyleCubit().typeScale, equals(TypeScale.headline1));
    expect(Headline2TextStyleCubit().typeScale, equals(TypeScale.headline2));
    expect(Headline3TextStyleCubit().typeScale, equals(TypeScale.headline3));
    expect(Headline4TextStyleCubit().typeScale, equals(TypeScale.headline4));
    expect(Headline5TextStyleCubit().typeScale, equals(TypeScale.headline5));
    expect(Headline6TextStyleCubit().typeScale, equals(TypeScale.headline6));
    expect(Subtitle1TextStyleCubit().typeScale, equals(TypeScale.subtitle1));
    expect(Subtitle2TextStyleCubit().typeScale, equals(TypeScale.subtitle2));
    expect(BodyText1TextStyleCubit().typeScale, equals(TypeScale.bodyText1));
    expect(BodyText2TextStyleCubit().typeScale, equals(TypeScale.bodyText2));
    expect(ButtonTextStyleCubit().typeScale, equals(TypeScale.button));
    expect(CaptionTextStyleCubit().typeScale, equals(TypeScale.caption));
    expect(OverlineTextStyleCubit().typeScale, equals(TypeScale.overline));
  });
}
