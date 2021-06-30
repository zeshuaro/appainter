import 'package:flutter/material.dart';

import '../list_tiles/list_tiles.dart';
import '../side_by_side.dart';
import '../text_form_field.dart';
import 'expandable_card.dart';

class IconThemeCard extends StatelessWidget {
  final String? headerKey;

  final Color color;
  final ValueChanged<Color> onColorChanged;

  final double size;
  final ValueChanged<String> onSizeChanged;

  final double opacity;
  final ValueChanged<String> onOpacityChanged;

  const IconThemeCard({
    Key? key,
    this.headerKey,
    required this.color,
    required this.onColorChanged,
    required this.size,
    required this.onSizeChanged,
    required this.opacity,
    required this.onOpacityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerPrefix = headerKey != null ? '$headerKey ' : '';
    return ExpandableCard(
      header: '${headerPrefix}Icon Theme',
      children: [
        ColorListTile(
          title: 'Color',
          color: color,
          onColorChanged: onColorChanged,
        ),
        SideBySide(
          left: MyTextFormField(
            key: const Key('iconThemeCard_sizeTextField'),
            labelText: 'Size',
            onChanged: onSizeChanged,
            initialValue: size.toString(),
          ),
          right: MyTextFormField(
            key: const Key('iconThemeCard_opacityTextField'),
            labelText: 'Opacity',
            onChanged: onOpacityChanged,
            initialValue: opacity.toString(),
          ),
        )
      ],
    );
  }
}
