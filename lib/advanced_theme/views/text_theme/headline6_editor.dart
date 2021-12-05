import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class Headline6Editor extends ExpansionPanelItem {
  const Headline6Editor({Key? key}) : super(key: key);

  @override
  String get header => 'Headline 6';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) =>
          previous.themeData.textTheme.headline6 !=
          current.themeData.textTheme.headline6,
      builder: (context, state) {
        return TextStyleCard(
          style: state.themeData.textTheme.headline6!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().headline6ColorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .headline6BackgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context.read<AdvancedThemeCubit>().headline6FontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6FontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6FontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6LetterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6WordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6TextBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().headline6HeightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6LeadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6DecorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .headline6DecorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6DecorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline6DecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
