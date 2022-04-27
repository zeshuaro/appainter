import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'slider_theme_cubit.g.dart';
part 'slider_theme_state.dart';

@ThemeDocs(apiClassName: 'SliderThemeData')
class SliderThemeCubit extends Cubit<SliderThemeState> {
  SliderThemeCubit() : super(const SliderThemeState());

  void themeChanged(SliderThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void trackHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final theme = state.theme.copyWith(trackHeight: height);
      emit(state.copyWith(theme: theme));
    }
  }

  void activeTrackColorChanged(Color color) {
    final theme = state.theme.copyWith(activeTrackColor: color);
    emit(state.copyWith(theme: theme));
  }

  void inactiveTrackColorChanged(Color color) {
    final theme = state.theme.copyWith(inactiveTrackColor: color);
    emit(state.copyWith(theme: theme));
  }

  void disabledActiveTrackColorChanged(Color color) {
    final theme = state.theme.copyWith(disabledActiveTrackColor: color);
    emit(state.copyWith(theme: theme));
  }

  void disabledInactiveTrackColorChanged(Color color) {
    final theme = state.theme.copyWith(disabledInactiveTrackColor: color);
    emit(state.copyWith(theme: theme));
  }

  void activeTickMarkColorChanged(Color color) {
    final theme = state.theme.copyWith(activeTickMarkColor: color);
    emit(state.copyWith(theme: theme));
  }

  void inactiveTickMarkColorChanged(Color color) {
    final theme = state.theme.copyWith(inactiveTickMarkColor: color);
    emit(state.copyWith(theme: theme));
  }

  void disabledActiveTickMarkColorChanged(Color color) {
    final theme = state.theme.copyWith(disabledActiveTickMarkColor: color);
    emit(state.copyWith(theme: theme));
  }

  void disabledInactiveTickMarkColorChanged(Color color) {
    final theme = state.theme.copyWith(disabledInactiveTickMarkColor: color);
    emit(state.copyWith(theme: theme));
  }

  void thumbColorChanged(Color color) {
    final theme = state.theme.copyWith(thumbColor: color);
    emit(state.copyWith(theme: theme));
  }

  void disabledThumbColorChanged(Color color) {
    final theme = state.theme.copyWith(disabledThumbColor: color);
    emit(state.copyWith(theme: theme));
  }

  void overlappingShapeStrokeColorChanged(Color color) {
    final theme = state.theme.copyWith(overlappingShapeStrokeColor: color);
    emit(state.copyWith(theme: theme));
  }

  void overlayColorChanged(Color color) {
    final theme = state.theme.copyWith(overlayColor: color);
    emit(state.copyWith(theme: theme));
  }

  void valueIndicatorColorChanged(Color color) {
    final theme = state.theme.copyWith(valueIndicatorColor: color);
    emit(state.copyWith(theme: theme));
  }
}
