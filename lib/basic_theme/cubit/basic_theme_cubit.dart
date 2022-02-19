import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/simple_theme/simple_theme.dart';
import 'package:flutter/material.dart';

class BasicThemeCubit extends SimpleThemeCubit {
  BasicThemeCubit({BasicThemeService? service})
      : super(service: service ?? const BasicThemeService());

  void onPrimaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onPrimary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void primaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      primaryContainer: color,
      onPrimaryContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onPrimaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onPrimaryContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSecondaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSecondary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void secondaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      secondaryContainer: color,
      onSecondaryContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSecondaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSecondaryContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onTertiaryColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onTertiary: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void tertiaryContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      tertiaryContainer: color,
      onTertiaryContainer: service.getOnContainerColor(color),
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
      onError: service.getOnKeyColor(color),
      errorContainer: service.getContainerColor(color),
      onErrorContainer: service.getOnContainerColor(color),
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
      onErrorContainer: service.getOnContainerColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onErrorContainerColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onErrorContainer: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void backgroundColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      background: color,
      onBackground: service.getOnNeutralColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onBackgroundColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onBackground: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      surface: color,
      onSurface: service.getOnNeutralColor(color),
    );
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void onSurfaceColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(onSurface: color);
    emit(state.copyWith(colorScheme: colorScheme));
  }

  void surfaceVariantColorChanged(Color color) {
    final colorScheme = state.colorScheme.copyWith(
      surfaceVariant: color,
      onSurfaceVariant: service.getOnSurfaceVariantColor(color),
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
}
