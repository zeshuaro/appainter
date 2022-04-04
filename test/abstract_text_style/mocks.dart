import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestTextStyleCubit extends AbstractTextStyleCubit {
  TestTextStyleCubit()
      : super(
          baseStyle: Typography.englishLike2018.bodyText1!,
          blackStyle: Typography.blackMountainView.bodyText1!,
          whiteStyle: Typography.whiteMountainView.bodyText1!,
        );
}

class MockTextStyleCubit extends MockCubit<TextStyleState>
    implements TestTextStyleCubit {}

class TestIconThemeEditor extends AbstractTextStyleEditor<TestTextStyleCubit> {
  const TestIconThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Test';
}
