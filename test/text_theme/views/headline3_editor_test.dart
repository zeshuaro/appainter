import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor_test.dart';

void main() {
  AbstractTextStyleEditorTest<Headline3TextStyleCubit>(
    editor: const Headline3TextStyleEditor(),
    initializer: () => MockHeadline3TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline3!,
    expandText: 'Headline 3',
  ).runAllTests();
}
