import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/services/services.dart';

part 'input_decoration_theme_cubit.g.dart';
part 'input_decoration_theme_state.dart';

class InputDecorationThemeCubit extends Cubit<InputDecorationThemeState> {
  InputDecorationThemeCubit() : super(const InputDecorationThemeState());

  void themeChanged(InputDecorationTheme theme) {
    emit(state.copyWith(theme: theme));
  }

  void floatingLabelBehaviorChanged(String value) {
    final behavior = UtilService.stringToEnum(
      FloatingLabelBehavior.values,
      value,
    );
    if (behavior != null) {
      final theme = state.theme.copyWith(floatingLabelBehavior: behavior);
      emit(state.copyWith(theme: theme));
    }
  }

  void fillColorChanged(Color color) {
    final theme = state.theme.copyWith(fillColor: color);
    emit(state.copyWith(theme: theme));
  }

  void hoverColorChanged(Color color) {
    final theme = state.theme.copyWith(hoverColor: color);
    emit(state.copyWith(theme: theme));
  }

  void alignLabelWithHintChanged(bool value) {
    final theme = state.theme.copyWith(alignLabelWithHint: value);
    emit(state.copyWith(theme: theme));
  }

  void filledChanged(bool value) {
    final theme = state.theme.copyWith(filled: value);
    emit(state.copyWith(theme: theme));
  }

  void isCollapsedChanged(bool value) {
    final theme = state.theme.copyWith(isCollapsed: value);
    emit(state.copyWith(theme: theme));
  }

  void isDenseChanged(bool value) {
    final theme = state.theme.copyWith(isDense: value);
    emit(state.copyWith(theme: theme));
  }

  void errorMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.theme.copyWith(errorMaxLines: maxLines);
      emit(state.copyWith(theme: theme));
    }
  }

  void helperMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.theme.copyWith(helperMaxLines: maxLines);
      emit(state.copyWith(theme: theme));
    }
  }
}
