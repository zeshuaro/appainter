import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class ElevatedButtonEditor extends StatelessWidget {
  const ElevatedButtonEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Elevated Button',
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
        return previous.themeData.elevatedButtonTheme.style?.backgroundColor !=
                current.themeData.elevatedButtonTheme.style?.backgroundColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final colorScheme = themeData.colorScheme;
        final backgroundColor =
            themeData.elevatedButtonTheme.style?.backgroundColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Background Color',
          items: [
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_backgroundColor_default'),
              title: 'Default',
              value: backgroundColor?.resolve({}) ?? colorScheme.primary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonBackgroundDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_backgroundColor_disabled'),
              title: 'Disabled',
              value: backgroundColor?.resolve({MaterialState.disabled}) ??
                  colorScheme.onSurface.withOpacity(0.12),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonBackgroundDisabledColorChanged(color),
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
        return previous.themeData.elevatedButtonTheme.style?.foregroundColor !=
                current.themeData.elevatedButtonTheme.style?.foregroundColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final colorScheme = themeData.colorScheme;
        final foregroundColor =
            themeData.elevatedButtonTheme.style?.foregroundColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Foreground Color',
          items: [
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_foregroundColor_default'),
              title: 'Default',
              value: foregroundColor?.resolve({}) ?? colorScheme.onPrimary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonForegroundDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_foregroundColor_disabled'),
              title: 'Disabled',
              value: foregroundColor?.resolve({MaterialState.disabled}) ??
                  colorScheme.onSurface.withOpacity(0.38),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonForegroundDisabledColorChanged(color),
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
        return previous.themeData.elevatedButtonTheme.style?.overlayColor !=
                current.themeData.elevatedButtonTheme.style?.overlayColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final colorScheme = themeData.colorScheme;
        final overlayColor = themeData.elevatedButtonTheme.style?.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: overlayColor?.resolve({MaterialState.hovered}) ??
                  colorScheme.onPrimary.withOpacity(0.08),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_overlayColor_focused'),
              title: 'Focused',
              value: overlayColor?.resolve({MaterialState.focused}) ??
                  colorScheme.onPrimary.withOpacity(0.24),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonOverlayFocusedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: overlayColor?.resolve({MaterialState.pressed}) ??
                  colorScheme.onPrimary.withOpacity(0.24),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonOverlayPressedColorChanged(color),
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
        return previous.themeData.elevatedButtonTheme.style?.shadowColor !=
                current.themeData.elevatedButtonTheme.style?.shadowColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final shadowColor = themeData.elevatedButtonTheme.style?.shadowColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Shadow Color',
          items: [
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_shadowColor_default'),
              title: 'Default',
              value: shadowColor?.resolve({}) ?? themeData.shadowColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonShadowColorChanged(color),
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
        return previous.themeData.elevatedButtonTheme.style?.elevation !=
            current.themeData.elevatedButtonTheme.style?.elevation;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final elevation = themeData.elevatedButtonTheme.style?.elevation;

        return MaterialStatePropertyCard<String>(
          header: 'Elevation',
          items: [
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_elevationTextField_default'),
              title: 'Default',
              value: (elevation?.resolve({}) ?? kElevatedButtonElevation)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonDefaultElevationChanged(value),
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonEditor_elevationTextField_disabled',
              ),
              title: 'Disabled',
              value: (elevation?.resolve({MaterialState.disabled}) ?? 0)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonDisabledElevationChanged(value),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_elevationTextField_hovered'),
              title: 'Hovered',
              value: (elevation?.resolve({MaterialState.hovered}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonHoveredElevationChanged(value),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_elevationTextField_focused'),
              title: 'Focused',
              value: (elevation?.resolve({MaterialState.focused}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonFocusedElevationChanged(value),
            ),
            MaterialStateItem(
              key: const Key('elevatedButtonEditor_elevationTextField_pressed'),
              title: 'Pressed',
              value: (elevation?.resolve({MaterialState.pressed}) ??
                      kElevatedButtonElevation + 6)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .elevatedButtonPressedElevationChanged(value),
            ),
          ],
        );
      },
    );
  }
}
