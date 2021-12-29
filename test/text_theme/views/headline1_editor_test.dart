import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor_test.dart';

void main() {
  AbstractTextStyleEditorTest<Headline1TextStyleCubit>(
    editor: const Headline1TextStyleEditor(),
    initializer: () => MockHeadline1TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline1!,
    expandText: 'Headline 1',
  ).runAllTests();
}
