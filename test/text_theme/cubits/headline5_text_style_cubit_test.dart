import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import 'abstract_text_style_cubit_test.dart';

void main() {
  AbstractTextStyleCubitTest(
    initializer: () => Headline5TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .headline5!,
  ).runAllTests();
}
