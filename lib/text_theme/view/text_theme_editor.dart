import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextThemeEditor extends ExpansionPanelItem {
  const TextThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text theme';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        FontPicker(
          onChanged: context.read<TextThemeCubit>().fontFamilyChanged,
        ),
        MyExpansionPanelList(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]
              : Colors.grey[100],
          items: const [
            DisplayLargeTextStyleEditor(),
            DisplayMediumTextStyleEditor(),
            DisplaySmallTextStyleEditor(),
            HeadlineLargeTextStyleEditor(),
            HeadlineMediumTextStyleEditor(),
            HeadlineSmallTextStyleEditor(),
            TitleLargeTextStyleEditor(),
            TitleMediumTextStyleEditor(),
            TitleSmallTextStyleEditor(),
            LabelLargeTextStyleEditor(),
            LabelMediumTextStyleEditor(),
            LabelSmallTextStyleEditor(),
            BodyLargeTextStyleEditor(),
            BodyMediumTextStyleEditor(),
            BodySmallTextStyleEditor(),
          ],
        ),
      ],
    );
  }
}

class DisplayLargeTextStyleEditor
    extends AbstractTextStyleEditor<DisplayLargeTextStyleCubit> {
  const DisplayLargeTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Display large';
}

class DisplayMediumTextStyleEditor
    extends AbstractTextStyleEditor<DisplayMediumTextStyleCubit> {
  const DisplayMediumTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Display medium';
}

class DisplaySmallTextStyleEditor
    extends AbstractTextStyleEditor<DisplaySmallTextStyleCubit> {
  const DisplaySmallTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Display small';
}

class HeadlineLargeTextStyleEditor
    extends AbstractTextStyleEditor<HeadlineLargeTextStyleCubit> {
  const HeadlineLargeTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline large';
}

class HeadlineMediumTextStyleEditor
    extends AbstractTextStyleEditor<HeadlineMediumTextStyleCubit> {
  const HeadlineMediumTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline medium';
}

class HeadlineSmallTextStyleEditor
    extends AbstractTextStyleEditor<HeadlineSmallTextStyleCubit> {
  const HeadlineSmallTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline small';
}

class TitleLargeTextStyleEditor
    extends AbstractTextStyleEditor<TitleLargeTextStyleCubit> {
  const TitleLargeTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Title large';
}

class TitleMediumTextStyleEditor
    extends AbstractTextStyleEditor<TitleMediumTextStyleCubit> {
  const TitleMediumTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Title medium';
}

class TitleSmallTextStyleEditor
    extends AbstractTextStyleEditor<TitleSmallTextStyleCubit> {
  const TitleSmallTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Title small';
}

class LabelLargeTextStyleEditor
    extends AbstractTextStyleEditor<LabelLargeTextStyleCubit> {
  const LabelLargeTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Label large';
}

class LabelMediumTextStyleEditor
    extends AbstractTextStyleEditor<LabelMediumTextStyleCubit> {
  const LabelMediumTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Label medium';
}

class LabelSmallTextStyleEditor
    extends AbstractTextStyleEditor<LabelSmallTextStyleCubit> {
  const LabelSmallTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Label small';
}

class BodyLargeTextStyleEditor
    extends AbstractTextStyleEditor<BodyLargeTextStyleCubit> {
  const BodyLargeTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Body large';
}

class BodyMediumTextStyleEditor
    extends AbstractTextStyleEditor<BodyMediumTextStyleCubit> {
  const BodyMediumTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Body medium';
}

class BodySmallTextStyleEditor
    extends AbstractTextStyleEditor<BodySmallTextStyleCubit> {
  const BodySmallTextStyleEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Body small';
}
