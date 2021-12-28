import 'package:flutter/material.dart';

class SelectionUtils {
  const SelectionUtils();

  MaterialStateProperty<Color?> getBasicColor(
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

  MaterialStateProperty<Color?> getOverlayColor(
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
