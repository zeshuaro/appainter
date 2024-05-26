import 'package:appainter/button_theme/button_theme.dart';
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
  final OutlinedBorderEnum _outlinedBorderEnum = OutlinedBorderEnum();

  OutlinedBorder get defaultShape;

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
      style.copyWith(shadowColor: WidgetStateProperty.all(color)),
    );
  }

  void shapeChanged(String? value) {
    final border = _outlinedBorderEnum.fromString(value);
    if (border != null) {
      emitWithButtonStyle(
        style.copyWith(
          shape: WidgetStateProperty.all(border),
        ),
      );
    }
  }

  void shapeBorderRadiusChanged(String value) {
    final radius = double.tryParse(value);
    final border = style.shape?.resolve({});

    if (radius != null && border != null) {
      late final OutlinedBorder? newBorder;
      if (border is BeveledRectangleBorder) {
        newBorder = border.copyWith(
          borderRadius: BorderRadius.circular(radius),
        );
      } else if (border is ContinuousRectangleBorder) {
        newBorder = border.copyWith(
          borderRadius: BorderRadius.circular(radius),
        );
      } else if (border is RoundedRectangleBorder) {
        newBorder = border.copyWith(
          borderRadius: BorderRadius.circular(radius),
        );
      } else {
        newBorder = null;
      }

      if (newBorder != null) {
        emitWithButtonStyle(
          style.copyWith(
            shape: WidgetStateProperty.all(newBorder),
          ),
        );
      }
    }
  }

  void emitWithButtonStyle(ButtonStyle style) {
    emit(state.copyWith(style: style));
  }

  WidgetStateProperty<Color?> getBasicColor(
    WidgetStateProperty<Color?> color, {
    Color? defaultColor,
    Color? disabledColor,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledColor ?? color.resolve({WidgetState.disabled});
      }
      return defaultColor ?? color.resolve({});
    });
  }

  WidgetStateProperty<Color?> _getOverlayColor(
    WidgetStateProperty<Color?> overlayColor, {
    Color? hoveredColor,
    Color? focusedColor,
    Color? pressedColor,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return hoveredColor ?? overlayColor.resolve({WidgetState.hovered});
      }
      if (states.contains(WidgetState.focused)) {
        return focusedColor ?? overlayColor.resolve({WidgetState.focused});
      }
      if (states.contains(WidgetState.pressed)) {
        return pressedColor ?? overlayColor.resolve({WidgetState.pressed});
      }
      return null;
    });
  }
}
