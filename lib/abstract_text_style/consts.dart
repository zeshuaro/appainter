// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

enum TypeScale {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  button,
  caption,
  overline,
}

const _englishTextTheme = Typography.englishLike2018;
final _blackTextTheme = _englishTextTheme.merge(
  Typography.blackMountainView,
);
final _whiteTextTheme = _englishTextTheme.merge(
  Typography.whiteMountainView,
);

final kBlackTextStyles = {
  TypeScale.headline1: _blackTextTheme.headline1,
  TypeScale.headline2: _blackTextTheme.headline2,
  TypeScale.headline3: _blackTextTheme.headline3,
  TypeScale.headline4: _blackTextTheme.headline4,
  TypeScale.headline5: _blackTextTheme.headline5,
  TypeScale.headline6: _blackTextTheme.headline6,
  TypeScale.subtitle1: _blackTextTheme.subtitle1,
  TypeScale.subtitle2: _blackTextTheme.subtitle2,
  TypeScale.bodyText1: _blackTextTheme.bodyText1,
  TypeScale.bodyText2: _blackTextTheme.bodyText2,
  TypeScale.button: _blackTextTheme.button,
  TypeScale.caption: _blackTextTheme.caption,
  TypeScale.overline: _blackTextTheme.overline,
};

final kWhiteTextStyles = {
  TypeScale.headline1: _whiteTextTheme.headline1,
  TypeScale.headline2: _whiteTextTheme.headline2,
  TypeScale.headline3: _whiteTextTheme.headline3,
  TypeScale.headline4: _whiteTextTheme.headline4,
  TypeScale.headline5: _whiteTextTheme.headline5,
  TypeScale.headline6: _whiteTextTheme.headline6,
  TypeScale.subtitle1: _whiteTextTheme.subtitle1,
  TypeScale.subtitle2: _whiteTextTheme.subtitle2,
  TypeScale.bodyText1: _whiteTextTheme.bodyText1,
  TypeScale.bodyText2: _whiteTextTheme.bodyText2,
  TypeScale.button: _whiteTextTheme.button,
  TypeScale.caption: _whiteTextTheme.caption,
  TypeScale.overline: _whiteTextTheme.overline,
};
