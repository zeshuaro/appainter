// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../advanced_theme_cubit.dart';

extension BottomNavBarCubit on AdvancedThemeCubit {
  void bottomNavBarTypeChanged(String value) {
    final type = EnumToString.fromString(BottomNavigationBarType.values, value);
    final showUnselectedLabels =
        type == BottomNavigationBarType.shifting ? false : true;
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
