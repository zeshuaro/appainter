import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class WidgetService {
  static Future<bool> showColorPicker({
    required BuildContext context,
    required Color color,
    required ValueChanged<Color> onColorChanged,
    bool enableOpacity = true,
  }) async {
    return ColorPicker(
      key: const Key('widgetService_showColorPicker'),
      color: color,
      borderRadius: 4,
      showMaterialName: true,
      showColorCode: true,
      showColorName: true,
      enableOpacity: enableOpacity,
      enableTonalPalette: true,
      onColorChanged: onColorChanged,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      tonalSubheading: Text(
        'Material 3 tonal palette',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      pickersEnabled: const {
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: true,
        ColorPickerType.wheel: true,
      },
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
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
