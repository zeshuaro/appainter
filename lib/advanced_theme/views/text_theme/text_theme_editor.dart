import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextThemeEditor extends StatelessWidget {
  const TextThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExpandableCard(
      header: 'Text Theme',
      children: [
        Headline1Editor(),
        Headline2Editor(),
        Headline3Editor(),
        Headline4Editor(),
        Headline5Editor(),
        Headline6Editor(),
        Subtitle1Editor(),
        Subtitle2Editor(),
        BodyText1Editor(),
        BodyText2Editor(),
        ButtonTextEditor(),
        CaptionTextEditor(),
        OverlineTextEditor(),
      ],
    );
  }
}
