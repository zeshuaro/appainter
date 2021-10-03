import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

import '../advanced_theme_cubit.dart';

extension ElevatedBtnCubit on AdvancedThemeCubit {
  void elevatedBtnBgColorChanged(Color color) {
    final bgColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return state.themeData.colorScheme.onSurface.withOpacity(0.12);
      }
      return color;
    });
    final style = _getElevatedBtnStyle().copyWith(backgroundColor: bgColor);
    _emitStateWithElevatedBtnStyle(style);
  }

  void elevatedBtnFgColorChanged(Color color) {
    final fgColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return state.themeData.colorScheme.onSurface.withOpacity(0.38);
      }
      return color;
    });
    final style = _getElevatedBtnStyle().copyWith(foregroundColor: fgColor);
    _emitStateWithElevatedBtnStyle(style);
  }

  void elevatedBtnOverlayColorChanged(Color color) {
    final overlayColor = MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return color.withOpacity(0.08);
      }
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return color.withOpacity(0.24);
      }
      return null;
    });
    final style = _getElevatedBtnStyle().copyWith(overlayColor: overlayColor);
    _emitStateWithElevatedBtnStyle(style);
  }

  void elevatedBtnShadowColorChanged(Color color) {
    final style = _getElevatedBtnStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitStateWithElevatedBtnStyle(style);
  }

  void elevatedBtnElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProperty = MaterialStateProperty.resolveWith<double>(
        (states) {
          if (states.contains(MaterialState.disabled)) return 0;
          if (states.contains(MaterialState.hovered)) return elevation + 2;
          if (states.contains(MaterialState.focused)) return elevation + 2;
          if (states.contains(MaterialState.pressed)) return elevation + 6;
          return elevation;
        },
      );
      final style = _getElevatedBtnStyle().copyWith(
        elevation: elevationProperty,
      );
      _emitStateWithElevatedBtnStyle(style);
    }
  }

  void elevatedBtnMinWidthChanged(String value) {
    final width = double.tryParse(value);
    if (width != null) {
      final size =
          _getElevatedBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getElevatedBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(width, size.height)),
      );
      _emitStateWithElevatedBtnStyle(style);
    }
  }

  void elevatedBtnMinHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final size =
          _getElevatedBtnStyle().minimumSize?.resolve(kInteractiveStates) ??
              kBtnMinSize;
      final style = _getElevatedBtnStyle().copyWith(
        minimumSize: MaterialStateProperty.all(Size(size.width, height)),
      );
      _emitStateWithElevatedBtnStyle(style);
    }
  }

  void _emitStateWithElevatedBtnStyle(ButtonStyle style) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(style: style),
        ),
      ),
    );
  }

  ButtonStyle _getElevatedBtnStyle() {
    return state.themeData.elevatedButtonTheme.style ??
        ElevatedButton.styleFrom(
          primary: state.themeData.primaryColor,
          onSurface: state.themeData.colorScheme.onPrimary,
          shadowColor: state.themeData.shadowColor,
          elevation: kElevatedBtnElevation,
          minimumSize: kBtnMinSize,
        );
  }
}
