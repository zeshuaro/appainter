import 'package:appainter/simple_theme/simple_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'simple_theme_cubit.g.dart';
part 'simple_theme_state.dart';

class SimpleThemeCubit extends Cubit<SimpleThemeState> {
  final SimpleThemeService service;

  SimpleThemeCubit({SimpleThemeService? service})
      : service = service ?? const SimpleThemeService(),
        super(SimpleThemeState());

  void themeBrightnessChanged(bool isDark) {
    emit(state.copyWith(
      colorScheme: SimpleThemeState.getColorScheme(isDark: isDark),
      isDark: isDark,
    ));
  }

  void themeRandomized([int? seed]) {
    emit(state.copyWith(
      colorScheme: randomColorScheme(
        seed: seed ?? DateTime.now().millisecondsSinceEpoch,
        isDark: state.isDark,
        shouldPrint: false,
      ),
    ));
  }

  void themeReset() {
    emit(state.copyWith(
      seedColor: SimpleThemeState.defaultSeedColor,
      colorScheme: SimpleThemeState.getColorScheme(isDark: state.isDark),
    ));
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
      onPrimary: service.getOnKeyColor(color),
      primaryContainer: service.getContainerColor(color),
      onPrimaryContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      secondary: color,
      onSecondary: service.getOnKeyColor(color),
      secondaryContainer: service.getContainerColor(color),
      onSecondaryContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void tertiaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      tertiary: color,
      onTertiary: service.getOnKeyColor(color),
      tertiaryContainer: service.getContainerColor(color),
      onTertiaryContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void neutralColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      background: color,
      onBackground: service.getOnNeutralColor(color),
      surface: color,
      onSurface: service.getOnNeutralColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }
}
