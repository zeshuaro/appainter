import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioThemeEditor extends ExpansionPanelItem {
  const RadioThemeEditor({super.key});

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
    final cubit = context.read<RadioThemeCubit>();
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
          onValueChanged: cubit.fillDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_fillColor_selected'),
          title: 'Selected',
          value: fillColor?.resolve({WidgetState.selected}) ??
              colorThemeState.primaryColor,
          onValueChanged: cubit.fillSelectedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_fillColor_disabled'),
          title: 'Disabled',
          value: fillColor?.resolve({WidgetState.disabled}) ??
              colorThemeState.disabledColor,
          onValueChanged: cubit.fillDisabledColorChanged,
        ),
      ],
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RadioThemeCubit>();
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
          value: overlayColor?.resolve({WidgetState.pressed}) ??
              colorThemeState.primaryColor.withAlpha(
                kRadialReactionAlpha,
              ),
          onValueChanged: cubit.overlayPressedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({WidgetState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('radioThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({WidgetState.focused}) ??
              colorThemeState.focusColor,
          onValueChanged: cubit.overlayFocusedColorChanged,
        ),
      ],
    );
  }
}

class _MaterialTapTargetSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioThemeCubit, RadioThemeState>(
      key: const Key('radioThemeEditor_materialTapTargetSizeDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          title: 'Material tap target size',
          tooltip: RadioThemeDocs.materialTapTargetSize,
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: context.read<RadioThemeCubit>().materialTapTargetSize,
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioThemeCubit, RadioThemeState>(
      key: const Key('radioThemeEditor_splashRadiusTextField'),
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Splash radius',
          tooltip: RadioThemeDocs.splashRadius,
          initialValue:
              (state.theme.splashRadius ?? kRadialReactionRadius).toString(),
          onChanged: context.read<RadioThemeCubit>().splashRadiusChanged,
        );
      },
    );
  }
}
