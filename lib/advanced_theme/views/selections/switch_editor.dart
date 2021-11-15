import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class SwitchEditor extends StatelessWidget {
  const SwitchEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Switch',
      children: [
        _ThumbColorPickers(),
        _TrackColorPickers(),
        _OverlayColorPickers(),
        SideBySide(
          left: _MaterialTapTargetSizeDropdown(),
          right: _SplashRadiusTextField(),
        )
      ],
    );
  }
}

class _ThumbColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.switchTheme.thumbColor !=
            current.themeData.switchTheme.thumbColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.switchTheme.thumbColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Thumb Color',
          items: [
            MaterialStateItem(
              key: const Key('switchEditor_thumbColor_default'),
              title: 'Default',
              value: color?.resolve({}) ?? Colors.grey.shade50,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchThumbDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_thumbColor_selected'),
              title: 'Selected',
              value: color?.resolve({MaterialState.selected}) ??
                  themeData.toggleableActiveColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchThumbSelectedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_thumbColor_disabled'),
              title: 'Disabled',
              value: color?.resolve({MaterialState.disabled}) ??
                  Colors.grey.shade400,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchThumbDisabledColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _TrackColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.switchTheme.trackColor !=
            current.themeData.switchTheme.trackColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.switchTheme.trackColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Track Color',
          items: [
            MaterialStateItem(
              key: const Key('switchEditor_trackColor_default'),
              title: 'Default',
              value: color?.resolve({}) ?? const Color(0x52000000),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchTrackDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_trackColor_selected'),
              title: 'Selected',
              value: color?.resolve({MaterialState.selected}) ??
                  themeData.toggleableActiveColor.withAlpha(0x80),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchTrackSelectedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_trackColor_disabled'),
              title: 'Disabled',
              value: color?.resolve({MaterialState.disabled}) ?? Colors.black12,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchTrackDisabledColorChanged(color),
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
        return previous.themeData.switchTheme.overlayColor !=
            current.themeData.switchTheme.overlayColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final color = themeData.switchTheme.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('switchEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: color?.resolve({MaterialState.pressed}) ??
                  themeData.toggleableActiveColor.withAlpha(
                    kRadialReactionAlpha,
                  ),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchOverlayPressedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: color?.resolve({MaterialState.hovered}) ??
                  themeData.hoverColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('switchEditor_overlayColor_focused'),
              title: 'Focused',
              value: color?.resolve({MaterialState.focused}) ??
                  themeData.focusColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .switchOverlayFocusedColorChanged(color),
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
        return previous.themeData.switchTheme.materialTapTargetSize !=
            current.themeData.switchTheme.materialTapTargetSize;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final size = themeData.switchTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
        return DropdownListTile(
          key: const Key('switchEditor_materialTapTargetSizeDropdown'),
          title: 'Material Tap Target Size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .switchMaterialTapTargetSize(value!);
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
        return previous.themeData.switchTheme.splashRadius !=
            current.themeData.switchTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('switchEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue: state.themeData.switchTheme.splashRadius?.toString() ??
              kRadialReactionRadius.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().switchSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
