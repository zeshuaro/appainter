import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/services/services.dart';

part 'tab_bar_theme_cubit.g.dart';
part 'tab_bar_theme_state.dart';

class TabBarThemeCubit extends Cubit<TabBarThemeState> {
  TabBarThemeCubit() : super(const TabBarThemeState());

  void labelColorChanged(Color color) {
    final theme = state.theme.copyWith(labelColor: color);
    emit(state.copyWith(theme: theme));
  }

  void unselectedLabelColorChanged(Color color) {
    final theme = state.theme.copyWith(unselectedLabelColor: color);
    emit(state.copyWith(theme: theme));
  }

  void indicatorSizeChanged(String value) {
    final size = UtilService.stringToEnum(TabBarIndicatorSize.values, value);
    if (size != null) {
      final theme = state.theme.copyWith(indicatorSize: size);
      emit(state.copyWith(theme: theme));
    }
  }
}
