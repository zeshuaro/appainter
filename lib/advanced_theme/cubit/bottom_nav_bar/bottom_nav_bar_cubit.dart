import 'package:flutter/material.dart';
import 'package:flutter_theme/models/models.dart';

import '../advanced_theme_cubit.dart';

part 'bottom_nav_bar_icon_theme_cubit.dart';

extension BottomNavBarCubit on AdvancedThemeCubit {
  void bottomNavBarTypeChanged(String value) {
    final type = MyBottomNavBarType().enumFromString(value);
    final showUnselectedLabels =
        type == BottomNavigationBarType.shifting ? false : null;
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      type: type,
      showUnselectedLabels: showUnselectedLabels,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarBgColorChanged(Color color) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      backgroundColor: color,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarSelectedItemColorChanged(Color color) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      selectedItemColor: color,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarUnselectedItemColorChanged(Color color) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      unselectedItemColor: color,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarShowSelectedLabelsChanged(bool showSelectedLabels) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      showSelectedLabels: showSelectedLabels,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarShowUnselectedLabelsChanged(bool showUnselectedLabels) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      showUnselectedLabels: showUnselectedLabels,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void bottomNavBarElevationChanged(String value) {
    final elevation = double.tryParse(value);
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      elevation: elevation,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void _emitStateWithBottomNavBarTheme(BottomNavigationBarThemeData theme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(bottomNavigationBarTheme: theme),
      ),
    );
  }
}
