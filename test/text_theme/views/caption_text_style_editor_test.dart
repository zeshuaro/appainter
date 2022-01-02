import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<CaptionTextStyleCubit>(
    editor: const CaptionTextStyleEditor(),
    initializer: () => MockCaptionTextStyleCubit(),
    style:
        Typography.englishLike2018.merge(Typography.blackMountainView).caption!,
    expandText: 'Caption Text',
  ).runAllTests();
}
