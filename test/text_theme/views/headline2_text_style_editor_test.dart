import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<Headline2TextStyleCubit>(
    editor: const Headline2TextStyleEditor(),
    initializer: () => MockHeadline2TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline2!,
    expandText: 'Headline 2',
  ).runAllTests();
}
