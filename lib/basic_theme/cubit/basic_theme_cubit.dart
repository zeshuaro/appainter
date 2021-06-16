import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:meta/meta.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'basic_theme_cubit.g.dart';
part 'basic_theme_state.dart';

class BasicThemeCubit extends Cubit<BasicThemeState> {
  BasicThemeCubit() : super(BasicThemeState());

  void randomizedThemeRequested() {
    _emitState(
      randomColorSchemeLight(seed: DateTime.now().millisecondsSinceEpoch),
    );
  }

  void defaultThemeRequested() => _emitState(const ColorScheme.light());

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

    _emitState(colorScheme);
  }

  void primaryColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onPrimary: color);

    _emitState(colorScheme);
  }

  void primaryColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(primaryVariant: color);
    _emitState(colorScheme);
  }

  void accentColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      secondary: color,
      secondaryVariant: swatch[kSwatchDark],
      onSecondary: onColor,
    );

    _emitState(colorScheme);
  }

  void accentColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onSecondary: color);

    _emitState(colorScheme);
  }

  void accentColorDarkChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(secondaryVariant: color);
    _emitState(colorScheme);
  }

  void surfaceColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      surface: color,
      onSurface: onColor,
    );

    _emitState(colorScheme);
  }

  void surfaceColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onSurface: color);

    _emitState(colorScheme);
  }

  void bgColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      background: color,
      onBackground: onColor,
    );

    _emitState(colorScheme);
  }

  void bgColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onBackground: color);

    _emitState(colorScheme);
  }

  void errorColorChanged(Color color) {
    final onColor = _getOnColor(color);
    final colorScheme = state.colorScheme.copyWith(
      error: color,
      onError: onColor,
    );

    _emitState(colorScheme);
  }

  void errorColorBrightnessChanged(bool isDark) {
    final color = _getLightOrDarkColor(isDark);
    final colorScheme = state.colorScheme.copyWith(onError: color);

    _emitState(colorScheme);
  }

  Color _getOnColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  Color _getLightOrDarkColor(bool isDark) {
    return isDark ? Colors.black : Colors.white;
  }

  void _emitState(ColorScheme colorScheme) {
    emit(
      state.copyWith(
        themeData: ThemeData.from(colorScheme: colorScheme),
        colorScheme: colorScheme,
      ),
    );
  }
}
