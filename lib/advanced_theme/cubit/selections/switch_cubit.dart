import 'package:flutter/material.dart';

import '../advanced_theme_cubit.dart';

extension SwitchCubit on AdvancedThemeCubit {
  void switchThumbColorChanged(Color color) {
    final thumbColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      if (states.contains(MaterialState.selected)) {
        return color;
      }
      return Colors.grey.shade50;
    });
    final theme = state.themeData.switchTheme.copyWith(thumbColor: thumbColor);
    _emitWithSwitchThemeData(theme);
  }

  void switchTrackColorChanged(Color color) {
    final trackColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.black12;
      }
      if (states.contains(MaterialState.selected)) {
        return color.withAlpha(0x80);
      }
      return const Color(0x52000000);
    });
    final theme = state.themeData.switchTheme.copyWith(trackColor: trackColor);
    _emitWithSwitchThemeData(theme);
  }

  void switchSplashRadiusChanged(String value) {
    final radius = double.tryParse(value);
    if (radius != null) {
      final theme = state.themeData.switchTheme.copyWith(splashRadius: radius);
      _emitWithSwitchThemeData(theme);
    }
  }

  void _emitWithSwitchThemeData(SwitchThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(switchTheme: theme)),
    );
  }
}
