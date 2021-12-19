// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../advanced_theme_cubit.dart';

extension TabBarCubit on AdvancedThemeCubit {
  void tabBarLabelColorChanged(Color color) {
    final theme = state.themeData.tabBarTheme.copyWith(
      labelColor: color,
    );
    _emitStateWithTabBarTheme(theme);
  }

  void tabBarUnselectedLabelColorChanged(Color color) {
    final theme = state.themeData.tabBarTheme.copyWith(
      unselectedLabelColor: color,
    );
    _emitStateWithTabBarTheme(theme);
  }

  void tabBarIndicatorSizeChanged(String value) {
    final size = EnumToString.fromString(TabBarIndicatorSize.values, value);
    final theme = state.themeData.tabBarTheme.copyWith(indicatorSize: size);
    _emitStateWithTabBarTheme(theme);
  }

  void _emitStateWithTabBarTheme(TabBarTheme theme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(tabBarTheme: theme),
      ),
    );
  }
}
