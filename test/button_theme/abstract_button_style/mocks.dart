import 'package:appainter/button_theme/abstract_button_style/abstract_button_style.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestButtonStyleCubit extends AbstractButtonStyleCubit {
  TestButtonStyleCubit({
    required super.colorThemeCubit,
    OutlinedBorder? shape,
  }) : shape = shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            );

  final OutlinedBorder shape;

  @override
  OutlinedBorder get defaultShape => shape;

  @override
  ButtonStyle getDefaultStyle(ColorScheme colorScheme) {
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 2,
      minimumSize: const Size(64, 36),
      shape: shape,
    );
  }
}

class MockButtonStyleCubit extends MockCubit<ButtonStyleState>
    implements TestButtonStyleCubit {}

class TestButtonStyleEditor
    extends AbstractButtonStyleEditor<TestButtonStyleCubit> {
  static const _color = Colors.blue;

  const TestButtonStyleEditor({super.key});

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

  @override
  Widget buildBackgroundColorPickers(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildElevationTextFields(BuildContext context) {
    return const SizedBox.shrink();
  }
}
