import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/models/models.dart';

part 'app_bar_theme_cubit.g.dart';
part 'app_bar_theme_state.dart';

class AppBarThemeCubit extends Cubit<AppBarThemeState> {
  AppBarThemeCubit() : super(const AppBarThemeState());

  void themeChanged(AppBarTheme theme) => emit(state.copyWith(theme: theme));

  void backgroundColorChanged(Color color) {
    final theme = state.theme.copyWith(backgroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void foregroundColorChanged(Color color) {
    final theme = state.theme.copyWith(foregroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(elevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }

  void shadowColorChanged(Color color) {
    final theme = state.theme.copyWith(shadowColor: color);
    emit(state.copyWith(theme: theme));
  }

  void centerTitleChanged(bool isCenter) {
    final theme = state.theme.copyWith(centerTitle: isCenter);
    emit(state.copyWith(theme: theme));
  }

  void titleSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final theme = state.theme.copyWith(titleSpacing: spacing);
      emit(state.copyWith(theme: theme));
    }
  }

  void toolBarHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final theme = state.theme.copyWith(toolbarHeight: height);
      emit(state.copyWith(theme: theme));
    }
  }

  void systemUiOverlayStyleChanged(String value) {
    final style = MySystemUiOverlayStyle().enumFromString(value);
    if (style != null) {
      final theme = state.theme.copyWith(systemOverlayStyle: style);
      emit(state.copyWith(theme: theme));
    }
  }
}
