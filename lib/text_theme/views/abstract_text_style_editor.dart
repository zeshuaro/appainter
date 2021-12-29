import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

abstract class AbstractTextStyleEditor<T extends AbstractTextStyleCubit>
    extends ExpansionPanelItem {
  const AbstractTextStyleEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, TextStyleState>(
      builder: (context, state) {
        return TextStyleCard(
          style: state.style,
          onColorChanged: (color) {
            context.read<T>().colorChanged(color);
          },
          onBackgroundColorChanged: (color) {
            context.read<T>().backgroundColorChanged(color);
          },
          onFontSizeChanged: (value) {
            context.read<T>().fontSizeChanged(value);
          },
          onFontWeightChanged: (value) {
            context.read<T>().fontWeightChanged(value!);
          },
          onFontStyleChanged: (value) {
            context.read<T>().fontStyleChanged(value!);
          },
          onLetterSpacingChanged: (value) {
            context.read<T>().letterSpacingChanged(value);
          },
          onWordSpacingChanged: (value) {
            context.read<T>().wordSpacingChanged(value);
          },
          onTextBaselineChanged: (value) {
            context.read<T>().textBaselineChanged(value!);
          },
          onHeightChanged: (value) {
            context.read<T>().heightChanged(value);
          },
          onLeadingDistributionChanged: (value) {
            context.read<T>().leadingDistributionChanged(value!);
          },
          onDecorationChanged: (value) {
            context.read<T>().decorationChanged(value!);
          },
          onDecorationColorChanged: (color) {
            context.read<T>().decorationColorChanged(color);
          },
          onDecorationStyleChanged: (value) {
            context.read<T>().decorationStyleChanged(value!);
          },
          onDecorationThicknessChanged: (value) {
            context.read<T>().decorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
