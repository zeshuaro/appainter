import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/services/services.dart';

import 'list_tile.dart';

class ColorListTile extends StatelessWidget {
  final String title;
  final Color color;
  final void Function(Color) onColorChanged;

  const ColorListTile({
    Key? key,
    required this.title,
    required this.color,
    required this.onColorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: title,
      subtitle: "#${color.hex}",
      trailing: ColorIndicator(
        width: 44,
        height: 44,
        borderRadius: 4,
        color: color,
        onSelectFocus: false,
        onSelect: () => WidgetService.showColorPicker(
          context: context,
          color: color,
          onColorChanged: onColorChanged,
        ),
      ),
    );
  }
}
