import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:flutter/material.dart';

class IconThemeCubit extends AbstractIconThemeCubit {}

class IconThemeEditor extends AbstractIconThemeEditor<IconThemeCubit> {
  const IconThemeEditor({super.key});

  @override
  String get keyPrefix => 'iconThemeEditor';

  @override
  String get header => 'Icon theme';

  @override
  Color? fallbackColor(BuildContext context) => null;
}
