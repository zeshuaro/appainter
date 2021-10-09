import 'package:flutter/material.dart';

import 'advanced_theme_cubit.dart';

extension CheckboxCubit on AdvancedThemeCubit {
  void checkboxFillColorChanged(Color color) {
    final fillColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return state.themeData.disabledColor;
      }
      if (states.contains(MaterialState.selected)) {
        return color;
      }
      return state.themeData.unselectedWidgetColor;
    });
    final theme = state.themeData.checkboxTheme.copyWith(fillColor: fillColor);
    _emitWithCheckboxThemeData(theme);
  }

  void checkboxCheckColorChanged(Color color) {
    final checkColor = MaterialStateProperty.resolveWith((_) {
      return color;
    });
    final theme = state.themeData.checkboxTheme.copyWith(
      checkColor: checkColor,
    );
    _emitWithCheckboxThemeData(theme);
  }

  void checkboxOverlayColorChanged(Color color) {
    final overlayColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return state.themeData.toggleableActiveColor
            .withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(MaterialState.focused)) {
        return state.themeData.focusColor;
      }
      if (states.contains(MaterialState.hovered)) {
        return state.themeData.hoverColor;
      }
      return color;
    });
    final theme = state.themeData.checkboxTheme.copyWith(
      overlayColor: overlayColor,
    );
    _emitWithCheckboxThemeData(theme);
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
}
