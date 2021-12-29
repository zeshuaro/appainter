import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<Subtitle2TextStyleCubit>(
    editor: const Subtitle2TextStyleEditor(),
    initializer: () => MockSubtitle2TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .subtitle2!,
    expandText: 'Subtitle 2',
  ).runAllTests();
}
