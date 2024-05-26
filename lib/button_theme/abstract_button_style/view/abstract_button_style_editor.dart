import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractButtonStyleEditor<T extends AbstractButtonStyleCubit>
    extends ExpansionPanelItem {
  const AbstractButtonStyleEditor({super.key});

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
        SideBySideList(
          children: [
            buildShapeDropdown(context),
            buildShapeBorderRadiusTextField(context),
          ],
        ),
        buildBackgroundColorPickers(context),
        buildForegroundColorPickers(context),
        buildOverlayColorPickers(context),
        buildShadowColorPickers(context),
        buildElevationTextFields(context),
      ],
    );
  }

  Widget buildShapeDropdown(BuildContext context) {
    final outlinedBorderEnum = OutlinedBorderEnum();
    final shape = context.watch<T>().state.style?.shape?.resolve({}) ??
        context.read<T>().defaultShape;

    return DropdownListTile(
      key: const Key('abstractButtonStyleEditor_shapeDropdown'),
      title: 'Shape',
      value: outlinedBorderEnum.convertToString(shape)!,
      values: OutlinedBorderEnum().names,
      onChanged: context.read<T>().shapeChanged,
    );
  }

  Widget buildShapeBorderRadiusTextField(BuildContext context) {
    final border = context.watch<T>().state.style?.shape?.resolve({}) ??
        context.read<T>().defaultShape;
    late final BorderRadiusGeometry? radiusGeometry;

    if (border is BeveledRectangleBorder) {
      radiusGeometry = border.borderRadius;
    } else if (border is ContinuousRectangleBorder) {
      radiusGeometry = border.borderRadius;
    } else if (border is RoundedRectangleBorder) {
      radiusGeometry = border.borderRadius;
    } else {
      radiusGeometry = null;
    }

    return MyTextFormField(
      key: const Key('abstractButtonStyleEditor_shapeBorderRadiusTextField'),
      labelText: 'Border Radius',
      enabled: border is BeveledRectangleBorder ||
          border is ContinuousRectangleBorder ||
          border is RoundedRectangleBorder,
      initialValue: radiusGeometry is BorderRadius
          ? radiusGeometry.bottomLeft.x.toString()
          : null,
      onChanged: context.read<T>().shapeBorderRadiusChanged,
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
          value: color?.resolve({WidgetState.disabled}) ??
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
          value: color?.resolve({WidgetState.hovered}) ??
              fallbackOverlayHoveredColor(colorScheme),
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_overlayColor_focused'),
          title: 'Focused',
          value: color?.resolve({WidgetState.focused}) ??
              fallbackOverlayFocusedColor(colorScheme),
          onValueChanged: cubit.overlayFocusedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('abstractButtonStyleEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: color?.resolve({WidgetState.pressed}) ??
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
