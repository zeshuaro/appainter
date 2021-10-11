import 'package:flutter/material.dart';

import 'advanced_theme_cubit.dart';

extension RadioCubit on AdvancedThemeCubit {
  void radioFillColorChanged(Color color) {
    final fillColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return state.themeData.disabledColor;
      }
      if (states.contains(MaterialState.selected)) {
        return color;
      }
      return state.themeData.unselectedWidgetColor;
    });
    final theme = state.themeData.radioTheme.copyWith(fillColor: fillColor);
    _emitWithRadioThemeData(theme);
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
}
