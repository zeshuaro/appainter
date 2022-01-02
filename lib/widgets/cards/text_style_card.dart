import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/widgets/widgets.dart';

class TextStyleCard extends StatelessWidget {
  final TextStyle style;

  final ValueChanged<Color> onColorChanged;
  final ValueChanged<Color> onBackgroundColorChanged;

  final ValueChanged<String> onFontSizeChanged;
  final ValueChanged<String?> onFontWeightChanged;
  final ValueChanged<String?> onFontStyleChanged;

  final ValueChanged<String> onLetterSpacingChanged;
  final ValueChanged<String> onWordSpacingChanged;

  final ValueChanged<String?> onTextBaselineChanged;
  final ValueChanged<String> onHeightChanged;
  final ValueChanged<String?> onLeadingDistributionChanged;

  final ValueChanged<String?> onDecorationChanged;
  final ValueChanged<Color> onDecorationColorChanged;
  final ValueChanged<String?> onDecorationStyleChanged;
  final ValueChanged<String> onDecorationThicknessChanged;

  const TextStyleCard({
    Key? key,
    required this.style,
    required this.onColorChanged,
    required this.onBackgroundColorChanged,
    required this.onFontSizeChanged,
    required this.onFontWeightChanged,
    required this.onFontStyleChanged,
    required this.onLetterSpacingChanged,
    required this.onWordSpacingChanged,
    required this.onTextBaselineChanged,
    required this.onHeightChanged,
    required this.onLeadingDistributionChanged,
    required this.onDecorationChanged,
    required this.onDecorationColorChanged,
    required this.onDecorationStyleChanged,
    required this.onDecorationThicknessChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        ColorListTile(
          key: const Key('colorPicker'),
          title: 'Color',
          color: style.color!,
          onColorChanged: onColorChanged,
        ),
        ColorListTile(
          key: const Key('backgroundColorPicker'),
          title: 'Background Color',
          color: style.backgroundColor ?? Colors.transparent,
          onColorChanged: onBackgroundColorChanged,
        ),
        MyTextFormField(
          key: const Key('fontSizeTextField'),
          labelText: 'Font Size',
          onChanged: onFontSizeChanged,
          initialValue: style.fontSize!.toString(),
        ),
        MyTextFormField(
          key: const Key('heightTextField'),
          labelText: 'Height',
          onChanged: onHeightChanged,
          initialValue: style.height?.toString(),
        ),
        DropdownListTile(
          key: const Key('fontWeightDropdown'),
          title: 'Font Weight',
          value: MyFontWeight().stringFromEnum(style.fontWeight!)!,
          values: MyFontWeight().names,
          onChanged: onFontWeightChanged,
        ),
        DropdownListTile(
          key: const Key('fontStyleDropdown'),
          title: 'Font Style',
          value: UtilService.enumToString(
            style.fontStyle ?? FontStyle.normal,
          ),
          values: UtilService.getEnumStrings(FontStyle.values),
          onChanged: onFontStyleChanged,
        ),
        MyTextFormField(
          key: const Key('letterSpacingTextField'),
          labelText: 'Letter Spacing',
          onChanged: onLetterSpacingChanged,
          initialValue: style.letterSpacing?.toString(),
        ),
        MyTextFormField(
          key: const Key('wordSpacingTextField'),
          labelText: 'Word Spacing',
          onChanged: onWordSpacingChanged,
          initialValue: style.wordSpacing?.toString(),
        ),
        DropdownListTile(
          key: const Key('textBaselineDropdown'),
          title: 'Text Baseline',
          value: UtilService.enumToString(style.textBaseline!),
          values: UtilService.getEnumStrings(TextBaseline.values),
          onChanged: onTextBaselineChanged,
        ),
        DropdownListTile(
          key: const Key('leadingDistributionDropdown'),
          title: 'Leading Distribution',
          value: UtilService.enumToString(
            style.leadingDistribution ?? TextLeadingDistribution.proportional,
          ),
          values: UtilService.getEnumStrings(
            TextLeadingDistribution.values,
          ),
          onChanged: onLeadingDistributionChanged,
        ),
        DropdownListTile(
          key: const Key('decorationDropdown'),
          title: 'Decoration',
          value: MyTextDecoration().stringFromEnum(style.decoration!)!,
          values: MyTextDecoration().names,
          onChanged: onDecorationChanged,
        ),
        ColorListTile(
          key: const Key('decorationColorPicker'),
          title: 'Decoration Color',
          color: style.decorationColor ?? Colors.transparent,
          onColorChanged: onDecorationColorChanged,
        ),
        DropdownListTile(
          key: const Key('decorationStyleDropdown'),
          title: 'Decoration Style',
          value: UtilService.enumToString(style.decorationStyle),
          values: UtilService.getEnumStrings(
            TextDecorationStyle.values,
            withNull: true,
          ),
          onChanged: onDecorationStyleChanged,
        ),
        MyTextFormField(
          key: const Key('decorationThicknessTextField'),
          labelText: 'Decoration Thickness',
          initialValue: style.decorationThickness?.toString(),
          onChanged: onDecorationThicknessChanged,
        ),
      ],
    );
  }
}
