// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'advanced_theme_cubit.dart';

extension InputDecorationCubit on AdvancedThemeCubit {
  void inputDecorationFloatingLabelBehaviorChanged(String value) {
    final behavior = EnumToString.fromString(
      FloatingLabelBehavior.values,
      value,
    );
    if (behavior != null) {
      final theme = state.themeData.inputDecorationTheme.copyWith(
        floatingLabelBehavior: behavior,
      );
      _emitStateWithIconTheme(theme);
    }
  }

  void inputDecorationFillColorChanged(Color color) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      fillColor: color,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationHoverColorChanged(Color color) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      hoverColor: color,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationAlignLabelWithHintChanged(bool value) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      alignLabelWithHint: value,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationFilledChanged(bool value) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      filled: value,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationIsCollapsedChanged(bool value) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      isCollapsed: value,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationIsDenseChanged(bool value) {
    final theme = state.themeData.inputDecorationTheme.copyWith(
      isDense: value,
    );
    _emitStateWithIconTheme(theme);
  }

  void inputDecorationErrorMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.themeData.inputDecorationTheme.copyWith(
        errorMaxLines: maxLines,
      );
      _emitStateWithIconTheme(theme);
    }
  }

  void inputDecorationHelperMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.themeData.inputDecorationTheme.copyWith(
        helperMaxLines: maxLines,
      );
      _emitStateWithIconTheme(theme);
    }
  }

  void _emitStateWithIconTheme(InputDecorationTheme theme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(inputDecorationTheme: theme),
      ),
    );
  }
}
