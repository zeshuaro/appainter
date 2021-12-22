import 'package:flutter/material.dart';

class ButtonUtils {
  const ButtonUtils();

  MaterialStateProperty<Color?> getBasicColor(
    MaterialStateProperty<Color?> color, {
    Color? defaultColor,
    Color? disabledColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor ?? color.resolve({MaterialState.disabled});
      }
      return defaultColor ?? color.resolve({});
    });
  }

  MaterialStateProperty<Color?> getOverlayColor(
    MaterialStateProperty<Color?> overlayColor, {
    Color? hoveredColor,
    Color? focusedColor,
    Color? pressedColor,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return hoveredColor ?? overlayColor.resolve({MaterialState.hovered});
      }
      if (states.contains(MaterialState.focused)) {
        return focusedColor ?? overlayColor.resolve({MaterialState.focused});
      }
      if (states.contains(MaterialState.pressed)) {
        return pressedColor ?? overlayColor.resolve({MaterialState.pressed});
      }
      return null;
    });
  }
}
