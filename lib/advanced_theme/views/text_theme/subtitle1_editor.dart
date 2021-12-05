import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class Subtitle1Editor extends ExpansionPanelItem {
  const Subtitle1Editor({Key? key}) : super(key: key);

  @override
  String get header => 'Subtitle 1';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) =>
          previous.themeData.textTheme.subtitle1 !=
          current.themeData.textTheme.subtitle1,
      builder: (context, state) {
        return TextStyleCard(
          style: state.themeData.textTheme.subtitle1!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().subtitle1ColorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1BackgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context.read<AdvancedThemeCubit>().subtitle1FontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1FontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1FontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1LetterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1WordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1TextBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().subtitle1HeightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1LeadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1DecorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1DecorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1DecorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .subtitle1DecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
