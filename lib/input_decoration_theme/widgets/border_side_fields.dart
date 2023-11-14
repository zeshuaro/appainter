import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BorderSideFields extends StatelessWidget {
  final String headerPrefix;
  final BorderSide borderSide;
  final ValueChanged<Color> onColorChanged;
  final ValueChanged<String> onWidthChanged;

  const BorderSideFields({
    super.key,
    required this.headerPrefix,
    required this.borderSide,
    required this.onColorChanged,
    required this.onWidthChanged,
  });

  @override
  Widget build(BuildContext context) {
    final key = headerPrefix.toLowerCase();
    return SideBySide(
      left: ColorListTile(
        key: Key('borderSideFields_colorPicker_$key'),
        title: '$headerPrefix border side color',
        color: borderSide.color,
        onColorChanged: onColorChanged,
      ),
      right: MyTextFormField(
        key: Key('borderSideFields_widthTextField_$key'),
        labelText: '$headerPrefix border side width',
        initialValue: borderSide.width.toString(),
        onChanged: onWidthChanged,
      ),
    );
  }
}
