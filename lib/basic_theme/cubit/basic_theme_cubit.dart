import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:meta/meta.dart';

part 'basic_theme_cubit.g.dart';
part 'basic_theme_state.dart';

class BasicThemeCubit extends Cubit<BasicThemeState> {
  BasicThemeCubit() : super(BasicThemeState());

  void primaryColorChanged(Color color) {
    final isDark = UtilService.isColorDark(color);
    final swatch = UtilService.getColorSwatch(color);
    final colorDark = swatch[kSwatchDark]!;
    final onColor = UtilService.getOnColor(color: color);
    final colorScheme = state.colorScheme.copyWith(
      primary: color,
      primaryVariant: colorDark,
      onPrimary: onColor,
      secondary: color,
      secondaryVariant: colorDark,
      onSecondary: onColor,
    );

    _emitState(
      colorScheme,
      isPrimaryColorDark: isDark,
      isAccentColorDark: isDark,
    );
  }

  void primaryColorBrightnessChanged(bool isDark) {
    final color = UtilService.getOnColor(isColorDark: isDark);
    final colorScheme = state.colorScheme.copyWith(onPrimary: color);

    _emitState(colorScheme, isPrimaryColorDark: isDark);
  }

  void primaryColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(primaryVariant: color);
    _emitState(colorScheme);
  }

  void accentColorChanged(Color color) {
    final isDark = UtilService.isColorDark(color);
    final swatch = UtilService.getColorSwatch(color);
    final onColor = UtilService.getOnColor(color: color);
    final colorScheme = state.colorScheme.copyWith(
      secondary: color,
      secondaryVariant: swatch[kSwatchDark],
      onSecondary: onColor,
    );

    _emitState(colorScheme, isAccentColorDark: isDark);
  }

  void accentColorBrightnessChanged(bool isDark) {
    final color = UtilService.getOnColor(isColorDark: isDark);
    final colorScheme = state.colorScheme.copyWith(onSecondary: color);

    _emitState(colorScheme, isAccentColorDark: isDark);
  }

  void accentColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(secondaryVariant: color);
    _emitState(colorScheme);
  }

  void surfaceColorChanged(Color color) {
    final isDark = UtilService.isColorDark(color);
    final onColor = UtilService.getOnColor(color: color);
    final colorScheme = state.colorScheme.copyWith(
      surface: color,
      onSurface: onColor,
    );

    _emitState(colorScheme, isSurfaceColorDark: isDark);
  }

  void surfaceColorBrightnessChanged(bool isDark) {
    final color = UtilService.getOnColor(isColorDark: isDark);
    final colorScheme = state.colorScheme.copyWith(onSurface: color);

    _emitState(colorScheme, isSurfaceColorDark: isDark);
  }

  void backgroundColorChanged(Color color) {
    final isDark = UtilService.isColorDark(color);
    final onColor = UtilService.getOnColor(color: color);
    final colorScheme = state.colorScheme.copyWith(
      background: color,
      onBackground: onColor,
    );

    _emitState(colorScheme, isBackgroundColorDark: isDark);
  }

  void backgroundColorBrightnessChanged(bool isDark) {
    final color = UtilService.getOnColor(isColorDark: isDark);
    final colorScheme = state.colorScheme.copyWith(onBackground: color);

    _emitState(colorScheme, isBackgroundColorDark: isDark);
  }

  void errorColorChanged(Color color) {
    final isDark = UtilService.isColorDark(color);
    final onColor = UtilService.getOnColor(color: color);
    final colorScheme = state.colorScheme.copyWith(
      error: color,
      onError: onColor,
    );

    _emitState(colorScheme, isErrorColorDark: isDark);
  }

  void errorColorBrightnessChanged(bool isDark) {
    final color = UtilService.getOnColor(isColorDark: isDark);
    final colorScheme = state.colorScheme.copyWith(onError: color);

    _emitState(colorScheme, isErrorColorDark: isDark);
  }

  void _emitState(
    ColorScheme colorScheme, {
    bool? isPrimaryColorDark,
    bool? isAccentColorDark,
    bool? isSurfaceColorDark,
    bool? isBackgroundColorDark,
    bool? isErrorColorDark,
  }) {
    emit(
      state.copyWith(
        themeData: ThemeData.from(colorScheme: colorScheme),
        colorScheme: colorScheme,
        isPrimaryColorDark: isPrimaryColorDark,
        isAccentColorDark: isAccentColorDark,
        isSurfaceColorDark: isSurfaceColorDark,
        isBackgroundColorDark: isBackgroundColorDark,
        isErrorColorDark: isErrorColorDark,
      ),
    );
  }
}
