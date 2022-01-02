import 'package:flutter/material.dart';

import 'list_tiles.dart';

class ColorBrightnessListTile extends StatelessWidget {
  final String title;
  final Color color;
  final void Function(Color) onColorChanged;
  final bool isColorDark;
  final void Function(bool) onBrightnessChanged;

  const ColorBrightnessListTile({
    Key? key,
    required this.title,
    required this.color,
    required this.onColorChanged,
    required this.isColorDark,
    required this.onBrightnessChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: ColorListTile(
              title: title,
              color: color,
              onColorChanged: onColorChanged,
            ),
          ),
          const VerticalDivider(),
          _BrightnessSwitch(
            isColorDark: isColorDark,
            onBrightnessChanged: onBrightnessChanged,
          ),
        ],
      ),
    );
  }
}

class _BrightnessSwitch extends StatelessWidget {
  final bool isColorDark;
  final void Function(bool) onBrightnessChanged;

  const _BrightnessSwitch({
    Key? key,
    required this.isColorDark,
    required this.onBrightnessChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Brightness',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Switch(
              value: isColorDark,
              activeColor: Colors.blueGrey,
              onChanged: onBrightnessChanged,
            ),
            const Text('Dark'),
          ],
        ),
      ],
    );
  }
}
