import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractFlatButtonStyleEditor<
        T extends AbstractFlatButtonStyleCubit>
    extends AbstractButtonStyleEditor<T> {
  const AbstractFlatButtonStyleEditor({super.key});

  @override
  Color fallbackForegroundDefaultColor(ColorScheme colorScheme) {
    return colorScheme.primary;
  }

  @override
  Color fallbackForegroundDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.38);
  }

  @override
  Color fallbackOverlayFocusedColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.12);
  }

  @override
  Color fallbackOverlayHoveredColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.04);
  }

  @override
  Color fallbackOverlayPressedColor(ColorScheme colorScheme) {
    return colorScheme.primary.withOpacity(0.12);
  }

  @override
  Widget buildBackgroundColorPickers(BuildContext context) {
    final color = context.watch<T>().state.style?.backgroundColor;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      tooltip: AbstractButtonStyleDocs.backgroundColor,
      items: [
        MaterialStateItem(
          key: const Key(
            'abstractFlatButtonStyleEditor_backgroundColor_default',
          ),
          title: 'Default',
          value: color?.resolve({}) ?? Colors.transparent,
          onValueChanged: context.read<T>().backgroundColorChanged,
        ),
      ],
    );
  }

  @override
  Widget buildElevationTextFields(BuildContext context) {
    return BlocBuilder<T, ButtonStyleState>(
      builder: (context, state) {
        return MaterialStatesCard<String>(
          header: 'Elevation',
          tooltip: AbstractButtonStyleDocs.elevation,
          items: [
            MaterialStateItem(
              key: const Key(
                'abstractFlatButtonStyleEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (state.style?.elevation?.resolve({}) ?? 0).toString(),
              onValueChanged: context.read<T>().elevationChanged,
            ),
          ],
        );
      },
    );
  }
}
