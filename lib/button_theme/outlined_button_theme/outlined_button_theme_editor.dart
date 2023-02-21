import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeEditor
    extends AbstractFlatButtonStyleEditor<OutlinedButtonThemeCubit> {
  const OutlinedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  Color fallbackForegroundDefaultColor(ColorScheme colorScheme) {
    return colorScheme.primary;
  }

  @override
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.38);
  }

  @override
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.12);
  }

  @override
  Color fallbackOverlayHoveredColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.04);
  }

  @override
  Color fallbackOverlayPressedColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.12);
  }

  @override
  String get header => 'Outlined button';
}
