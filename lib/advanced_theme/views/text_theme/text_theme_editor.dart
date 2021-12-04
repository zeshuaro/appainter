import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/consts.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextThemeEditor extends ExpansionPanelItem {
  const TextThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text Theme';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll,
      child: SingleChildScrollView(
        child: MyExpansionPanelList(
          color: Colors.grey[100],
          items: const [
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
        ),
      ),
    );
  }
}
