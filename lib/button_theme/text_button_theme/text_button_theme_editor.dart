import 'package:appainter/button_theme/button_theme.dart';
import 'package:flutter/material.dart';

class TextButtonThemeEditor
    extends AbstractFlatButtonStyleEditor<TextButtonThemeCubit> {
  const TextButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text button';
}
