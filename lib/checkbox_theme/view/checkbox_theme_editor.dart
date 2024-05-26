import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxThemeEditor extends ExpansionPanelItem {
  const CheckboxThemeEditor({super.key});

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
    final cubit = context.read<CheckboxThemeCubit>();
    final fillColor = context.watch<CheckboxThemeCubit>().state.theme.fillColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Fill color',
      tooltip: CheckboxThemeDocs.fillColor,
      items: [
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_default'),
          title: 'Default',
          value:
              fillColor?.resolve({}) ?? colorThemeState.unselectedWidgetColor,
          onValueChanged: cubit.fillDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_selected'),
          title: 'Selected',
          value: fillColor?.resolve({WidgetState.selected}) ??
              colorThemeState.colorScheme.secondary,
          onValueChanged: cubit.fillSelectedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_fillColor_disabled'),
          title: 'Disabled',
          value: fillColor?.resolve({WidgetState.disabled}) ??
              colorThemeState.disabledColor,
          onValueChanged: cubit.fillDisabledColorChanged,
        ),
      ],
    );
  }
}

class _CheckColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      builder: (context, state) {
        return MaterialStatesCard<Color>(
          header: 'Check color',
          tooltip: CheckboxThemeDocs.checkColor,
          items: [
            MaterialStateItem(
              key: const Key('checkboxThemeEditor_checkColor_default'),
              title: 'Default',
              value: state.theme.checkColor?.resolve({}) ??
                  const Color(0xFFFFFFFF),
              onValueChanged:
                  context.read<CheckboxThemeCubit>().checkColorChanged,
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
    final cubit = context.read<CheckboxThemeCubit>();
    final overlayColor =
        context.watch<CheckboxThemeCubit>().state.theme.overlayColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: CheckboxThemeDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({WidgetState.pressed}) ??
              colorThemeState.colorScheme.secondary.withAlpha(
                kRadialReactionAlpha,
              ),
          onValueChanged: cubit.overlayPressedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({WidgetState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('checkboxThemeEditor_overlayColor_focused'),
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
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      key: const Key('checkboxThemeEditor_materialTapTargetSizeDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          title: 'Material tap target size',
          tooltip: CheckboxThemeDocs.materialTapTargetSize,
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: context.read<CheckboxThemeCubit>().materialTapTargetSize,
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      key: const Key('checkboxThemeEditor_splashRadiusTextField'),
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Splash radius',
          tooltip: CheckboxThemeDocs.splashRadius,
          initialValue:
              (state.theme.splashRadius ?? kRadialReactionRadius).toString(),
          onChanged: context.read<CheckboxThemeCubit>().splashRadiusChanged,
        );
      },
    );
  }
}
