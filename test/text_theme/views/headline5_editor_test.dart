import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor_test.dart';

void main() {
  AbstractTextStyleEditorTest<Headline5TextStyleCubit>(
    editor: const Headline5TextStyleEditor(),
    initializer: () => MockHeadline5TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline5!,
    expandText: 'Headline 5',
  ).runAllTests();
}
