import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'abstract_button_style_cubit.g.dart';
part 'button_style_state.dart';

@ThemeDocs(apiClassName: 'ButtonStyle')
abstract class AbstractButtonStyleCubit extends Cubit<ButtonStyleState> {
  AbstractButtonStyleCubit({required this.colorThemeCubit})
      : super(const ButtonStyleState());

  final ColorThemeCubit colorThemeCubit;

  ButtonStyle getDefaultStyle(ColorScheme colorScheme);

  void styleChanged(ButtonStyle? style) {
    emit(
      style != null
          ? state.copyWith(style: style)
          : state.copyWithNull(style: true),
    );
  }

  void backgroundDefaultColorChanged(Color color) {
    final bgColor = _getBasicColor(
      _style.backgroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(backgroundColor: bgColor));
  }

  void backgroundDisabledColorChanged(Color color) {
    final bgColor = _getBasicColor(
      _style.backgroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(backgroundColor: bgColor));
  }

  void foregroundDefaultColorChanged(Color color) {
    final fgColor = _getBasicColor(
      _style.foregroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(foregroundColor: fgColor));
  }

  void foregroundDisabledColorChanged(Color color) {
    final fgColor = _getBasicColor(
      _style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(foregroundColor: fgColor));
  }

  void overlayHoveredColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      _style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(overlayColor: overlayColor));
  }

  void overlayFocusedColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      _style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(overlayColor: overlayColor));
  }

  void overlayPressedColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      _style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(_style.copyWith(overlayColor: overlayColor));
  }

  void shadowColorChanged(Color color) {
    _emitWithButtonStyle(
      _style.copyWith(shadowColor: MaterialStateProperty.all(color)),
    );
  }

  void defaultElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        _style.elevation!,
        defaultElevation: elevation,
      );

      _emitWithButtonStyle(_style.copyWith(elevation: elevationProp));
    }
  }

  void disabledElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        _style.elevation!,
        disabledElevation: elevation,
      );

      _emitWithButtonStyle(_style.copyWith(elevation: elevationProp));
    }
  }

  void hoveredElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        _style.elevation!,
        hoveredElevation: elevation,
      );

      _emitWithButtonStyle(_style.copyWith(elevation: elevationProp));
    }
  }

  void focusedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        _style.elevation!,
        focusedElevation: elevation,
      );

      _emitWithButtonStyle(_style.copyWith(elevation: elevationProp));
    }
  }

  void pressedElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = _getElevation(
        _style.elevation!,
        pressedElevation: elevation,
      );

      _emitWithButtonStyle(_style.copyWith(elevation: elevationProp));
    }
  }

  ButtonStyle get _style {
    return state.style ?? getDefaultStyle(colorThemeCubit.state.colorScheme);
  }

  void _emitWithButtonStyle(ButtonStyle style) {
    emit(state.copyWith(style: style));
  }

  MaterialStateProperty<Color?> _getBasicColor(
    MaterialStateProperty<Color?> color, {
    Color? defaultColor,
    Color? disabledColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor ?? color.resolve({MaterialState.disabled});
      }
      return defaultColor ?? color.resolve({});
    });
  }

  MaterialStateProperty<Color?> _getOverlayColor(
    MaterialStateProperty<Color?> overlayColor, {
    Color? hoveredColor,
    Color? focusedColor,
    Color? pressedColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return hoveredColor ?? overlayColor.resolve({MaterialState.hovered});
      }
      if (states.contains(MaterialState.focused)) {
        return focusedColor ?? overlayColor.resolve({MaterialState.focused});
      }
      if (states.contains(MaterialState.pressed)) {
        return pressedColor ?? overlayColor.resolve({MaterialState.pressed});
      }
      return null;
    });
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
