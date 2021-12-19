// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

extension SliderCubit on AdvancedThemeCubit {
  void sliderTrackHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final theme = state.themeData.sliderTheme.copyWith(trackHeight: height);
      _emitWithSliderTheme(theme);
    }
  }

  void sliderActiveTrackColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(activeTrackColor: color);
    _emitWithSliderTheme(theme);
  }

  void sliderInactiveTrackColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      inactiveTrackColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderDisabledActiveTrackColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      disabledActiveTrackColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderDisabledInactiveTrackColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      disabledInactiveTrackColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderActiveTickMarkColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      activeTickMarkColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderInactiveTickMarkColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      inactiveTickMarkColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderDisabledActiveTickMarkColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      disabledActiveTickMarkColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderDisabledInactiveTickMarkColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      disabledInactiveTickMarkColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderThumbColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(thumbColor: color);
    _emitWithSliderTheme(theme);
  }

  void sliderDisabledThumbColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      disabledThumbColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderOverlappingShapeStrokeColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      overlappingShapeStrokeColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void sliderOverlayColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(overlayColor: color);
    _emitWithSliderTheme(theme);
  }

  void sliderValueIndicatorColorChanged(Color color) {
    final theme = state.themeData.sliderTheme.copyWith(
      valueIndicatorColor: color,
    );
    _emitWithSliderTheme(theme);
  }

  void _emitWithSliderTheme(SliderThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(sliderTheme: theme)),
    );
  }
}
