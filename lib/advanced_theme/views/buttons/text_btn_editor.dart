import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextBtnEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.textButtonTheme.style !=
                current.themeData.textButtonTheme.style ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final style = state.themeData.textButtonTheme.style;
        return BtnStyleCard(
          header: 'Text Button',
          bgColor: style?.backgroundColor?.resolve(kFocusState) ??
              Colors.transparent,
          onBgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().textBtnBgColorChanged(color);
          },
          fgColor: style?.foregroundColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.primary,
          onFgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().textBtnFgColorChanged(color);
          },
          overlayColor: style?.overlayColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.primary.withOpacity(
                kTextBtnOverlayOpacity,
              ),
          onOverlayColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .textBtnOverlayColorChanged(color);
          },
          shadowColor: style?.shadowColor?.resolve(kFocusState) ??
              state.themeData.shadowColor,
          onShadowColorChanged: (color) {
            context.read<AdvancedThemeCubit>().textBtnShadowColorChanged(color);
          },
          elevation:
              style?.elevation?.resolve(kFocusState) ?? kTextBtnElevation,
          onElevationChanged: (value) {
            context.read<AdvancedThemeCubit>().textBtnElevationChanged(value);
          },
          minWidth:
              style?.minimumSize?.resolve(kFocusState)?.width ?? kBtnMinWidth,
          onMinWidthChanged: (value) {
            context.read<AdvancedThemeCubit>().textBtnMinWidthChanged(value);
          },
          minHeight:
              style?.minimumSize?.resolve(kFocusState)?.height ?? kBtnMinHeight,
          onMinHeightChanged: (value) {
            context.read<AdvancedThemeCubit>().textBtnMinHeightChanged(value);
          },
        );
      },
    );
  }
}
