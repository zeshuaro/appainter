import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<BodyText2TextStyleCubit>(
    editor: const BodyText2TextStyleEditor(),
    initializer: () => MockBodyText2TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText2!,
    expandText: 'Body Text 2',
  ).runAllTests();
}
