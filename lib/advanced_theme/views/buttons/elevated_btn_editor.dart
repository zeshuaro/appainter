import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class ElevatedBtnEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.elevatedButtonTheme.style !=
                current.themeData.elevatedButtonTheme.style ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final style = state.themeData.elevatedButtonTheme.style;
        return BtnStyleCard(
          header: 'Elevated Button',
          bgColor: style?.backgroundColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.primary,
          onBgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().elevatedBtnBgColorChanged(color);
          },
          fgColor: style?.foregroundColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.onPrimary,
          onFgColorChanged: (color) {
            context.read<AdvancedThemeCubit>().elevatedBtnFgColorChanged(color);
          },
          overlayColor: style?.overlayColor?.resolve(kFocusState) ??
              state.themeData.colorScheme.onPrimary.withOpacity(
                kElevatedBtnOverlayOpacity,
              ),
          onOverlayColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .elevatedBtnOverlayColorChanged(color);
          },
          shadowColor: style?.shadowColor?.resolve(kFocusState) ??
              state.themeData.shadowColor,
          onShadowColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .elevatedBtnShadowColorChanged(color);
          },
          elevation:
              style?.elevation?.resolve(kFocusState) ?? kElevatedBtnElevation,
          onElevationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .elevatedBtnElevationChanged(value);
          },
          minWidth:
              style?.minimumSize?.resolve(kFocusState)?.width ?? kBtnMinWidth,
          onMinWidthChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .elevatedBtnMinWidthChanged(value);
          },
          minHeight:
              style?.minimumSize?.resolve(kFocusState)?.height ?? kBtnMinHeight,
          onMinHeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .elevatedBtnMinHeightChanged(value);
          },
        );
      },
    );
  }
}
