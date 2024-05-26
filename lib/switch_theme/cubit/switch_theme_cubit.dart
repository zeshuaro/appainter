import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/utils/utils.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'switch_theme_cubit.g.dart';
part 'switch_theme_state.dart';

@ThemeDocs(
  apiClassName: 'SwitchThemeData',
  extraPropertyTypes: {'MaterialTapTargetSize'},
)
class SwitchThemeCubit extends Cubit<SwitchThemeState> {
  final ColorThemeCubit colorThemeCubit;

  SwitchThemeCubit({required this.colorThemeCubit})
      : super(const SwitchThemeState());

  final _utils = const SelectionUtils();

  void themeChanged(SwitchThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void thumbDefaultColorChanged(Color color) {
    _emitWithNewThumbColor(defaultColor: color);
  }

  void thumbSelectedColorChanged(Color color) {
    _emitWithNewThumbColor(selectedColor: color);
  }

  void thumbDisabledColorChanged(Color color) {
    _emitWithNewThumbColor(disabledColor: color);
  }

  void trackDefaultColorChanged(Color color) {
    _emitWithNewTrackColor(defaultColor: color);
  }

  void trackSelectedColorChanged(Color color) {
    _emitWithNewTrackColor(selectedColor: color);
  }

  void trackDisabledColorChanged(Color color) {
    _emitWithNewTrackColor(disabledColor: color);
  }

  void materialTapTargetSize(String? value) {
    final size = UtilService.stringToEnum(MaterialTapTargetSize.values, value);
    if (size != null) {
      final theme = state.theme.copyWith(materialTapTargetSize: size);
      emit(state.copyWith(theme: theme));
    }
  }

  void overlayPressedColorChanged(Color color) {
    _emitWithNewOverlayColor(pressedColor: color);
  }

  void overlayHoveredColorChanged(Color color) {
    _emitWithNewOverlayColor(hoveredColor: color);
  }

  void overlayFocusedColorChanged(Color color) {
    _emitWithNewOverlayColor(focusedColor: color);
  }

  void splashRadiusChanged(String value) {
    final radius = double.tryParse(value);
    if (radius != null) {
      final theme = state.theme.copyWith(splashRadius: radius);
      emit(state.copyWith(theme: theme));
    }
  }

  void _emitWithNewThumbColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final color = _utils.getBasicColor(
      state.theme.thumbColor ?? _defaultThumbColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );
    final theme = state.theme.copyWith(thumbColor: color);
    emit(state.copyWith(theme: theme));
  }

  void _emitWithNewTrackColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final color = _utils.getBasicColor(
      state.theme.trackColor ?? _defaultTrackColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );
    final theme = state.theme.copyWith(trackColor: color);
    emit(state.copyWith(theme: theme));
  }

  void _emitWithNewOverlayColor({
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    final color = _utils.getOverlayColor(
      state.theme.overlayColor ?? _defaultOverlayColor,
      pressedColor: pressedColor,
      hoveredColor: hoveredColor,
      focusedColor: focusedColor,
    );
    final theme = state.theme.copyWith(overlayColor: color);
    emit(state.copyWith(theme: theme));
  }

  WidgetStateProperty<Color> get _defaultThumbColor {
    final colorThemeState = colorThemeCubit.state;
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return colorThemeState.primaryColor;
      }
      return Colors.grey.shade50;
    });
  }

  WidgetStateProperty<Color> get _defaultTrackColor {
    final colorThemeState = colorThemeCubit.state;
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.black12;
      }
      if (states.contains(WidgetState.selected)) {
        return colorThemeState.primaryColor.withAlpha(0x80);
      }
      return const Color(0x52000000);
    });
  }

  WidgetStateProperty<Color?> get _defaultOverlayColor {
    final colorThemeState = colorThemeCubit.state;
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return colorThemeState.primaryColor.withAlpha(
          kRadialReactionAlpha,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return colorThemeState.hoverColor;
      }
      if (states.contains(WidgetState.focused)) {
        return colorThemeState.focusColor;
      }
      return null;
    });
  }
}
