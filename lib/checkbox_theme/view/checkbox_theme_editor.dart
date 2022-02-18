import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';

class CheckboxThemeEditor extends ExpansionPanelItem {
  const CheckboxThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Checkbox';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _FillColorPickers(),
        _CheckColorPickers(),
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
    final fillColor = context.watch<CheckboxThemeCubit>().state.theme.fillColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Fill color',
      items: [
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_default'),
          title: 'Default',
          value:
              fillColor?.resolve({}) ?? colorThemeState.unselectedWidgetColor,
          onValueChanged: (color) {
            context.read<CheckboxThemeCubit>().fillDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_selected'),
          title: 'Selected',
          value: fillColor?.resolve({MaterialState.selected}) ??
              colorThemeState.toggleableActiveColor,
          onValueChanged: (color) {
            context.read<CheckboxThemeCubit>().fillSelectedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_disabled'),
          title: 'Disabled',
          value: fillColor?.resolve({MaterialState.disabled}) ??
              colorThemeState.disabledColor,
          onValueChanged: (color) {
            context.read<CheckboxThemeCubit>().fillDisabledColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _CheckColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.checkColor != current.theme.checkColor;
      },
      builder: (context, state) {
        return MaterialStatesCard<Color>(
          header: 'Check color',
          items: [
            MaterialStateItem(
              key: const Key('checkboxThemeEditor_checkColor_default'),
              title: 'Default',
              value: state.theme.checkColor?.resolve({}) ??
                  const Color(0xFFFFFFFF),
              onValueChanged: (color) {
                context.read<CheckboxThemeCubit>().checkColorChanged(color);
              },
            ),
          ],
        );
      },
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlayColor =
        context.watch<CheckboxThemeCubit>().state.theme.overlayColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      items: [
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              colorThemeState.toggleableActiveColor.withAlpha(
                kRadialReactionAlpha,
              ),
          onValueChanged: (color) {
            context
                .read<CheckboxThemeCubit>()
                .overlayPressedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: (color) {
            context
                .read<CheckboxThemeCubit>()
                .overlayHoveredColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              colorThemeState.focusColor,
          onValueChanged: (color) {
            context
                .read<CheckboxThemeCubit>()
                .overlayFocusedColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _MaterialTapTargetSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          key: const Key('checkboxThemeEditor_materialTapTargetSizeDropdown'),
          title: 'Material tap target size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context.read<CheckboxThemeCubit>().materialTapTargetSize(value!);
          },
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('checkboxThemeEditor_splashRadiusTextField'),
          labelText: 'Splash radius',
          initialValue:
              (state.theme.splashRadius ?? kRadialReactionRadius).toString(),
          onChanged: (value) {
            context.read<CheckboxThemeCubit>().splashRadiusChanged(value);
          },
        );
      },
    );
  }
}
