import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/utils/utils.dart';

part 'elevated_button_theme_cubit.g.dart';
part 'elevated_button_theme_state.dart';

class ElevatedButtonThemeCubit extends Cubit<ElevatedButtonThemeState> {
  final _buttonUtils = const ButtonUtils();

  ElevatedButtonThemeCubit() : super(const ElevatedButtonThemeState());

  void themeChanged(ElevatedButtonThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void backgroundDefaultColorChanged(Color color) {
    final style = _getStyle();
    final bgColor = _buttonUtils.getBasicColor(
      style.backgroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void backgroundDisabledColorChanged(Color color) {
    final style = _getStyle();
    final bgColor = _buttonUtils.getBasicColor(
      style.backgroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(backgroundColor: bgColor));
  }

  void foregroundDefaultColorChanged(Color color) {
    final style = _getStyle();
    final fgColor = _buttonUtils.getBasicColor(
      style.foregroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void foregroundDisabledColorChanged(Color color) {
    final style = _getStyle();
    final fgColor = _buttonUtils.getBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void overlayHoveredColorChanged(Color color) {
    final style = _getStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayFocusedColorChanged(Color color) {
    final style = _getStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayPressedColorChanged(Color color) {
    final style = _getStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void shadowColorChanged(Color color) {
    final style = _getStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void defaultElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        defaultElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void disabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        disabledElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void hoveredElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        hoveredElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void focusedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        focusedElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void pressedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getStyle();
      final elevationProp = _getElevation(
        style.elevation!,
        pressedElevation: elevation,
      );

      _emitWithButtonStyle(style.copyWith(elevation: elevationProp));
    }
  }

  void _emitWithButtonStyle(ButtonStyle style) {
    emit(state.copyWith(theme: ElevatedButtonThemeData(style: style)));
  }

  ButtonStyle _getStyle() {
    final themeData = ThemeData();
    final colorScheme = themeData.colorScheme;

    return state.theme.style ??
        ElevatedButton.styleFrom(
          primary: colorScheme.primary,
          onPrimary: colorScheme.onPrimary,
          onSurface: colorScheme.onSurface,
          shadowColor: themeData.shadowColor,
          elevation: 2,
          minimumSize: const Size(64, 36),
        );
  }

  MaterialStateProperty<double?> _getElevation(
    MaterialStateProperty<double?> elevation, {
    double? defaultElevation,
    double? disabledElevation,
    double? hoveredElevation,
    double? focusedElevation,
    double? pressedElevation,
  }) {
    return MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledElevation ??
              elevation.resolve({MaterialState.disabled});
        }
        if (states.contains(MaterialState.hovered)) {
          return hoveredElevation ?? elevation.resolve({MaterialState.hovered});
        }
        if (states.contains(MaterialState.focused)) {
          return focusedElevation ?? elevation.resolve({MaterialState.focused});
        }
        if (states.contains(MaterialState.pressed)) {
          return pressedElevation ?? elevation.resolve({MaterialState.pressed});
        }

        return defaultElevation ?? elevation.resolve({});
      },
    );
  }
}
