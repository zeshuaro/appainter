import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeEditor
    extends AbstractFlatButtonStyleEditor<OutlinedButtonThemeCubit> {
  const OutlinedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Outlined button';
}
