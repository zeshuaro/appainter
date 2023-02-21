import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/cubit/color_theme_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestFlatButtonStyleCubit extends AbstractFlatButtonStyleCubit {
  TestFlatButtonStyleCubit({required ColorThemeCubit colorThemeCubit})
      : super(colorThemeCubit: colorThemeCubit);

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
  static const _color = Colors.blue;

  const TestFlatButtonStyleEditor({Key? key}) : super(key: key);

  @override
  Color fallbackForegroundDefaultColor(ColorScheme colorScheme) => _color;

  @override
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme) => _color;

  @override
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme) => _color;

  @override
  Color fallbackOverlayHoveredColor(ColorScheme colorScheme) => _color;

  @override
  Color fallbackOverlayPressedColor(ColorScheme colorScheme) => _color;

  @override
  String get header => 'Test';
}
