import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/theme_preview/views/views.dart';
import 'package:appainter/widgets/widgets.dart';

class TextPage extends PreviewBody {
  const TextPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.text_fields;

  @override
  String get label => 'Text';

  @override
  Widget build(BuildContext context) {
    return MyListView(
      padding: kPaddingAll,
      children: [
        Text(
          'H1',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          'H2',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'H3',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'H4',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          'H5',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'H6',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Subtitle 1',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          'Subtitle 2',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          'Body Text 1',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Body Text 2',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          'Caption',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          'Button',
          style: Theme.of(context).textTheme.button,
        ),
        Text(
          'Overline',
          style: Theme.of(context).textTheme.overline,
        ),
      ],
    );
  }
}
