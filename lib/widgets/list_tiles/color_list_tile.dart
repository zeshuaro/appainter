import 'package:appainter/services/services.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'list_tile.dart';

class ColorListTile extends StatelessWidget {
  final String title;
  final String? tooltip;
  final Color color;
  final void Function(Color) onColorChanged;
  final bool enableOpacity;

  const ColorListTile({
    super.key,
    required this.title,
    required this.color,
    required this.onColorChanged,
    this.enableOpacity = true,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: title,
      tooltip: tooltip,
      subtitle: "#${color.hex}",
      trailing: ColorIndicator(
        width: 44,
        height: 44,
        borderRadius: 4,
        color: color,
        onSelectFocus: false,
        onSelect: () async {
          final prevColor = color;
          final colorChanged = await WidgetService.showColorPicker(
            context: context,
            color: color,
            onColorChanged: onColorChanged,
            enableOpacity: enableOpacity,
          );

          if (!colorChanged) {
            onColorChanged(prevColor);
          }
        },
      ),
    );
  }
}
