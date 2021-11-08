import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension ElevatedButtonCubit on AdvancedThemeCubit {
  void elevatedButtonBackgroundEnabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final bgColor = _getBasicColor(style.backgroundColor!, enabledColor: color);

    _emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void elevatedButtonBackgroundDisabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final bgColor = _getBasicColor(
      style.backgroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void elevatedButtonForegroundEnabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = _getBasicColor(style.foregroundColor!, enabledColor: color);

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void elevatedButtonForegroundDisabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = _getBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void elevatedButtonOverlayHoveredColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void elevatedButtonOverlayFocusedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void elevatedButtonOverlayPressedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void elevatedButtonShadowColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void elevatedButtonEnabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getButtonStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        enabledElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void elevatedButtonDisabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getButtonStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        disabledElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void elevatedButtonHoveredElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getButtonStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        hoveredElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void elevatedButtonFocusedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getButtonStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        focusedElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void elevatedButtonPressedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getButtonStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        pressedElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void _emitWithButtonStyle(ButtonStyle style) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return state.themeData.elevatedButtonTheme.style ??
        ElevatedButton.styleFrom(
          primary: state.themeData.colorScheme.primary,
          onPrimary: state.themeData.colorScheme.onPrimary,
          onSurface: state.themeData.colorScheme.onSurface,
          shadowColor: state.themeData.shadowColor,
          elevation: kElevatedButtonElevation,
          minimumSize: kBtnMinSize,
        );
  }

  MaterialStateProperty<Color?> _getBasicColor(
    MaterialStateProperty<Color?> color, {
    Color? enabledColor,
    Color? disabledColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor ?? color.resolve({MaterialState.disabled});
      }
      return enabledColor ?? color.resolve({});
    });
  }

  MaterialStateProperty<Color?> _getOverlayColor(
    MaterialStateProperty<Color?> overlayColor, {
    Color? hoveredColor,
    Color? focusedColor,
    Color? pressedColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return hoveredColor ?? overlayColor.resolve({MaterialState.hovered});
      }
      if (states.contains(MaterialState.focused)) {
        return focusedColor ?? overlayColor.resolve({MaterialState.focused});
      }
      if (states.contains(MaterialState.pressed)) {
        return pressedColor ?? overlayColor.resolve({MaterialState.pressed});
      }
      return null;
    });
  }

  MaterialStateProperty<double?> _getElevation(
    MaterialStateProperty<double?> elevation, {
    double? enabledElevation,
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

        return enabledElevation ?? elevation.resolve({});
      },
    );
  }
}
