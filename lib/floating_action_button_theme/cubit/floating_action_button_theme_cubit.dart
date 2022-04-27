import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'floating_action_button_theme_cubit.g.dart';
part 'floating_action_button_theme_state.dart';

@ThemeDocs(apiClassName: 'FloatingActionButtonThemeData')
class FloatingActionButtonThemeCubit
    extends Cubit<FloatingActionButtonThemeState> {
  FloatingActionButtonThemeCubit()
      : super(const FloatingActionButtonThemeState());

  void themeChanged(FloatingActionButtonThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void backgroundColorChanged(Color color) {
    final theme = state.theme.copyWith(backgroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void foregroundColorChanged(Color color) {
    final theme = state.theme.copyWith(foregroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void focusColorChanged(Color color) {
    final theme = state.theme.copyWith(focusColor: color);
    emit(state.copyWith(theme: theme));
  }

  void hoverColorChanged(Color color) {
    final theme = state.theme.copyWith(hoverColor: color);
    emit(state.copyWith(theme: theme));
  }

  void splashColorChanged(Color color) {
    final theme = state.theme.copyWith(splashColor: color);
    emit(state.copyWith(theme: theme));
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(elevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }

  void disabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(disabledElevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }

  void focusElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(focusElevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }

  void highlightElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(highlightElevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }

  void hoverElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(hoverElevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }
}
