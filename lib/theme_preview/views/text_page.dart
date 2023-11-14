import 'package:appainter/common/consts.dart';
import 'package:appainter/theme_preview/views/views.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextPage extends PreviewBody {
  const TextPage({super.key});

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
          'Display large',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'Display medium',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          'Display small',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          'Headline large',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Headline medium',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'Headline small',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Title large',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Title medium',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Title small',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          'Label large',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          'Label medium',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          'Label small',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          'Body large',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Body medium',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'Body small',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
