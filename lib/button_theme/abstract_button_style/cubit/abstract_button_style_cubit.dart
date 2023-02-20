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

  ButtonStyle get style {
    return state.style ?? getDefaultStyle(colorThemeCubit.state.colorScheme);
  }

  void styleChanged(ButtonStyle? style) {
    emit(
      style != null
          ? state.copyWith(style: style)
          : state.copyWithNull(style: true),
    );
  }

  void foregroundDefaultColorChanged(Color color) {
    final fgColor = getBasicColor(
      style.foregroundColor!,
      defaultColor: color,
    );

    emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void foregroundDisabledColorChanged(Color color) {
    final fgColor = getBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void overlayHoveredColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayFocusedColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayPressedColorChanged(Color color) {
    final overlayColor = _getOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void shadowColorChanged(Color color) {
    emitWithButtonStyle(
      style.copyWith(shadowColor: MaterialStateProperty.all(color)),
    );
  }

  void emitWithButtonStyle(ButtonStyle style) {
    emit(state.copyWith(style: style));
  }

  MaterialStateProperty<Color?> getBasicColor(
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
}
