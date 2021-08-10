import 'package:flutter/material.dart';
import 'package:flutter_theme/widgets/widgets.dart';

import '../list_tiles/list_tiles.dart';
import '../side_by_side_list.dart';
import 'expandable_card.dart';

class BtnStyleCard extends StatelessWidget {
  final String header;

  final Color bgColor;
  final ValueChanged<Color> onBgColorChanged;

  final Color fgColor;
  final ValueChanged<Color> onFgColorChanged;

  final Color overlayColor;
  final ValueChanged<Color> onOverlayColorChanged;

  final Color shadowColor;
  final ValueChanged<Color> onShadowColorChanged;

  final double elevation;
  final ValueChanged<String> onElevationChanged;

  final double minWidth;
  final ValueChanged<String> onMinWidthChanged;

  final double minHeight;
  final ValueChanged<String> onMinHeightChanged;

  const BtnStyleCard({
    Key? key,
    required this.header,
    required this.bgColor,
    required this.onBgColorChanged,
    required this.fgColor,
    required this.onFgColorChanged,
    required this.overlayColor,
    required this.onOverlayColorChanged,
    required this.shadowColor,
    required this.onShadowColorChanged,
    required this.elevation,
    required this.onElevationChanged,
    required this.minWidth,
    required this.onMinWidthChanged,
    required this.minHeight,
    required this.onMinHeightChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: header,
      children: [
        SideBySideList(
          children: [
            ColorListTile(
              key: const Key('bgColorPicker'),
              title: 'Background Color',
              color: bgColor,
              onColorChanged: onBgColorChanged,
            ),
            ColorListTile(
              key: const Key('fgColorPicker'),
              title: 'Foreground Color',
              color: fgColor,
              onColorChanged: onFgColorChanged,
            ),
            ColorListTile(
              key: const Key('overlayColorPicker'),
              title: 'Overlay Color',
              color: overlayColor,
              onColorChanged: onOverlayColorChanged,
            ),
            ColorListTile(
              key: const Key('shadowColorPicker'),
              title: 'Shadow Color',
              color: shadowColor,
              onColorChanged: onShadowColorChanged,
            ),
            // MyTextFormField(
            //   labelText: 'Minimum Width',
            //   onChanged: onMinWidthChanged,
            //   initialValue: minWidth.toString(),
            // ),
            // MyTextFormField(
            //   labelText: 'Minimum Height',
            //   onChanged: onMinHeightChanged,
            //   initialValue: minHeight.toString(),
            // ),
            MyTextFormField(
              key: const Key('elevationTextField'),
              labelText: 'Elevation',
              onChanged: onElevationChanged,
              initialValue: elevation.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
