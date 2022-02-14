import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<OverlineTextStyleCubit>(
    editor: const OverlineTextStyleEditor(),
    initializer: () => MockOverlineTextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .overline!,
    expandText: 'Overline text',
  ).runAllTests();
}
