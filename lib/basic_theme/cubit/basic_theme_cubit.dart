import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'basic_theme_cubit.g.dart';
part 'basic_theme_state.dart';

@ThemeDocs(apiClassName: 'ColorScheme')
class BasicThemeCubit extends Cubit<BasicThemeState> {
  final BasicThemeService _service;

  BasicThemeCubit({BasicThemeService? service})
      : _service = service ?? BasicThemeService(),
        super(BasicThemeState());

  void themeBrightnessChanged(bool isDark) {
    emit(
      state.copyWith(
        seedColor: BasicThemeState.defaultSeedColor,
        colorScheme: BasicThemeState.getColorScheme(isDark),
        isDark: isDark,
      ),
    );
  }

  void themeRandomized([int? seed]) {
    final colorScheme = randomColorScheme(
      seed: seed ?? DateTime.now().millisecondsSinceEpoch,
      isDark: state.isDark,
      shouldPrint: false,
    );
    emit(
      state.copyWith(seedColor: colorScheme.primary, colorScheme: colorScheme),
    );
  }

  void themeReset() {
    emit(
      state.copyWith(
        seedColor: BasicThemeState.defaultSeedColor,
        colorScheme: BasicThemeState.getColorScheme(state.isDark),
      ),
    );
  }

  void seedColorChanged(Color color) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: state.brightness,
    );
    emit(state.copyWith(seedColor: color, colorScheme: colorScheme));
  }

  void primaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      primary: color,
      onPrimary: _service.getOnKeyColor(color),
      primaryContainer: _service.getContainerColor(color),
      onPrimaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onPrimaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onPrimary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void primaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      primaryContainer: color,
      onPrimaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onPrimaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onPrimaryContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      secondary: color,
      onSecondary: _service.getOnKeyColor(color),
      secondaryContainer: _service.getContainerColor(color),
      onSecondaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSecondaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSecondary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      secondaryContainer: color,
      onSecondaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSecondaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSecondaryContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void tertiaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      tertiary: color,
      onTertiary: _service.getOnKeyColor(color),
      tertiaryContainer: _service.getContainerColor(color),
      onTertiaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onTertiaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onTertiary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void tertiaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      tertiaryContainer: color,
      onTertiaryContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onTertiaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onTertiaryContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void errorColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      error: color,
      onError: _service.getOnKeyColor(color),
      errorContainer: _service.getContainerColor(color),
      onErrorContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onErrorColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onError: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void errorContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      errorContainer: color,
      onErrorContainer: _service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onErrorContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onErrorContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      surface: color,
      onSurface: _service.getOnNeutralColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSurfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSurface: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceContainerHighestColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      surfaceContainerHighest: color,
      onSurfaceVariant: _service.getOnSurfaceVariantColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSurfaceVariantColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSurfaceVariant: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void outlineColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(outline: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void shadowColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(shadow: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void inverseSurfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(inverseSurface: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onInverseSurfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onInverseSurface: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void inversePrimaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(inversePrimary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void useMaterial3Changed(bool useMaterial3) {
    emit(state.copyWith(useMaterial3: useMaterial3));
  }
}
