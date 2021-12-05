import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class CaptionTextEditor extends ExpansionPanelItem {
  const CaptionTextEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Caption Text';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) =>
          previous.themeData.textTheme.caption !=
          current.themeData.textTheme.caption,
      builder: (context, state) {
        return TextStyleCard(
          style: state.themeData.textTheme.caption!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().captionTextColorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextBackgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextFontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextFontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextFontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextLetterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextWordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextTextBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().captionTextHeightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextLeadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextDecorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextDecorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextDecorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .captionTextDecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
