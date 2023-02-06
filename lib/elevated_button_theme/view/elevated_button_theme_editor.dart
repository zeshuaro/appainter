import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElevatedButtonThemeEditor extends ExpansionPanelItem {
  const ElevatedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Elevated button';

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
    final cubit = context.read<ElevatedButtonThemeCubit>();
    final backgroundColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.backgroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      tooltip: ElevatedButtonThemeDocs.backgroundColor,
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: backgroundColor?.resolve({}) ?? colorScheme.primary,
          onValueChanged: cubit.backgroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_disabled'),
          title: 'Disabled',
          value: backgroundColor?.resolve({MaterialState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.12),
          onValueChanged: cubit.backgroundDisabledColorChanged,
        ),
      ],
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ElevatedButtonThemeCubit>();
    final foregroundColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.foregroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Foreground color',
      tooltip: ElevatedButtonThemeDocs.foregroundColor,
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_foregroundColor_default'),
          title: 'Default',
          value: foregroundColor?.resolve({}) ?? colorScheme.onPrimary,
          onValueChanged: cubit.foregroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_foregroundColor_disabled'),
          title: 'Disabled',
          value: foregroundColor?.resolve({MaterialState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.38),
          onValueChanged: cubit.foregroundDisabledColorChanged,
        ),
      ],
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ElevatedButtonThemeCubit>();
    final overlayColor = context
        .watch<ElevatedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.overlayColor;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: ElevatedButtonThemeDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              onPrimaryColor.withOpacity(0.08),
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              onPrimaryColor.withOpacity(0.24),
          onValueChanged: cubit.overlayFocusedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              onPrimaryColor.withOpacity(0.24),
          onValueChanged: cubit.overlayPressedColorChanged,
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
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return MaterialStatesCard<Color>(
      header: 'Shadow color',
      tooltip: ElevatedButtonThemeDocs.shadowColor,
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_shadowColor_default'),
          title: 'Default',
          value: shadowColor?.resolve({}) ?? themeShadowColor,
          onValueChanged:
              context.read<ElevatedButtonThemeCubit>().shadowColorChanged,
        ),
      ],
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElevatedButtonThemeCubit, ElevatedButtonThemeState>(
      builder: (context, state) {
        final cubit = context.read<ElevatedButtonThemeCubit>();
        final elevation = state.theme.style?.elevation;

        return MaterialStatesCard<String>(
          header: 'Elevation',
          tooltip: ElevatedButtonThemeDocs.elevation,
          items: [
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (elevation?.resolve({}) ?? kElevatedButtonElevation)
                  .toString(),
              onValueChanged: cubit.defaultElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_disabled',
              ),
              title: 'Disabled',
              value: (elevation?.resolve({MaterialState.disabled}) ?? 0)
                  .toString(),
              onValueChanged: cubit.disabledElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_hovered',
              ),
              title: 'Hovered',
              value: (elevation?.resolve({MaterialState.hovered}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: cubit.hoveredElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_focused',
              ),
              title: 'Focused',
              value: (elevation?.resolve({MaterialState.focused}) ??
                      kElevatedButtonElevation + 2)
                  .toString(),
              onValueChanged: cubit.focusedElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_pressed',
              ),
              title: 'Pressed',
              value: (elevation?.resolve({MaterialState.pressed}) ??
                      kElevatedButtonElevation + 6)
                  .toString(),
              onValueChanged: cubit.pressedElevationChanged,
            ),
          ],
        );
      },
    );
  }
}
