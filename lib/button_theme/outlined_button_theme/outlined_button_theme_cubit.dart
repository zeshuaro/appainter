import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeCubit extends AbstractFlatButtonStyleCubit {
  OutlinedButtonThemeCubit({required super.colorThemeCubit});

  @override
  OutlinedBorder get defaultShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    );
  }

  @override
  ButtonStyle getDefaultStyle(ColorScheme colorScheme) {
    return OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 36),
      shape: defaultShape,
    );
  }
}
