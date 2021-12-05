import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class RadioEditor extends ExpansionPanelItem {
  const RadioEditor({Key? key}) : super(key: key);

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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        final prevTheme = previous.themeData;
        final currTheme = current.themeData;

        return prevTheme.radioTheme.fillColor !=
                currTheme.radioTheme.fillColor ||
            prevTheme.unselectedWidgetColor !=
                currTheme.unselectedWidgetColor ||
            prevTheme.toggleableActiveColor !=
                currTheme.toggleableActiveColor ||
            prevTheme.disabledColor != currTheme.disabledColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.radioTheme.fillColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Fill Color',
          items: [
            MaterialStateItem(
              key: const Key('radioEditor_fillColor_default'),
              title: 'Default',
              value: color?.resolve({}) ?? themeData.unselectedWidgetColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioFillDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('radioEditor_fillColor_selected'),
              title: 'Selected',
              value: color?.resolve({MaterialState.selected}) ??
                  themeData.toggleableActiveColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioFillSelectedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('radioEditor_fillColor_disabled'),
              title: 'Disabled',
              value: color?.resolve({MaterialState.disabled}) ??
                  themeData.disabledColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioFillDisabledColorChanged(color),
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        final prevTheme = previous.themeData;
        final currTheme = current.themeData;

        return prevTheme.radioTheme.overlayColor !=
                currTheme.radioTheme.overlayColor ||
            prevTheme.toggleableActiveColor !=
                currTheme.toggleableActiveColor ||
            prevTheme.hoverColor != currTheme.hoverColor ||
            prevTheme.focusColor != currTheme.focusColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.radioTheme.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('radioEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: color?.resolve({MaterialState.pressed}) ??
                  themeData.toggleableActiveColor.withAlpha(
                    kRadialReactionAlpha,
                  ),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioOverlayPressedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('radioEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: color?.resolve({MaterialState.hovered}) ??
                  themeData.hoverColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('radioEditor_overlayColor_focused'),
              title: 'Focused',
              value: color?.resolve({MaterialState.focused}) ??
                  themeData.focusColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .radioOverlayFocusedColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _MaterialTapTargetSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.radioTheme.materialTapTargetSize !=
            current.themeData.radioTheme.materialTapTargetSize;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final size = themeData.radioTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
        return DropdownListTile(
          key: const Key('radioEditor_materialTapTargetSizeDropdown'),
          title: 'Material Tap Target Size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .radioMaterialTapTargetSize(value!);
          },
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.radioTheme.splashRadius !=
            current.themeData.radioTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('radioEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue: state.themeData.radioTheme.splashRadius?.toString() ??
              kRadialReactionRadius.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().radioSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
