import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class ElevatedButtonThemeEditor extends ExpansionPanelItem {
  const ElevatedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Elevated Button';

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
    final backgroundColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.backgroundColor;
    final colorScheme =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme;

    return MaterialStatePropertyCard<Color>(
      header: 'Background Color',
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: backgroundColor?.resolve({}) ?? colorScheme.primary,
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .backgroundDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_disabled'),
          title: 'Disabled',
          value: backgroundColor?.resolve({MaterialState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.12),
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .backgroundDisabledColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foregroundColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.foregroundColor;
    final colorScheme =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme;

    return MaterialStatePropertyCard<Color>(
      header: 'Foreground Color',
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_foregroundColor_default'),
          title: 'Default',
          value: foregroundColor?.resolve({}) ?? colorScheme.onPrimary,
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .foregroundDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_foregroundColor_disabled'),
          title: 'Disabled',
          value: foregroundColor?.resolve({MaterialState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.38),
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .foregroundDisabledColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlayColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.overlayColor;
    final colorScheme =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme;

    return MaterialStatePropertyCard<Color>(
      header: 'Overlay Color',
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              colorScheme.onPrimary.withOpacity(0.08),
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .overlayHoveredColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              colorScheme.onPrimary.withOpacity(0.24),
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .overlayFocusedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              colorScheme.onPrimary.withOpacity(0.24),
          onValueChanged: (color) {
            context
                .read<ElevatedButtonThemeCubit>()
                .overlayPressedColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ShadowColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shadowColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.shadowColor;
    final themeShadowColor =
        context.watch<AdvancedThemeCubit>().state.themeData.shadowColor;

    return MaterialStatePropertyCard<Color>(
      header: 'Shadow Color',
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_shadowColor_default'),
          title: 'Default',
          value: shadowColor?.resolve({}) ?? themeShadowColor,
          onValueChanged: (color) {
            context.read<ElevatedButtonThemeCubit>().shadowColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.style?.elevation !=
            current.theme.style?.elevation;
      },
      builder: (context, state) {
        final elevation = state.theme.style?.elevation;

        return MaterialStatePropertyCard<String>(
          header: 'Elevation',
          items: [
            MaterialStateItem(
              key: const Key(
                  'elevatedButtonThemeEditor_elevationTextField_default'),
              title: 'Default',
              value: (elevation?.resolve({}) ?? kElevatedButtonElevation)
                  .toString(),
              onValueChanged: (value) {
                context
                    .read<ElevatedButtonThemeCubit>()
                    .defaultElevationChanged(value);
              },
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_disabled',
              ),
              title: 'Disabled',
              value: (elevation?.resolve({MaterialState.disabled}) ?? 0)
                  .toString(),
              onValueChanged: (value) {
                context
                    .read<ElevatedButtonThemeCubit>()
                    .disabledElevationChanged(value);
              },
            ),
            MaterialStateItem(
              key: const Key(
                  'elevatedButtonThemeEditor_elevationTextField_hovered'),
              title: 'Hovered',
              value: (elevation?.resolve({MaterialState.hovered}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: (value) {
                context
                    .read<ElevatedButtonThemeCubit>()
                    .hoveredElevationChanged(value);
              },
            ),
            MaterialStateItem(
              key: const Key(
                  'elevatedButtonThemeEditor_elevationTextField_focused'),
              title: 'Focused',
              value: (elevation?.resolve({MaterialState.focused}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: (value) {
                context
                    .read<ElevatedButtonThemeCubit>()
                    .focusedElevationChanged(value);
              },
            ),
            MaterialStateItem(
              key: const Key(
                  'elevatedButtonThemeEditor_elevationTextField_pressed'),
              title: 'Pressed',
              value: (elevation?.resolve({MaterialState.pressed}) ??
                      kElevatedButtonElevation + 6)
                  .toString(),
              onValueChanged: (value) {
                context
                    .read<ElevatedButtonThemeCubit>()
                    .pressedElevationChanged(value);
              },
            ),
          ],
        );
      },
    );
  }
}
