import 'package:appainter/button_theme/abstract_button_style/abstract_button_style.dart';
import 'package:appainter/color_theme/cubit/color_theme_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';

class TestButtonStyleCubit extends AbstractButtonStyleCubit {
  TestButtonStyleCubit({required ColorThemeCubit colorThemeCubit})
      : super(colorThemeCubit: colorThemeCubit);

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
    );
  }
}

class MockButtonStyleCubit extends MockCubit<ButtonStyleState>
    implements TestButtonStyleCubit {}

class TestButtonStyleEditor
    extends AbstractButtonStyleEditor<TestButtonStyleCubit> {
  static const _color = Colors.blue;
  static const _elevation = 2.0;

  const TestButtonStyleEditor({Key? key}) : super(key: key);

  @override
  Color fallbackBackgroundDefaultColor(ColorScheme colorScheme) => _color;

  @override
  Color fallbackBackgroundDisabledColor(ColorScheme colorScheme) => _color;

  @override
  double get fallbackElevationDefault => _elevation;

  @override
  double get fallbackElevationFocused => _elevation;

  @override
  double get fallbackElevationHovered => _elevation;

  @override
  double get fallbackElevationPressed => _elevation;

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
