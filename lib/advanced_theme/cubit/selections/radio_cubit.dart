import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/advanced_theme/cubit/selections/utils.dart';
import 'package:flutter_theme/services/services.dart';

extension RadioCubit on AdvancedThemeCubit {
  void radioFillDefaultColorChanged(Color color) {
    _emitWithNewFillColor(defaultColor: color);
  }

  void radioFillSelectedColorChanged(Color color) {
    _emitWithNewFillColor(selectedColor: color);
  }

  void radioFillDisabledColorChanged(Color color) {
    _emitWithNewFillColor(disabledColor: color);
  }

  void radioOverlayPressedColorChanged(Color color) {
    _emitWithNewOverlayColor(pressedColor: color);
  }

  void radioOverlayHoveredColorChanged(Color color) {
    _emitWithNewOverlayColor(hoveredColor: color);
  }

  void radioOverlayFocusedColorChanged(Color color) {
    _emitWithNewOverlayColor(focusedColor: color);
  }

  void radioMaterialTapTargetSize(String value) {
    final size = UtilService.stringToEnum(MaterialTapTargetSize.values, value);
    if (size != null) {
      final theme = state.themeData.radioTheme.copyWith(
        materialTapTargetSize: size,
      );
      _emitWithRadioThemeData(theme);
    }
  }

  void radioSplashRadiusChanged(String value) {
    final radius = double.tryParse(value);
    if (radius != null) {
      final theme = state.themeData.radioTheme.copyWith(splashRadius: radius);
      _emitWithRadioThemeData(theme);
    }
  }

  void _emitWithRadioThemeData(RadioThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(radioTheme: theme)),
    );
  }

  void _emitWithNewFillColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final theme = state.themeData.radioTheme;
    final color = getSelectionBasicColor(
      theme.fillColor ?? _defaultFillColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );

    _emitWithRadioThemeData(theme.copyWith(fillColor: color));
  }

  void _emitWithNewOverlayColor({
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    final theme = state.themeData.radioTheme;
    final color = getSelectionOverlayColor(
      theme.overlayColor ?? _defaultOverlayColor,
      pressedColor: pressedColor,
      hoveredColor: hoveredColor,
      focusedColor: focusedColor,
    );

    _emitWithRadioThemeData(theme.copyWith(overlayColor: color));
  }

  MaterialStateProperty<Color> get _defaultFillColor {
    final themeData = state.themeData;
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return themeData.disabledColor;
      }
      if (states.contains(MaterialState.selected)) {
        return themeData.toggleableActiveColor;
      }
      return themeData.unselectedWidgetColor;
    });
  }

  MaterialStateProperty<Color?> get _defaultOverlayColor {
    final themeData = state.themeData;
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return themeData.toggleableActiveColor.withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(MaterialState.hovered)) {
        return themeData.hoverColor;
      }
      if (states.contains(MaterialState.focused)) {
        return themeData.focusColor;
      }
      return null;
    });
  }
}
