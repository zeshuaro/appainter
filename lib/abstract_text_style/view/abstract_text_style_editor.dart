import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/font/font.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractTextStyleEditor<T extends AbstractTextStyleCubit>
    extends ExpansionPanelItem {
  const AbstractTextStyleEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, TextStyleState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        final style = state.style;

        return SideBySideList(
          padding: kPaddingAll,
          children: [
            FontPicker(onChanged: cubit.fontFamilyChanged),
            ColorListTile(
              key: const Key('colorPicker'),
              title: 'Color',
              color: style.color!,
              onColorChanged: cubit.colorChanged,
            ),
            ColorListTile(
              key: const Key('backgroundColorPicker'),
              title: 'Background color',
              color: style.backgroundColor ?? Colors.transparent,
              onColorChanged: cubit.backgroundColorChanged,
            ),
            MyTextFormField(
              key: const Key('fontSizeTextField'),
              labelText: 'Font size',
              onChanged: cubit.fontSizeChanged,
              initialValue: style.fontSize!.toString(),
            ),
            MyTextFormField(
              key: const Key('heightTextField'),
              labelText: 'Height',
              onChanged: cubit.heightChanged,
              initialValue: style.height?.toString(),
            ),
            DropdownListTile(
              key: const Key('fontWeightDropdown'),
              title: 'Font weight',
              value: MyFontWeight().convertToString(style.fontWeight!)!,
              values: MyFontWeight().names,
              onChanged: cubit.fontWeightChanged,
            ),
            DropdownListTile(
              key: const Key('fontStyleDropdown'),
              title: 'Font style',
              value: UtilService.enumToString(
                style.fontStyle ?? FontStyle.normal,
              ),
              values: UtilService.getEnumStrings(FontStyle.values),
              onChanged: cubit.fontStyleChanged,
            ),
            MyTextFormField(
              key: const Key('letterSpacingTextField'),
              labelText: 'Letter spacing',
              onChanged: cubit.letterSpacingChanged,
              initialValue: style.letterSpacing?.toString(),
              allowNegative: true,
            ),
            MyTextFormField(
              key: const Key('wordSpacingTextField'),
              labelText: 'Word spacing',
              onChanged: cubit.wordSpacingChanged,
              initialValue: style.wordSpacing?.toString(),
              allowNegative: true,
            ),
            DropdownListTile(
              key: const Key('textBaselineDropdown'),
              title: 'Text baseline',
              value: UtilService.enumToString(style.textBaseline!),
              values: UtilService.getEnumStrings(TextBaseline.values),
              onChanged: cubit.textBaselineChanged,
            ),
            DropdownListTile(
              key: const Key('leadingDistributionDropdown'),
              title: 'Leading distribution',
              value: UtilService.enumToString(
                style.leadingDistribution ??
                    TextLeadingDistribution.proportional,
              ),
              values: UtilService.getEnumStrings(
                TextLeadingDistribution.values,
              ),
              onChanged: cubit.leadingDistributionChanged,
            ),
            DropdownListTile(
              key: const Key('decorationDropdown'),
              title: 'Decoration',
              value: MyTextDecoration().convertToString(style.decoration!)!,
              values: MyTextDecoration().names,
              onChanged: cubit.decorationChanged,
            ),
            ColorListTile(
              key: const Key('decorationColorPicker'),
              title: 'Decoration color',
              color: style.decorationColor ?? Colors.transparent,
              onColorChanged: cubit.decorationColorChanged,
            ),
            DropdownListTile(
              key: const Key('decorationStyleDropdown'),
              title: 'Decoration style',
              value: UtilService.enumToString(style.decorationStyle),
              values: UtilService.getEnumStrings(
                TextDecorationStyle.values,
                withNull: true,
              ),
              onChanged: cubit.decorationStyleChanged,
            ),
            MyTextFormField(
              key: const Key('decorationThicknessTextField'),
              labelText: 'Decoration thickness',
              initialValue: style.decorationThickness?.toString(),
              onChanged: cubit.decorationThicknessChanged,
            ),
          ],
        );
      },
    );
  }
}
