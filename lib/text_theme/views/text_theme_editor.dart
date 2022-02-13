import 'package:appainter/text_theme/text_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextThemeEditor extends ExpansionPanelItem {
  const TextThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text Theme';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        const FontPicker(),
        MyExpansionPanelList(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]
              : Colors.grey[100],
          items: const [
            Headline1TextStyleEditor(),
            Headline2TextStyleEditor(),
            Headline3TextStyleEditor(),
            Headline4TextStyleEditor(),
            Headline5TextStyleEditor(),
            Headline6TextStyleEditor(),
            Subtitle1TextStyleEditor(),
            Subtitle2TextStyleEditor(),
            BodyText1TextStyleEditor(),
            BodyText2TextStyleEditor(),
            ButtonTextStyleEditor(),
            CaptionTextStyleEditor(),
            OverlineTextStyleEditor(),
          ],
        ),
      ],
    );
  }
}

class Headline1TextStyleEditor
    extends AbstractTextStyleEditor<Headline1TextStyleCubit> {
  const Headline1TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 1';
}

class Headline2TextStyleEditor
    extends AbstractTextStyleEditor<Headline2TextStyleCubit> {
  const Headline2TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 2';
}

class Headline3TextStyleEditor
    extends AbstractTextStyleEditor<Headline3TextStyleCubit> {
  const Headline3TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 3';
}

class Headline4TextStyleEditor
    extends AbstractTextStyleEditor<Headline4TextStyleCubit> {
  const Headline4TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 4';
}

class Headline5TextStyleEditor
    extends AbstractTextStyleEditor<Headline5TextStyleCubit> {
  const Headline5TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 5';
}

class Headline6TextStyleEditor
    extends AbstractTextStyleEditor<Headline6TextStyleCubit> {
  const Headline6TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 6';
}

class Subtitle1TextStyleEditor
    extends AbstractTextStyleEditor<Subtitle1TextStyleCubit> {
  const Subtitle1TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Subtitle 1';
}

class Subtitle2TextStyleEditor
    extends AbstractTextStyleEditor<Subtitle2TextStyleCubit> {
  const Subtitle2TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Subtitle 2';
}

class BodyText1TextStyleEditor
    extends AbstractTextStyleEditor<BodyText1TextStyleCubit> {
  const BodyText1TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Body Text 1';
}

class BodyText2TextStyleEditor
    extends AbstractTextStyleEditor<BodyText2TextStyleCubit> {
  const BodyText2TextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Body Text 2';
}

class ButtonTextStyleEditor
    extends AbstractTextStyleEditor<ButtonTextStyleCubit> {
  const ButtonTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Button Text';
}

class CaptionTextStyleEditor
    extends AbstractTextStyleEditor<CaptionTextStyleCubit> {
  const CaptionTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Caption Text';
}

class OverlineTextStyleEditor
    extends AbstractTextStyleEditor<OverlineTextStyleCubit> {
  const OverlineTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Overline Text';
}
