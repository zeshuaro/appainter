import 'package:flutter/material.dart';

import 'advanced_theme_cubit.dart';

extension IconThemeCubit on AdvancedThemeCubit {
  void iconThemeColorChanged(Color color) {
    final iconTheme = state.themeData.iconTheme.copyWith(
      color: color,
    );
    _emitStateWithIconTheme(iconTheme);
  }

  void iconThemeSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final iconTheme = state.themeData.iconTheme.copyWith(
        size: size,
      );
      _emitStateWithIconTheme(iconTheme);
    }
  }

  void iconThemeOpacityChanged(String value) {
    final opacity = double.tryParse(value);
    if (opacity != null) {
      final iconTheme = state.themeData.iconTheme.copyWith(
        opacity: opacity,
      );
      _emitStateWithIconTheme(iconTheme);
    }
  }

  void _emitStateWithIconTheme(IconThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(iconTheme: theme)),
    );
  }
}
