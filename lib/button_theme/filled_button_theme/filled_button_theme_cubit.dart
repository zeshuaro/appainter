import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class FilledButtonThemeCubit extends AbstractFlatButtonStyleCubit {
  FilledButtonThemeCubit({required super.colorThemeCubit});

  @override
  OutlinedBorder get defaultShape => const StadiumBorder();

  @override
  ButtonStyle getDefaultStyle(ColorScheme colorScheme) {
    return FilledButton.styleFrom(
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
      disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      shadowColor: colorScheme.shadow,
      elevation: 0,
      minimumSize: const Size(64, 40),
      shape: defaultShape,
    );
  }
}
