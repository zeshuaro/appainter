import 'package:flutter/material.dart';
import 'package:flutter_theme/models/models.dart';

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
    final size = MyTabBarIndicatorSize().enumFromString(value);
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
