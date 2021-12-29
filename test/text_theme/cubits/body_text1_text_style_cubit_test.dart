import 'package:flutter/material.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';

import 'abstract_text_style_cubit.dart';

void main() {
  AbstractTextStyleCubitTest(
    initializer: () => BodyText1TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText1!,
  ).runAllTests();
}
