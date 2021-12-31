import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'basic_theme_cubit.g.dart';
part 'basic_theme_state.dart';

class BasicThemeCubit extends Cubit<BasicThemeState> {
  BasicThemeCubit() : super(const BasicThemeState());

  void randomizedThemeRequested([int? seed]) {
    emit(state.copyWith(
      colorScheme: randomColorSchemeLight(
        seed: seed ?? DateTime.now().millisecondsSinceEpoch,
        shouldPrint: false,
      ),
    ));
  }

  void defaultThemeRequested() => emit(const BasicThemeState());

  void primaryColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final colorDark = swatch[kSwatchDark]!;
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      primary: color,
      primaryVariant: colorDark,
      onPrimary: onColor,
      secondary: color,
      secondaryVariant: colorDark,
      onSecondary: onColor,
    );

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void primaryColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onPrimary: color);

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void primaryColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(primaryVariant: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      secondary: color,
      secondaryVariant: swatch[kSwatchDark],
      onSecondary: onColor,
    );

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onSecondary: color);

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(secondaryVariant: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      surface: color,
      onSurface: onColor,
    );

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onSurface: color);

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void backgroundColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      background: color,
      onBackground: onColor,
    );

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void backgroundColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onBackground: color);

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void errorColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      error: color,
      onError: onColor,
    );

    emit(state.copyWith(colorScheme: colorScheme));
  }

  void errorColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onError: color);

    emit(state.copyWith(colorScheme: colorScheme));
  }

  Color _getOnColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  Color _getLightOrDarkColor(bool isDark) {
    return isDark ? Colors.black : Colors.white;
  }
}
