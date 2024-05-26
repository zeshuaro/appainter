import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

abstract class AbstractFlatButtonStyleCubit extends AbstractButtonStyleCubit {
  AbstractFlatButtonStyleCubit({required super.colorThemeCubit});

  void backgroundColorChanged(Color color) {
    emitWithButtonStyle(
      style.copyWith(backgroundColor: WidgetStateProperty.all(color)),
    );
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      emitWithButtonStyle(
        style.copyWith(elevation: WidgetStateProperty.all(elevation)),
      );
    }
  }
}
