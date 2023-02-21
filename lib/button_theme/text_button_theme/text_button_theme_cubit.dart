import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter/material.dart';

class TextButtonThemeCubit extends AbstractFlatButtonStyleCubit {
  TextButtonThemeCubit({required ColorThemeCubit colorThemeCubit})
      : super(colorThemeCubit: colorThemeCubit);

  @override
  ButtonStyle getDefaultStyle(ColorScheme colorScheme) {
    return TextButton.styleFrom(
      foregroundColor: colorScheme.primary,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      backgroundColor: Colors.transparent,
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 36),
    );
  }
}
