import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

const _englishTextTheme = Typography.englishLike2018;
const _blackTextTheme = Typography.blackMountainView;

class Headline1TextStyleCubit extends AbstractTextStyleCubit {
  Headline1TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline1!.merge(
              _blackTextTheme.headline1,
            ),
          ),
        );
}

class Headline2TextStyleCubit extends AbstractTextStyleCubit {
  Headline2TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline2!.merge(
              _blackTextTheme.headline2,
            ),
          ),
        );
}

class Headline3TextStyleCubit extends AbstractTextStyleCubit {
  Headline3TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline3!.merge(
              _blackTextTheme.headline3,
            ),
          ),
        );
}

class Headline4TextStyleCubit extends AbstractTextStyleCubit {
  Headline4TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline4!.merge(
              _blackTextTheme.headline4,
            ),
          ),
        );
}

class Headline5TextStyleCubit extends AbstractTextStyleCubit {
  Headline5TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline5!.merge(
              _blackTextTheme.headline5,
            ),
          ),
        );
}

class Headline6TextStyleCubit extends AbstractTextStyleCubit {
  Headline6TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.headline6!.merge(
              _blackTextTheme.headline6,
            ),
          ),
        );
}

class Subtitle1TextStyleCubit extends AbstractTextStyleCubit {
  Subtitle1TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.subtitle1!.merge(
              _blackTextTheme.subtitle1,
            ),
          ),
        );
}

class Subtitle2TextStyleCubit extends AbstractTextStyleCubit {
  Subtitle2TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.subtitle2!.merge(
              _blackTextTheme.subtitle2,
            ),
          ),
        );
}

class BodyText1TextStyleCubit extends AbstractTextStyleCubit {
  BodyText1TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.bodyText1!.merge(
              _blackTextTheme.bodyText1,
            ),
          ),
        );
}

class BodyText2TextStyleCubit extends AbstractTextStyleCubit {
  BodyText2TextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.bodyText2!.merge(
              _blackTextTheme.bodyText2,
            ),
          ),
        );
}

class ButtonTextStyleCubit extends AbstractTextStyleCubit {
  ButtonTextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.button!.merge(_blackTextTheme.button),
          ),
        );
}

class CaptionTextStyleCubit extends AbstractTextStyleCubit {
  CaptionTextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.caption!.merge(_blackTextTheme.caption),
          ),
        );
}

class OverlineTextStyleCubit extends AbstractTextStyleCubit {
  OverlineTextStyleCubit()
      : super(
          TextStyleState(
            style: _englishTextTheme.overline!.merge(_blackTextTheme.overline),
          ),
        );
}
