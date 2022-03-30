import 'package:flutter/material.dart';
import 'package:appainter/widgets/widgets.dart';

class IconThemeCard extends StatelessWidget {
  final String? keyPrefix;

  final Color color;
  final ValueChanged<Color> onColorChanged;

  final double size;
  final ValueChanged<String> onSizeChanged;

  final double opacity;
  final ValueChanged<String> onOpacityChanged;

  const IconThemeCard({
    Key? key,
    this.keyPrefix,
    required this.color,
    required this.onColorChanged,
    required this.size,
    required this.onSizeChanged,
    required this.opacity,
    required this.onOpacityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String prefix;
    if (keyPrefix != null) {
      prefix = '${keyPrefix}_';
    } else {
      prefix = '';
    }

    return NestedListView(
      children: [
        ColorListTile(
          key: Key('${prefix}colorPicker'),
          title: 'Color',
          color: color,
          onColorChanged: onColorChanged,
        ),
        SideBySide(
          left: MyTextFormField(
            key: Key('${prefix}sizeTextField'),
            labelText: 'Size',
            onChanged: onSizeChanged,
            initialValue: size.toString(),
          ),
          right: MyTextFormField(
            key: Key('${prefix}opacityTextField'),
            labelText: 'Opacity',
            onChanged: onOpacityChanged,
            initialValue: opacity.toString(),
          ),
        )
      ],
    );
  }
}
