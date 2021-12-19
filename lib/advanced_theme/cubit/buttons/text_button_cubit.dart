// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/cubit/buttons/utils.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension TextButtonCubit on AdvancedThemeCubit {
  void textButtonBackgroundColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void textButtonForegroundDefaultColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = getButtonBasicColor(
      style.foregroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void textButtonForegroundDisabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = getButtonBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void textButtonOverlayHoveredColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void textButtonOverlayFocusedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void textButtonOverlayPressedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = getButtonOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void textButtonShadowColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void textButtonElevationChanged(String value) {
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
          textButtonTheme: TextButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return state.themeData.textButtonTheme.style ??
        TextButton.styleFrom(
          primary: state.themeData.colorScheme.primary,
          onSurface: state.themeData.colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          shadowColor: state.themeData.shadowColor,
          elevation: kTextButtonElevation,
          minimumSize: kBtnMinSize,
        );
  }
}
