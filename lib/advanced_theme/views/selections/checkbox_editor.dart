import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class CheckboxEditor extends ExpansionPanelItem {
  const CheckboxEditor({Key? key}) : super(key: key);

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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        final prevTheme = previous.themeData;
        final currTheme = current.themeData;

        return prevTheme.checkboxTheme.fillColor !=
                currTheme.checkboxTheme.fillColor ||
            prevTheme.unselectedWidgetColor !=
                currTheme.unselectedWidgetColor ||
            prevTheme.toggleableActiveColor !=
                currTheme.toggleableActiveColor ||
            prevTheme.disabledColor != currTheme.disabledColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.checkboxTheme.fillColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Fill Color',
          items: [
            MaterialStateItem(
              key: const Key('checkboxEditor_fillColor_default'),
              title: 'Default',
              value: color?.resolve({}) ?? themeData.unselectedWidgetColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxFillDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('checkboxEditor_fillColor_selected'),
              title: 'Selected',
              value: color?.resolve({MaterialState.selected}) ??
                  themeData.toggleableActiveColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxFillSelectedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('checkboxEditor_fillColor_disabled'),
              title: 'Disabled',
              value: color?.resolve({MaterialState.disabled}) ??
                  themeData.disabledColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxFillDisabledColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _CheckColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.checkboxTheme.checkColor !=
            current.themeData.checkboxTheme.checkColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.checkboxTheme.checkColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Check Color',
          items: [
            MaterialStateItem(
              key: const Key('checkboxEditor_checkColor_default'),
              title: 'Default',
              value: color?.resolve({}) ?? const Color(0xFFFFFFFF),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxCheckColorChanged(color),
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

        return prevTheme.checkboxTheme.overlayColor !=
                currTheme.checkboxTheme.overlayColor ||
            prevTheme.toggleableActiveColor !=
                currTheme.toggleableActiveColor ||
            prevTheme.hoverColor != currTheme.hoverColor ||
            prevTheme.focusColor != currTheme.focusColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.checkboxTheme.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('checkboxEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: color?.resolve({MaterialState.pressed}) ??
                  themeData.toggleableActiveColor.withAlpha(
                    kRadialReactionAlpha,
                  ),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxOverlayPressedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('checkboxEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: color?.resolve({MaterialState.hovered}) ??
                  themeData.hoverColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('checkboxEditor_overlayColor_focused'),
              title: 'Focused',
              value: color?.resolve({MaterialState.focused}) ??
                  themeData.focusColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .checkboxOverlayFocusedColorChanged(color),
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
        return previous.themeData.checkboxTheme.materialTapTargetSize !=
            current.themeData.checkboxTheme.materialTapTargetSize;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final size = themeData.checkboxTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
        return DropdownListTile(
          key: const Key('checkboxEditor_materialTapTargetSizeDropdown'),
          title: 'Material Tap Target Size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .checkboxMaterialTapTargetSize(value!);
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
        return previous.themeData.checkboxTheme.splashRadius !=
            current.themeData.checkboxTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('checkboxEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue:
              state.themeData.checkboxTheme.splashRadius?.toString() ??
                  kRadialReactionRadius.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .checkboxSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
