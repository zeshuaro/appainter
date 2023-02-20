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

  void backgroundDefaultColorChanged(Color color) {
    final bgColor = getBasicColor(
      style.backgroundColor!,
      defaultColor: color,
    );

    emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void backgroundDisabledColorChanged(Color color) {
    final bgColor = getBasicColor(
      style.backgroundColor!,
      disabledColor: color,
    );

    emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void defaultElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        style.elevation!,
        defaultElevation: elevation,
      );

      emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void disabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        style.elevation!,
        disabledElevation: elevation,
      );

      emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void hoveredElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        style.elevation!,
        hoveredElevation: elevation,
      );

      emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void focusedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        style.elevation!,
        focusedElevation: elevation,
      );

      emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void pressedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        style.elevation!,
        pressedElevation: elevation,
      );

      emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  MaterialStateProperty<double?> _getElevation(
    MaterialStateProperty<double?> elevation, {
    double? defaultElevation,
    double? disabledElevation,
    double? hoveredElevation,
    double? focusedElevation,
    double? pressedElevation,
  }) {
    return MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledElevation ??
              elevation.resolve({MaterialState.disabled});
        }
        if (states.contains(MaterialState.hovered)) {
          return hoveredElevation ?? elevation.resolve({MaterialState.hovered});
        }
        if (states.contains(MaterialState.focused)) {
          return focusedElevation ?? elevation.resolve({MaterialState.focused});
        }
        if (states.contains(MaterialState.pressed)) {
          return pressedElevation ?? elevation.resolve({MaterialState.pressed});
        }

        return defaultElevation ?? elevation.resolve({});
      },
    );
  }
}
