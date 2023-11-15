import 'package:appainter/button_theme/button_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestFlatButtonStyleCubit extends AbstractFlatButtonStyleCubit {
  TestFlatButtonStyleCubit({required super.colorThemeCubit});

  @override
  OutlinedBorder get defaultShape => const RoundedRectangleBorder();

  @override
  ButtonStyle getDefaultStyle(ColorScheme colorScheme) {
    return OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 36),
    );
  }
}

class MockFlatButtonStyleCubit extends MockCubit<ButtonStyleState>
    implements TestFlatButtonStyleCubit {}

class TestFlatButtonStyleEditor
    extends AbstractFlatButtonStyleEditor<TestFlatButtonStyleCubit> {
  const TestFlatButtonStyleEditor({super.key});

  @override
  String get header => 'Test';
}
