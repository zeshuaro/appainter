import 'package:flutter/material.dart';

import '../advanced_theme_cubit.dart';

extension FloatingActionBtnCubit on AdvancedThemeCubit {
  void floatingActionBtnBgColorChanged(Color color) {
    final theme = state.themeData.floatingActionButtonTheme.copyWith(
      backgroundColor: color,
    );
    _emitStateWithFloatingActionBtnTheme(theme);
  }

  void floatingActionBtnFgColorChanged(Color color) {
    final theme = state.themeData.floatingActionButtonTheme.copyWith(
      foregroundColor: color,
    );
    _emitStateWithFloatingActionBtnTheme(theme);
  }

  void floatingActionBtnFocusColorChanged(Color color) {
    final theme = state.themeData.floatingActionButtonTheme.copyWith(
      focusColor: color,
    );
    _emitStateWithFloatingActionBtnTheme(theme);
  }

  void floatingActionBtnHoverColorChanged(Color color) {
    final theme = state.themeData.floatingActionButtonTheme.copyWith(
      hoverColor: color,
    );
    _emitStateWithFloatingActionBtnTheme(theme);
  }

  void floatingActionBtnSplashColorChanged(Color color) {
    final theme = state.themeData.floatingActionButtonTheme.copyWith(
      splashColor: color,
    );
    _emitStateWithFloatingActionBtnTheme(theme);
  }

  void floatingActionBtnElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.themeData.floatingActionButtonTheme.copyWith(
        elevation: elevation,
      );
      _emitStateWithFloatingActionBtnTheme(theme);
    }
  }

  void floatingActionBtnDisabledElevationChanged(String value) {
    final disabledElevation = double.tryParse(value);
    if (disabledElevation != null) {
      final theme = state.themeData.floatingActionButtonTheme.copyWith(
        disabledElevation: disabledElevation,
      );
      _emitStateWithFloatingActionBtnTheme(theme);
    }
  }

  void floatingActionBtnFocusElevationChanged(String value) {
    final focusElevation = double.tryParse(value);
    if (focusElevation != null) {
      final theme = state.themeData.floatingActionButtonTheme.copyWith(
        focusElevation: focusElevation,
      );
      _emitStateWithFloatingActionBtnTheme(theme);
    }
  }

  void floatingActionBtnHighlightElevationChanged(String value) {
    final highlightElevation = double.tryParse(value);
    if (highlightElevation != null) {
      final theme = state.themeData.floatingActionButtonTheme.copyWith(
        highlightElevation: highlightElevation,
      );
      _emitStateWithFloatingActionBtnTheme(theme);
    }
  }

  void floatingActionBtnHoverElevationChanged(String value) {
    final hoverElevation = double.tryParse(value);
    if (hoverElevation != null) {
      final theme = state.themeData.floatingActionButtonTheme.copyWith(
        hoverElevation: hoverElevation,
      );
      _emitStateWithFloatingActionBtnTheme(theme);
    }
  }

  void _emitStateWithFloatingActionBtnTheme(
    FloatingActionButtonThemeData theme,
  ) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(floatingActionButtonTheme: theme),
      ),
    );
  }
}
