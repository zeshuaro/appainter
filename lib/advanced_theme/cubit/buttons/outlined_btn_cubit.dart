import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension OutlinedBtnCubit on AdvancedThemeCubit {
  void outlinedBtnBgColorChanged(Color color) {
    final style = _getOutlinedBtnStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    );
    _emitStateWithoutlinedBtnStyle(style);
  }

  void outlinedBtnFgColorChanged(Color color) {
    final fgColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return state.themeData.colorScheme.onSurface.withOpacity(0.38);
      }
      return color;
    });
    final style = _getOutlinedBtnStyle().copyWith(foregroundColor: fgColor);
    _emitStateWithoutlinedBtnStyle(style);
  }

  void outlinedBtnOverlayColorChanged(Color color) {
    final overlayColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return color.withOpacity(0.04);
      }
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return color.withOpacity(0.12);
      }
      return null;
    });
    final style = _getOutlinedBtnStyle().copyWith(overlayColor: overlayColor);
    _emitStateWithoutlinedBtnStyle(style);
  }

  void outlinedBtnShadowColorChanged(Color color) {
    final style = _getOutlinedBtnStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitStateWithoutlinedBtnStyle(style);
  }

  void outlinedBtnElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProperty = MaterialStateProperty.resolveWith<double>(
        (_) => elevation,
      );
      final style = _getOutlinedBtnStyle().copyWith(
        elevation: elevationProperty,
      );
      _emitStateWithoutlinedBtnStyle(style);
    }
  }

  void outlinedBtnMinWidthChanged(String value) {
    final width = double.tryParse(value);
    if (width != null) {
      final size =
          _getOutlinedBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getOutlinedBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(width, size.height)),
      );
      _emitStateWithoutlinedBtnStyle(style);
    }
  }

  void outlinedBtnMinHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final size =
          _getOutlinedBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getOutlinedBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(size.width, height)),
      );
      _emitStateWithoutlinedBtnStyle(style);
    }
  }

  void _emitStateWithoutlinedBtnStyle(ButtonStyle style) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getOutlinedBtnStyle() {
    return state.themeData.outlinedButtonTheme.style ??
        OutlinedButton.styleFrom();
  }
}
