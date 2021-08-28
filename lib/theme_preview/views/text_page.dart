import 'package:flutter/material.dart';
import 'package:flutter_theme/common/consts.dart';
import 'package:flutter_theme/theme_preview/views/views.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextPage extends PreviewBody {
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
          'Headline 1',
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          'Headline 2',
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          'Headline 3',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Headline 4',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          'Headline 5',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'Headline 6',
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
