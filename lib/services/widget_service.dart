import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class WidgetService {
  static Future<void> showColorPicker({
    required BuildContext context,
    required Color color,
    required void Function(Color) onColorChanged,
  }) async {
    ColorPicker(
      color: color,
      borderRadius: 22,
      showColorCode: true,
      showColorName: true,
      enableOpacity: true,
      onColorChanged: onColorChanged,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.headline5,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      pickersEnabled: {
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: true,
        ColorPickerType.wheel: true,
      },
      copyPasteBehavior: ColorPickerCopyPasteBehavior(
        copyFormat: ColorPickerCopyFormat.numHexRRGGBB,
        copyButton: true,
        pasteButton: true,
        ctrlC: true,
        ctrlV: true,
        snackBarParseError: true,
        snackBarMessage:
            "Invalid color code, please ensure that it's RGB format with "
            "leading # sign and no alpha '#RRGGBB'",
      ),
    ).showPickerDialog(
      context,
      constraints: const BoxConstraints(
        minHeight: 550,
        maxWidth: 450,
      ),
    );
  }
}
