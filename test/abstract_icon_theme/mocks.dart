import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestIconThemeCubit extends AbstractIconThemeCubit {}

class MockIconThemeCubit extends MockCubit<IconThemeState>
    implements TestIconThemeCubit {}

class TestIconThemeEditor extends AbstractIconThemeEditor<TestIconThemeCubit> {
  const TestIconThemeEditor({super.key});

  @override
  String? get keyPrefix => null;

  @override
  String get header => 'Test';

  @override
  Color? fallbackColor(BuildContext context) => null;
}
