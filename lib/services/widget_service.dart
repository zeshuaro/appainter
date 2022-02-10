import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetService {
  static Future<void> showColorPicker({
    required BuildContext context,
    required Color color,
    required ValueChanged<Color> onColorChanged,
    bool enableOpacity = true,
  }) async {
    ColorPicker(
      key: const Key('widgetService_showColorPicker'),
      color: color,
      borderRadius: 4,
      showMaterialName: true,
      showColorCode: true,
      showColorName: true,
      enableOpacity: enableOpacity,
      onColorChanged: onColorChanged,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.headline5,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
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

  static Future<String?> showFontPicker({
    required BuildContext context,
  }) async {
    final fonts = GoogleFonts.asMap().entries.toList();
    final size = MediaQuery.of(context).size;

    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Select font'),
        content: SizedBox(
          width: size.width * 0.3,
          height: size.height * 0.7,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: fonts.length,
            itemBuilder: (context, index) {
              final entry = fonts[index];
              final fontFamily = entry.key;

              return ListTile(
                key: Key('fontPicker_$fontFamily'),
                title: Text(fontFamily, style: entry.value()),
                onTap: () => Navigator.of(context).pop(fontFamily),
              );
            },
            separatorBuilder: (context, index) {
              return Container();
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
