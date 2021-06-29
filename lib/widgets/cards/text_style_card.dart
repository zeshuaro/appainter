import 'package:flutter/material.dart';
import 'package:flutter_theme/models/models.dart';
import 'package:flutter_theme/services/services.dart';

import '..//list_tiles/list_tiles.dart';
import '../side_by_side_list.dart';
import '../text_form_field.dart';
import 'expandable_card.dart';

class TextStyleCard extends StatelessWidget {
  final String headerKey;

  final Color color;
  final ValueChanged<Color> onColorChanged;

  final Color backgroundColor;
  final ValueChanged<Color> onBackgroundColorChanged;

  final FontWeight fontWeight;
  final ValueChanged<String?> onFontWeightChanged;

  final FontStyle fontStyle;
  final ValueChanged<String?> onFontStyleChanged;

  final double fontSize;
  final ValueChanged<String> onFontSizeChanged;

  final double height;
  final ValueChanged<String> onHeightChanged;

  final double wordSpacing;
  final ValueChanged<String> onWordSpacingChanged;

  final double letterSpacing;
  final ValueChanged<String> onLetterSpacingChanged;

  final TextDecoration decoration;
  final ValueChanged<String?> onDecorationChanged;

  final Color decorationColor;
  final ValueChanged<Color> onDecorationColorChanged;

  final TextDecorationStyle decorationStyle;
  final ValueChanged<String?> onDecorationStyleChanged;

  final double decorationThickness;
  final ValueChanged<String> onDecorationThicknessChanged;

  const TextStyleCard({
    Key? key,
    required this.headerKey,
    required this.color,
    required this.onColorChanged,
    required this.backgroundColor,
    required this.onBackgroundColorChanged,
    required this.fontWeight,
    required this.onFontWeightChanged,
    required this.fontStyle,
    required this.onFontStyleChanged,
    required this.fontSize,
    required this.onFontSizeChanged,
    required this.height,
    required this.onHeightChanged,
    required this.wordSpacing,
    required this.onWordSpacingChanged,
    required this.letterSpacing,
    required this.onLetterSpacingChanged,
    required this.decoration,
    required this.onDecorationChanged,
    required this.decorationColor,
    required this.onDecorationColorChanged,
    required this.decorationStyle,
    required this.onDecorationStyleChanged,
    required this.decorationThickness,
    required this.onDecorationThicknessChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: '$headerKey Text Style',
      children: [
        SideBySideList(
          children: [
            ColorListTile(
              title: 'Color',
              color: color,
              onColorChanged: onColorChanged,
            ),
            ColorListTile(
              title: 'Background Color',
              color: backgroundColor,
              onColorChanged: onBackgroundColorChanged,
            ),
            DropdownListTile(
              title: 'Font Weight',
              value: MyFontWeight().stringFromEnum(fontWeight)!,
              values: MyFontWeight().names,
              onChanged: onFontWeightChanged,
            ),
            DropdownListTile(
              title: 'Font Style',
              value: UtilService.enumToString(fontStyle),
              values: UtilService.getEnumStrings(FontStyle.values),
              onChanged: onFontStyleChanged,
            ),
          ],
        ),
        Divider(),
        SideBySideList(
          children: [
            MyTextFormField(
              labelText: 'Font Size',
              initialValue: fontSize.toString(),
              onChanged: onFontSizeChanged,
            ),
            MyTextFormField(
              labelText: 'Height',
              initialValue: height.toString(),
              onChanged: onHeightChanged,
            ),
            MyTextFormField(
              labelText: 'Word Spacing',
              initialValue: wordSpacing.toString(),
              onChanged: onWordSpacingChanged,
            ),
            MyTextFormField(
              labelText: 'Letter Spacing',
              initialValue: letterSpacing.toString(),
              onChanged: onLetterSpacingChanged,
            ),
          ],
        ),
        Divider(),
        SideBySideList(
          children: [
            DropdownListTile(
              title: 'Decoration',
              value: MyTextDecoration().stringFromEnum(decoration)!,
              values: MyTextDecoration().names,
              onChanged: onDecorationChanged,
            ),
            ColorListTile(
              title: 'Decoration Color',
              color: decorationColor,
              onColorChanged: onDecorationColorChanged,
            ),
            DropdownListTile(
              title: 'Decoration Style',
              value: UtilService.enumToString(decorationStyle),
              values: UtilService.getEnumStrings(TextDecorationStyle.values),
              onChanged: onDecorationStyleChanged,
            ),
            MyTextFormField(
              labelText: 'Decoration Thickness',
              initialValue: decorationThickness.toString(),
              onChanged: onDecorationThicknessChanged,
            ),
          ],
        ),
      ],
    );
  }
}
