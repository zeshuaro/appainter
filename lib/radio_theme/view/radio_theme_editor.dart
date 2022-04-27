import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';

class RadioThemeEditor extends ExpansionPanelItem {
  const RadioThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Radio';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _FillColorPickers(),
        _OverlayColorPickers(),
        SideBySide(
          left: _MaterialTapTargetSizeDropdown(),
          right: _SplashRadiusTextField(),
        ),
      ],
    );
  }
}

class _FillColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fillColor = context.watch<RadioThemeCubit>().state.theme.fillColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Fill color',
      tooltip: RadioThemeDocs.fillColor,
      items: [
        MaterialStateItem(
          key: const Key('radioThemeEditor_fillColor_default'),
          title: 'Default',
          value:
              fillColor?.resolve({}) ?? colorThemeState.unselectedWidgetColor,
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().fillDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_fillColor_selected'),
          title: 'Selected',
          value: fillColor?.resolve({MaterialState.selected}) ??
              colorThemeState.toggleableActiveColor,
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().fillSelectedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_fillColor_disabled'),
          title: 'Disabled',
          value: fillColor?.resolve({MaterialState.disabled}) ??
              colorThemeState.disabledColor,
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().fillDisabledColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlayColor =
        context.watch<RadioThemeCubit>().state.theme.overlayColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: RadioThemeDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('radioThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              colorThemeState.toggleableActiveColor.withAlpha(
                kRadialReactionAlpha,
              ),
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().overlayPressedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().overlayHoveredColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              colorThemeState.focusColor,
          onValueChanged: (color) {
            context.read<RadioThemeCubit>().overlayFocusedColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _MaterialTapTargetSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioThemeCubit, RadioThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          key: const Key('radioThemeEditor_materialTapTargetSizeDropdown'),
          title: 'Material tap target size',
          tooltip: RadioThemeDocs.materialTapTargetSize,
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context.read<RadioThemeCubit>().materialTapTargetSize(value!);
          },
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioThemeCubit, RadioThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('radioThemeEditor_splashRadiusTextField'),
          labelText: 'Splash radius',
          tooltip: RadioThemeDocs.splashRadius,
          initialValue:
              (state.theme.splashRadius ?? kRadialReactionRadius).toString(),
          onChanged: (value) {
            context.read<RadioThemeCubit>().splashRadiusChanged(value);
          },
        );
      },
    );
  }
}
