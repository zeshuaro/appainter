import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/widgets/widgets.dart';

abstract class AbstractTextStyleEditor<T extends AbstractTextStyleCubit>
    extends ExpansionPanelItem {
  const AbstractTextStyleEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, TextStyleState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        return TextStyleCard(
          style: state.style,
          onColorChanged: cubit.colorChanged,
          onBackgroundColorChanged: cubit.backgroundColorChanged,
          onFontSizeChanged: cubit.fontSizeChanged,
          onFontWeightChanged: cubit.fontWeightChanged,
          onFontStyleChanged: cubit.fontStyleChanged,
          onLetterSpacingChanged: cubit.letterSpacingChanged,
          onWordSpacingChanged: cubit.wordSpacingChanged,
          onTextBaselineChanged: cubit.textBaselineChanged,
          onHeightChanged: cubit.heightChanged,
          onLeadingDistributionChanged: cubit.leadingDistributionChanged,
          onDecorationChanged: cubit.decorationChanged,
          onDecorationColorChanged: cubit.decorationColorChanged,
          onDecorationStyleChanged: cubit.decorationStyleChanged,
          onDecorationThicknessChanged: cubit.decorationThicknessChanged,
        );
      },
    );
  }
}
