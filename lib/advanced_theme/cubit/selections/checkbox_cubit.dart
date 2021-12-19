// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/advanced_theme/cubit/selections/utils.dart';
import 'package:flutter_theme/services/services.dart';

extension CheckboxCubit on AdvancedThemeCubit {
  void checkboxFillDefaultColorChanged(Color color) {
    _emitWithNewFillColor(defaultColor: color);
  }

  void checkboxFillSelectedColorChanged(Color color) {
    _emitWithNewFillColor(selectedColor: color);
  }

  void checkboxFillDisabledColorChanged(Color color) {
    _emitWithNewFillColor(disabledColor: color);
  }

  void checkboxCheckColorChanged(Color color) {
    final theme = state.themeData.checkboxTheme.copyWith(
      checkColor: MaterialStateProperty.all(color),
    );
    _emitWithCheckboxThemeData(theme);
  }

  void checkboxOverlayPressedColorChanged(Color color) {
    _emitWithNewOverlayColor(pressedColor: color);
  }

  void checkboxOverlayHoveredColorChanged(Color color) {
    _emitWithNewOverlayColor(hoveredColor: color);
  }

  void checkboxOverlayFocusedColorChanged(Color color) {
    _emitWithNewOverlayColor(focusedColor: color);
  }

  void checkboxMaterialTapTargetSize(String value) {
    final size = UtilService.stringToEnum(MaterialTapTargetSize.values, value);
    if (size != null) {
      final theme = state.themeData.checkboxTheme.copyWith(
        materialTapTargetSize: size,
      );
      _emitWithCheckboxThemeData(theme);
    }
  }

  void checkboxSplashRadiusChanged(String value) {
    final radius = double.tryParse(value);
    if (radius != null) {
      final theme = state.themeData.checkboxTheme.copyWith(
        splashRadius: radius,
      );
      _emitWithCheckboxThemeData(theme);
    }
  }

  void _emitWithCheckboxThemeData(CheckboxThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(checkboxTheme: theme)),
    );
  }

  void _emitWithNewFillColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final theme = state.themeData.checkboxTheme;
    final color = getSelectionBasicColor(
      theme.fillColor ?? _defaultFillColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );

    _emitWithCheckboxThemeData(theme.copyWith(fillColor: color));
  }

  void _emitWithNewOverlayColor({
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    final theme = state.themeData.checkboxTheme;
    final color = getSelectionOverlayColor(
      theme.overlayColor ?? _defaultOverlayColor,
      pressedColor: pressedColor,
      hoveredColor: hoveredColor,
      focusedColor: focusedColor,
    );

    _emitWithCheckboxThemeData(theme.copyWith(overlayColor: color));
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
