import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<Headline4TextStyleCubit>(
    editor: const Headline4TextStyleEditor(),
    initializer: () => MockHeadline4TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline4!,
    expandText: 'Headline 4',
  ).runAllTests();
}
