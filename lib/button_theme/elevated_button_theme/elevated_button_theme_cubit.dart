import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter/material.dart';

class ElevatedButtonThemeCubit extends AbstractButtonStyleCubit {
  ElevatedButtonThemeCubit({required ColorThemeCubit colorThemeCubit})
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
