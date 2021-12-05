import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class BodyText2Editor extends ExpansionPanelItem {
  const BodyText2Editor({Key? key}) : super(key: key);

  @override
  String get header => 'Body Text 2';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) =>
          previous.themeData.textTheme.bodyText2 !=
          current.themeData.textTheme.bodyText2,
      builder: (context, state) {
        return TextStyleCard(
          style: state.themeData.textTheme.bodyText2!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().bodyText2ColorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2BackgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context.read<AdvancedThemeCubit>().bodyText2FontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2FontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2FontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2LetterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2WordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2TextBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().bodyText2HeightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2LeadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2DecorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2DecorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2DecorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bodyText2DecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
