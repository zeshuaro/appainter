import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractButtonStyleEditor<T extends AbstractButtonStyleCubit>
    extends ExpansionPanelItem {
  const AbstractButtonStyleEditor({Key? key}) : super(key: key);

  Color fallbackBackgroundDefaultColor(ColorScheme colorScheme);

  Color fallbackBackgroundDisabledColor(ColorScheme colorScheme);

  Color fallbackForegroundDefaultColor(ColorScheme colorScheme);

  Color fallbackForegroundDisabledColor(ColorScheme colorScheme);

  Color fallbackOverlayHoveredColor(ColorScheme colorScheme);

  Color fallbackOverlayFocusedColor(ColorScheme colorScheme);

  Color fallbackOverlayPressedColor(ColorScheme colorScheme);

  double get fallbackElevationDefault;

  double get fallbackElevationHovered;

  double get fallbackElevationFocused;

  double get fallbackElevationPressed;

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _buildBackgroundColorPickers(context),
        _buildForegroundColorPickers(context),
        _buildOverlayColorPickers(context),
        _buildShadowColorPickers(context),
        _buildElevationTextFields(context),
      ],
    );
  }

  Widget _buildBackgroundColorPickers(BuildContext context) {
    final cubit = context.read<T>();
    final color = context.watch<T>().state.style?.backgroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      tooltip: AbstractButtonStyleDocs.backgroundColor,
      items: [
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_backgroundColor_default'),
          title: 'Default',
          value:
              color?.resolve({}) ?? fallbackBackgroundDefaultColor(colorScheme),
          onValueChanged: cubit.backgroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_backgroundColor_disabled'),
          title: 'Disabled',
          value: color?.resolve({MaterialState.disabled}) ??
              fallbackBackgroundDisabledColor(colorScheme),
          onValueChanged: cubit.backgroundDisabledColorChanged,
        ),
      ],
    );
  }

  Widget _buildForegroundColorPickers(BuildContext context) {
    final cubit = context.read<T>();
    final color = context.watch<T>().state.style?.foregroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Foreground color',
      tooltip: AbstractButtonStyleDocs.foregroundColor,
      items: [
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_foregroundColor_default'),
          title: 'Default',
          value:
              color?.resolve({}) ?? fallbackForegroundDefaultColor(colorScheme),
          onValueChanged: cubit.foregroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_foregroundColor_disabled'),
          title: 'Disabled',
          value: color?.resolve({MaterialState.disabled}) ??
              fallbackForegroundDisabledColor(colorScheme),
          onValueChanged: cubit.foregroundDisabledColorChanged,
        ),
      ],
    );
  }

  Widget _buildOverlayColorPickers(BuildContext context) {
    final cubit = context.read<T>();
    final color = context.watch<T>().state.style?.overlayColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: AbstractButtonStyleDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: color?.resolve({MaterialState.hovered}) ??
              fallbackOverlayHoveredColor(colorScheme),
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_overlayColor_focused'),
          title: 'Focused',
          value: color?.resolve({MaterialState.focused}) ??
              fallbackOverlayFocusedColor(colorScheme),
          onValueChanged: cubit.overlayFocusedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: color?.resolve({MaterialState.pressed}) ??
              fallbackOverlayPressedColor(colorScheme),
          onValueChanged: cubit.overlayPressedColorChanged,
        ),
      ],
    );
  }

  Widget _buildShadowColorPickers(BuildContext context) {
    final shadowColor = context.watch<T>().state.style?.shadowColor;
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return MaterialStatesCard<Color>(
      header: 'Shadow color',
      tooltip: AbstractButtonStyleDocs.shadowColor,
      items: [
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_shadowColor_default'),
          title: 'Default',
          value: shadowColor?.resolve({}) ?? themeShadowColor,
          onValueChanged: context.read<T>().shadowColorChanged,
        ),
      ],
    );
  }

  Widget _buildElevationTextFields(BuildContext context) {
    return BlocBuilder<T, ButtonStyleState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        final elevation = state.style?.elevation;

        return MaterialStatesCard<String>(
          header: 'Elevation',
          tooltip: AbstractButtonStyleDocs.elevation,
          items: [
            MaterialStateItem(
              key: const Key(
                'abstractButtonStyleEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (elevation?.resolve({}) ?? fallbackElevationDefault)
                  .toString(),
              onValueChanged: cubit.defaultElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'abstractButtonStyleEditor_elevationTextField_disabled',
              ),
              title: 'Disabled',
              value: (elevation?.resolve({MaterialState.disabled}) ?? 0)
                  .toString(),
              onValueChanged: cubit.disabledElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'abstractButtonStyleEditor_elevationTextField_hovered',
              ),
              title: 'Hovered',
              value: (elevation?.resolve({MaterialState.hovered}) ??
                      fallbackElevationHovered)
                  .toString(),
              onValueChanged: cubit.hoveredElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'abstractButtonStyleEditor_elevationTextField_focused',
              ),
              title: 'Focused',
              value: (elevation?.resolve({MaterialState.focused}) ??
                      fallbackElevationFocused)
                  .toString(),
              onValueChanged: cubit.focusedElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'abstractButtonStyleEditor_elevationTextField_pressed',
              ),
              title: 'Pressed',
              value: (elevation?.resolve({MaterialState.pressed}) ??
                      fallbackElevationPressed)
                  .toString(),
              onValueChanged: cubit.pressedElevationChanged,
            ),
          ],
        );
      },
    );
  }
}
