import 'package:flutter/material.dart';

class SelectionUtils {
  const SelectionUtils();

  WidgetStateProperty<Color?> getBasicColor(
    WidgetStateProperty<Color?> color, {
    Color? defaultColor,
    Color? selectedColor,
    Color? disabledColor,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return selectedColor ?? color.resolve({WidgetState.selected});
      }
      if (states.contains(WidgetState.disabled)) {
        return disabledColor ?? color.resolve({WidgetState.disabled});
      }
      return defaultColor ?? color.resolve({});
    });
  }

  WidgetStateProperty<Color?> getOverlayColor(
    WidgetStateProperty<Color?> color, {
    Color? pressedColor,
    Color? hoveredColor,
    Color? focusedColor,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return pressedColor ?? color.resolve({WidgetState.pressed});
      }
      if (states.contains(WidgetState.hovered)) {
        return hoveredColor ?? color.resolve({WidgetState.hovered});
      }
      if (states.contains(WidgetState.focused)) {
        return focusedColor ?? color.resolve({WidgetState.focused});
      }
      return null;
    });
  }
}
