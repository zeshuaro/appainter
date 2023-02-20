import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class ElevatedButtonThemeEditor
    extends AbstractButtonStyleEditor<ElevatedButtonThemeCubit> {
  static const _baseElevation = 2.0;

  const ElevatedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  Color fallbackBackgroundDefaultColor(ColorScheme colorScheme) {
    return colorScheme.primary;
  }

  @override
  Color fallbackBackgroundDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.12);
  }

  @override
  double get fallbackElevationDefault => _baseElevation;

  @override
  double get fallbackElevationFocused => _baseElevation + 2;

  @override
  double get fallbackElevationHovered => _baseElevation + 2;

  @override
  double get fallbackElevationPressed => _baseElevation + 6;

  @override
  Color fallbackForegroundDefaultColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary;
  }

  @override
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.38);
  }

  @override
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.24);
  }

  @override
  Color fallbackOverlayHoveredColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.08);
  }

  @override
  Color fallbackOverlayPressedColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.24);
  }

  @override
  String get header => 'Elevated button';
}
