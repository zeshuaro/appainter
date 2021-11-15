import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';

extension SwitchCubit on AdvancedThemeCubit {
  void switchThumbDefaultColorChanged(Color color) {
    _emitWithNewThumbColor(defaultColor: color);
  }

  void switchThumbSelectedColorChanged(Color color) {
    _emitWithNewThumbColor(selectedColor: color);
  }

  void switchThumbDisabledColorChanged(Color color) {
    _emitWithNewThumbColor(disabledColor: color);
  }

  void switchTrackDefaultColorChanged(Color color) {
    _emitWithNewTrackColor(defaultColor: color);
  }

  void switchTrackSelectedColorChanged(Color color) {
    _emitWithNewTrackColor(selectedColor: color);
  }

  void switchTrackDisabledColorChanged(Color color) {
    _emitWithNewTrackColor(disabledColor: color);
  }

  void switchMaterialTapTargetSize(String value) {
    final size = UtilService.stringToEnum(MaterialTapTargetSize.values, value);
    if (size != null) {
      final theme = state.themeData.switchTheme.copyWith(
        materialTapTargetSize: size,
      );
      _emitWithSwitchThemeData(theme);
    }
  }

  void switchOverlayPressedColorChanged(Color color) {
    _emitWithNewOverlayColor(pressedColor: color);
  }

  void switchOverlayHoveredColorChanged(Color color) {
    _emitWithNewOverlayColor(hoveredColor: color);
  }

  void switchOverlayFocusedColorChanged(Color color) {
    _emitWithNewOverlayColor(focusedColor: color);
  }

  void switchSplashRadiusChanged(String value) {
    final radius = double.tryParse(value);
    if (radius != null) {
      final theme = state.themeData.switchTheme.copyWith(splashRadius: radius);
      _emitWithSwitchThemeData(theme);
    }
  }

  void _emitWithSwitchThemeData(SwitchThemeData theme) {
    emit(
      state.copyWith(themeData: state.themeData.copyWith(switchTheme: theme)),
    );
  }

  void _emitWithNewThumbColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final theme = state.themeData.switchTheme;
    final color = _getSwitchColor(
      theme.thumbColor ?? _defaultThumbColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );

    _emitWithSwitchThemeData(theme.copyWith(thumbColor: color));
  }

  void _emitWithNewTrackColor({
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    final theme = state.themeData.switchTheme;
    final color = _getSwitchColor(
      theme.trackColor ?? _defaultTrackColor,
      defaultColor: defaultColor,
      selectedColor: selectedColor,
      disabledColor: disabledColor,
    );

    _emitWithSwitchThemeData(theme.copyWith(trackColor: color));
  }

  void _emitWithNewOverlayColor({
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    final theme = state.themeData.switchTheme;
    final color = _getOverlayColor(
      theme.overlayColor ?? _defaultOverlayColor,
      pressedColor: pressedColor,
      hoveredColor: hoveredColor,
      focusedColor: focusedColor,
    );

    _emitWithSwitchThemeData(theme.copyWith(overlayColor: color));
  }

  MaterialStateProperty<Color> get _defaultThumbColor {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey.shade400;
      }
      if (states.contains(MaterialState.selected)) {
        return state.themeData.toggleableActiveColor;
      }
      return Colors.grey.shade50;
    });
  }

  MaterialStateProperty<Color> get _defaultTrackColor {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.black12;
      }
      if (states.contains(MaterialState.selected)) {
        return state.themeData.toggleableActiveColor.withAlpha(0x80);
      }
      return const Color(0x52000000);
    });
  }

  MaterialStateProperty<Color?> get _defaultOverlayColor {
    final themeData = state.themeData;
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return themeData.toggleableActiveColor.withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(MaterialState.hovered)) {
        return themeData.hoverColor;
      }
      if (states.contains(MaterialState.focused)) {
        return themeData.focusColor;
      }
      return null;
    });
  }

  MaterialStateProperty<Color?> _getSwitchColor(
    MaterialStateProperty<Color?> color, {
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return selectedColor ?? color.resolve({MaterialState.selected});
      }
      if (states.contains(MaterialState.disabled)) {
        return disabledColor ?? color.resolve({MaterialState.disabled});
      }
      return defaultColor ?? color.resolve({});
    });
  }

  MaterialStateProperty<Color?> _getOverlayColor(
    MaterialStateProperty<Color?> color, {
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return pressedColor ?? color.resolve({MaterialState.pressed});
      }
      if (states.contains(MaterialState.hovered)) {
        return hoveredColor ?? color.resolve({MaterialState.hovered});
      }
      if (states.contains(MaterialState.focused)) {
        return focusedColor ?? color.resolve({MaterialState.focused});
      }
      return null;
    });
  }
}
