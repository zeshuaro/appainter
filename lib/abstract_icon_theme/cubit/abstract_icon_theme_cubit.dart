import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'abstract_icon_theme_cubit.g.dart';
part 'icon_theme_state.dart';

abstract class AbstractIconThemeCubit extends Cubit<IconThemeState> {
  AbstractIconThemeCubit() : super(const IconThemeState());

  void themeChanged(IconThemeData theme) => emit(state.copyWith(theme: theme));

  void colorChanged(Color color) {
    final theme = state.theme.copyWith(color: color);
    emit(state.copyWith(theme: theme));
  }

  void sizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final theme = state.theme.copyWith(size: size);
      emit(state.copyWith(theme: theme));
    }
  }

  void opacityChanged(String value) {
    final opacity = double.tryParse(value);
    if (opacity != null) {
      final theme = state.theme.copyWith(opacity: opacity);
      emit(state.copyWith(theme: theme));
    }
  }
}
