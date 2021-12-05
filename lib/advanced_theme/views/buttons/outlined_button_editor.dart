import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class OutlinedButtonEditor extends ExpansionPanelItem {
  const OutlinedButtonEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Outlined Button';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _BackgroundColorPickers(),
        _ForegroundColorPickers(),
        _OverlayColorPickers(),
        _ShadowColorPickers(),
        _ElevationTextFields(),
      ],
    );
  }
}

class _BackgroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style?.backgroundColor !=
                current.themeData.outlinedButtonTheme.style?.backgroundColor ||
            previous.themeData.colorScheme.primary !=
                current.themeData.colorScheme.primary;
      },
      builder: (context, state) {
        final themeData = state.themeData;

        return MaterialStatePropertyCard<Color>(
          header: 'Background Color',
          items: [
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_backgroundColor_default'),
              title: 'Default',
              value: themeData.outlinedButtonTheme.style?.backgroundColor
                      ?.resolve({}) ??
                  themeData.colorScheme.primary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonBackgroundColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style?.foregroundColor !=
                current.themeData.outlinedButtonTheme.style?.foregroundColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final colorScheme = themeData.colorScheme;
        final foregroundColor =
            themeData.outlinedButtonTheme.style?.foregroundColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Foreground Color',
          items: [
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_foregroundColor_default'),
              title: 'Default',
              value: foregroundColor?.resolve({}) ?? colorScheme.primary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonForegroundDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_foregroundColor_disabled'),
              title: 'Disabled',
              value: foregroundColor?.resolve({MaterialState.disabled}) ??
                  colorScheme.onSurface.withOpacity(0.38),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonForegroundDisabledColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style?.overlayColor !=
                current.themeData.outlinedButtonTheme.style?.overlayColor ||
            previous.themeData.colorScheme.primary !=
                current.themeData.colorScheme.primary;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final primary = themeData.colorScheme.primary;
        final overlayColor = themeData.outlinedButtonTheme.style?.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: overlayColor?.resolve({MaterialState.hovered}) ??
                  primary.withOpacity(0.04),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_overlayColor_focused'),
              title: 'Focused',
              value: overlayColor?.resolve({MaterialState.focused}) ??
                  primary.withOpacity(0.12),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonOverlayFocusedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: overlayColor?.resolve({MaterialState.pressed}) ??
                  primary.withOpacity(0.12),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonOverlayPressedColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ShadowColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style?.shadowColor !=
            current.themeData.outlinedButtonTheme.style?.shadowColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;

        return MaterialStatePropertyCard<Color>(
          header: 'Shadow Color',
          items: [
            MaterialStateItem(
              key: const Key('outlinedButtonEditor_shadowColor_default'),
              title: 'Default',
              value: themeData.outlinedButtonTheme.style?.shadowColor
                      ?.resolve({}) ??
                  themeData.shadowColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonShadowColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.outlinedButtonTheme.style?.elevation !=
            current.themeData.outlinedButtonTheme.style?.elevation;
      },
      builder: (context, state) {
        return MaterialStatePropertyCard<String>(
          header: 'Elevation',
          items: [
            MaterialStateItem(
              key: const Key(
                'outlinedButtonEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (state.themeData.outlinedButtonTheme.style?.elevation
                          ?.resolve({}) ??
                      kOutlinedButtonElevation)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .outlinedButtonElevationChanged(value),
            ),
          ],
        );
      },
    );
  }
}
