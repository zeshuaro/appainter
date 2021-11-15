import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/cubit/buttons/utils.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension OutlinedButtonCubit on AdvancedThemeCubit {
  void outlinedButtonBackgroundColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void outlinedButtonForegroundDefaultColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = getButtonBasicColor(
      style.foregroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void outlinedButtonForegroundDisabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = getButtonBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void outlinedButtonOverlayHoveredColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void outlinedButtonOverlayFocusedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void outlinedButtonOverlayPressedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void outlinedButtonShadowColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void outlinedButtonElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = MaterialStateProperty.all(elevation);
      final style = _getButtonStyle().copyWith(
        elevation: elevationProp,
      );

      _emitWithButtonStyle(style);
    }
  }

  void _emitWithButtonStyle(ButtonStyle style) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return state.themeData.outlinedButtonTheme.style ??
        OutlinedButton.styleFrom(
          primary: state.themeData.colorScheme.primary,
          onSurface: state.themeData.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          shadowColor: state.themeData.shadowColor,
          elevation: kOutlinedButtonElevation,
          minimumSize: kBtnMinSize,
        );
  }
}
