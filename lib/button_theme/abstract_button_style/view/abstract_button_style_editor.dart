import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractButtonStyleEditor<T extends AbstractButtonStyleCubit>
    extends ExpansionPanelItem {
  const AbstractButtonStyleEditor({Key? key}) : super(key: key);

  Widget buildBackgroundColorPickers(BuildContext context);

  Color fallbackForegroundDefaultColor(ColorScheme colorScheme);
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme);

  Color fallbackOverlayHoveredColor(ColorScheme colorScheme);
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme);
  Color fallbackOverlayPressedColor(ColorScheme colorScheme);

  Widget buildElevationTextFields(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        buildBackgroundColorPickers(context),
        buildForegroundColorPickers(context),
        buildOverlayColorPickers(context),
        buildShadowColorPickers(context),
        buildElevationTextFields(context),
      ],
    );
  }

  Widget buildForegroundColorPickers(BuildContext context) {
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

  Widget buildOverlayColorPickers(BuildContext context) {
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

  Widget buildShadowColorPickers(BuildContext context) {
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
}
