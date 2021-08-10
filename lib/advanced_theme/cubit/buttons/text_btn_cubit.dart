import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension TextBtnCubit on AdvancedThemeCubit {
  void textBtnBgColorChanged(Color color) {
    final style = _getTextBtnStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    );
    _emitStateWithtextBtnStyle(style);
  }

  void textBtnFgColorChanged(Color color) {
    final fgColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled))
        return state.themeData.colorScheme.onSurface.withOpacity(0.38);
      return color;
    });
    final style = _getTextBtnStyle().copyWith(foregroundColor: fgColor);
    _emitStateWithtextBtnStyle(style);
  }

  void textBtnOverlayColorChanged(Color color) {
    final overlayColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered))
        return color.withOpacity(0.04);
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed))
        return color.withOpacity(0.12);
      return null;
    });
    final style = _getTextBtnStyle().copyWith(overlayColor: overlayColor);
    _emitStateWithtextBtnStyle(style);
  }

  void textBtnShadowColorChanged(Color color) {
    final style = _getTextBtnStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitStateWithtextBtnStyle(style);
  }

  void textBtnElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final style = _getTextBtnStyle().copyWith(
        elevation: MaterialStateProperty.all(elevation),
      );
      _emitStateWithtextBtnStyle(style);
    }
  }

  void textBtnMinWidthChanged(String value) {
    final width = double.tryParse(value);
    if (width != null) {
      final size =
          _getTextBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getTextBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(width, size.height)),
      );
      _emitStateWithtextBtnStyle(style);
    }
  }

  void textBtnMinHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final size =
          _getTextBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getTextBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(size.width, height)),
      );
      _emitStateWithtextBtnStyle(style);
    }
  }

  void _emitStateWithtextBtnStyle(ButtonStyle style) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          textButtonTheme: TextButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getTextBtnStyle() {
    return state.themeData.textButtonTheme.style ?? TextButton.styleFrom();
  }
}
