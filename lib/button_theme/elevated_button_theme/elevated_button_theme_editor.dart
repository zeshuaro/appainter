import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElevatedButtonThemeEditor
    extends AbstractButtonStyleEditor<ElevatedButtonThemeCubit> {
  static const _baseElevation = 2.0;

  const ElevatedButtonThemeEditor({super.key});

  @override
  Color fallbackForegroundDefaultColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary;
  }

  @override
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.38);
  }

  @override
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.24);
  }

  @override
  Color fallbackOverlayHoveredColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.08);
  }

  @override
  Color fallbackOverlayPressedColor(ColorScheme colorScheme) {
    return colorScheme.onPrimary.withOpacity(0.24);
  }

  @override
  String get header => 'Elevated button';

  @override
  Widget buildBackgroundColorPickers(BuildContext context) {
    final cubit = context.read<ElevatedButtonThemeCubit>();
    final color =
        context.watch<ElevatedButtonThemeCubit>().state.style?.backgroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      tooltip: AbstractButtonStyleDocs.backgroundColor,
      items: [
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: color?.resolve({}) ?? colorScheme.primary,
          onValueChanged: cubit.backgroundDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('elevatedButtonThemeEditor_backgroundColor_disabled'),
          title: 'Disabled',
          value: color?.resolve({WidgetState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.12),
          onValueChanged: cubit.backgroundDisabledColorChanged,
        ),
      ],
    );
  }

  @override
  Widget buildElevationTextFields(BuildContext context) {
    return BlocBuilder<ElevatedButtonThemeCubit, ButtonStyleState>(
      builder: (context, state) {
        final cubit = context.read<ElevatedButtonThemeCubit>();
        final elevation = state.style?.elevation;

        return MaterialStatesCard<String>(
          header: 'Elevation',
          tooltip: AbstractButtonStyleDocs.elevation,
          items: [
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (elevation?.resolve({}) ?? _baseElevation).toString(),
              onValueChanged: cubit.defaultElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_disabled',
              ),
              title: 'Disabled',
              value:
                  (elevation?.resolve({WidgetState.disabled}) ?? 0).toString(),
              onValueChanged: cubit.disabledElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_hovered',
              ),
              title: 'Hovered',
              value: (elevation?.resolve({WidgetState.hovered}) ??
                      _baseElevation + 2)
                  .toString(),
              onValueChanged: cubit.hoveredElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_focused',
              ),
              title: 'Focused',
              value: (elevation?.resolve({WidgetState.focused}) ??
                      _baseElevation + 2)
                  .toString(),
              onValueChanged: cubit.focusedElevationChanged,
            ),
            MaterialStateItem(
              key: const Key(
                'elevatedButtonThemeEditor_elevationTextField_pressed',
              ),
              title: 'Pressed',
              value: (elevation?.resolve({WidgetState.pressed}) ??
                      _baseElevation + 6)
                  .toString(),
              onValueChanged: cubit.pressedElevationChanged,
            ),
          ],
        );
      },
    );
  }
}
