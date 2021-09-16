import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class Headline3Editor extends StatelessWidget {
  const Headline3Editor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) =>
          previous.themeData.textTheme.headline3 !=
          current.themeData.textTheme.headline3,
      builder: (context, state) {
        return TextStyleCard(
          header: 'Headline 3',
          style: state.themeData.textTheme.headline3!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().headline3ColorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .headline3BackgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context.read<AdvancedThemeCubit>().headline3FontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3FontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3FontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3LetterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3WordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3TextBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().headline3HeightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3LeadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3DecorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .headline3DecorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3DecorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .headline3DecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
