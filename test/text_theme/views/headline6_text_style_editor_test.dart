import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<Headline6TextStyleCubit>(
    editor: const Headline6TextStyleEditor(),
    initializer: () => MockHeadline6TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline6!,
    expandText: 'Headline 6',
  ).runAllTests();
}
