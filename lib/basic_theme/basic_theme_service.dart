import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class BasicThemeService {
  static const _onKeyColorTone = 100;
  static const _containerColorTone = 90;
  static const _onContainerColorTone = 10;
  static const _onNeutralColorTone = 10;
  static const _onSurfaceVariantColorTone = 30;

  Color getOnKeyColor(Color color) => _getColorFromTone(color, _onKeyColorTone);

  Color getContainerColor(Color color) {
    return _getColorFromTone(color, _containerColorTone);
  }

  Color getOnContainerColor(Color color) {
    return _getColorFromTone(color, _onContainerColorTone);
  }

  Color getOnNeutralColor(Color color) {
    return _getColorFromTone(color, _onNeutralColorTone);
  }

  Color getOnSurfaceVariantColor(Color color) {
    return _getColorFromTone(color, _onSurfaceVariantColorTone);
  }

  Color _getColorFromTone(Color color, int tone) {
    final palette = CorePalette.of(color.value);
    return Color(palette.primary.get(tone));
  }
}
