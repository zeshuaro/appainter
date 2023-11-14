import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestTextStyleCubit extends AbstractTextStyleCubit {
  TestTextStyleCubit() : super(typeScale: TypeScale.displayLarge);

  TextStyle get blackTextStyle => kBlackTextStyles[typeScale]!;

  TextStyle get whiteTextStyle => kWhiteTextStyles[typeScale]!;
}

class MockTextStyleCubit extends MockCubit<TextStyleState>
    implements TestTextStyleCubit {}

class TestIconThemeEditor extends AbstractTextStyleEditor<TestTextStyleCubit> {
  const TestIconThemeEditor({super.key});

  @override
  String get header => 'Test';
}
