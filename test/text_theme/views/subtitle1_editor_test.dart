import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor_test.dart';

void main() {
  AbstractTextStyleEditorTest<Subtitle1TextStyleCubit>(
    editor: const Subtitle1TextStyleEditor(),
    initializer: () => MockSubtitle1TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .subtitle1!,
    expandText: 'Subtitle 1',
  ).runAllTests();
}
