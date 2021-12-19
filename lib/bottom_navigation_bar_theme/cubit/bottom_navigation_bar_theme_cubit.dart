import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/services/util_service.dart';

part 'bottom_navigation_bar_theme_cubit.g.dart';
part 'bottom_navigation_bar_theme_state.dart';

class BottomNavigationBarThemeCubit
    extends Cubit<BottomNavigationBarThemeState> {
  BottomNavigationBarThemeCubit()
      : super(const BottomNavigationBarThemeState());

  void themeChanged(BottomNavigationBarThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void typeChanged(String value) {
    final type = UtilService.stringToEnum(
      BottomNavigationBarType.values,
      value,
    );
    final showLabels = type == BottomNavigationBarType.shifting ? false : true;
    final theme = state.theme.copyWith(
      type: type,
      showUnselectedLabels: showLabels,
    );
    emit(state.copyWith(theme: theme));
  }

  void backgroundColorChanged(Color color) {
    final theme = state.theme.copyWith(backgroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void selectedItemColorChanged(Color color) {
    final theme = state.theme.copyWith(selectedItemColor: color);
    emit(state.copyWith(theme: theme));
  }

  void unselectedItemColorChanged(Color color) {
    final theme = state.theme.copyWith(unselectedItemColor: color);
    emit(state.copyWith(theme: theme));
  }

  void showSelectedLabelsChanged(bool showSelectedLabels) {
    final theme = state.theme.copyWith(showSelectedLabels: showSelectedLabels);
    emit(state.copyWith(theme: theme));
  }

  void showUnselectedLabelsChanged(bool showUnselectedLabels) {
    final theme = state.theme.copyWith(
      showUnselectedLabels: showUnselectedLabels,
    );
    emit(state.copyWith(theme: theme));
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(elevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }
}
