import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor_test.dart';

void main() {
  AbstractTextStyleEditorTest(
    editor: const BodyText2TextStyleEditor(),
    initializer: () => MockBodyText2TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText2!,
    expandText: 'Body Text 2',
  ).runAllTests();
}
