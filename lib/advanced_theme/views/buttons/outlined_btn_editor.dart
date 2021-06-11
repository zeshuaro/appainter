import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class OutlinedBtnEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style !=
            current.themeData.outlinedButtonTheme.style;
      },
      builder: (context, state) {
        final style = state.themeData.outlinedButtonTheme.style;
        return BtnStyleCard(
          header: 'Outlined Button',
          bgColor: style?.backgroundColor?.resolve(kFocusState) ??
              Colors.transparent,
          onBgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().outlinedBtnBgColorChanged(color);
          },
          fgColor: style?.foregroundColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.primary,
          onFgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().outlinedBtnFgColorChanged(color);
          },
          overlayColor: style?.overlayColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.primary.withOpacity(
                kOutlinedBtnOverlayOpacity,
              ),
          onOverlayColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .outlinedBtnOverlayColorChanged(color);
          },
          shadowColor: style?.shadowColor?.resolve(kFocusState) ??
              state.themeData.shadowColor,
          onShadowColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .outlinedBtnShadowColorChanged(color);
          },
          elevation:
              style?.elevation?.resolve(kFocusState) ?? kOutlinedBtnElevation,
          onElevationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .outlinedBtnElevationChanged(value);
          },
          minWidth:
              style?.minimumSize?.resolve(kFocusState)?.width ?? kBtnMinWidth,
          onMinWidthChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .outlinedBtnMinWidthChanged(value);
          },
          minHeight:
              style?.minimumSize?.resolve(kFocusState)?.height ?? kBtnMinHeight,
          onMinHeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .outlinedBtnMinHeightChanged(value);
          },
        );
      },
    );
  }
}
