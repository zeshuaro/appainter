import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutlinedButtonThemeEditor extends ExpansionPanelItem {
  const OutlinedButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Outlined button';

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
        .watch<OutlinedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.backgroundColor;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      tooltip: OutlinedButtonThemeDocs.backgroundColor,
      items: [
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: backgroundColor?.resolve({}) ?? Colors.transparent,
          onValueChanged:
              context.read<OutlinedButtonThemeCubit>().backgroundColorChanged,
        ),
      ],
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OutlinedButtonThemeCubit>();
    final foregroundColor = context
        .watch<OutlinedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.foregroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Foreground color',
      tooltip: OutlinedButtonThemeDocs.foregroundColor,
      items: [
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_foregroundColor_default'),
          title: 'Default',
          value: foregroundColor?.resolve({}) ?? colorScheme.primary,
          onValueChanged: cubit.foregroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_foregroundColor_disabled'),
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
    final cubit = context.read<OutlinedButtonThemeCubit>();
    final overlayColor = context
        .watch<OutlinedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.overlayColor;
    final primaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.primary;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: OutlinedButtonThemeDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              primaryColor.withOpacity(0.04),
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              primaryColor.withOpacity(0.12),
          onValueChanged: cubit.overlayFocusedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              primaryColor.withOpacity(0.12),
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
        .watch<OutlinedButtonThemeCubit>()
        .state
        .theme
        .style
        ?.shadowColor;
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return MaterialStatesCard<Color>(
      header: 'Shadow color',
      tooltip: OutlinedButtonThemeDocs.shadowColor,
      items: [
        MaterialStateItem(
          key: const Key('outlinedButtonThemeEditor_shadowColor_default'),
          title: 'Default',
          value: shadowColor?.resolve({}) ?? themeShadowColor,
          onValueChanged:
              context.read<OutlinedButtonThemeCubit>().shadowColorChanged,
        ),
      ],
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutlinedButtonThemeCubit, OutlinedButtonThemeState>(
      builder: (context, state) {
        return MaterialStatesCard<String>(
          header: 'Elevation',
          tooltip: OutlinedButtonThemeDocs.elevation,
          items: [
            MaterialStateItem(
              key: const Key(
                'outlinedButtonThemeEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (state.theme.style?.elevation?.resolve({}) ??
                      kOutlinedButtonElevation)
                  .toString(),
              onValueChanged:
                  context.read<OutlinedButtonThemeCubit>().elevationChanged,
            ),
          ],
        );
      },
    );
  }
}
