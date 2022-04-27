import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class SwitchThemeEditor extends ExpansionPanelItem {
  const SwitchThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Switch';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
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
    final thumbColor = context.watch<SwitchThemeCubit>().state.theme.thumbColor;
    final toggleableActiveColor =
        context.watch<ColorThemeCubit>().state.toggleableActiveColor;

    return MaterialStatesCard<Color>(
      header: 'Thumb color',
      tooltip: SwitchThemeDocs.thumbColor,
      items: [
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_default'),
          title: 'Default',
          value: thumbColor?.resolve({}) ?? Colors.grey.shade50,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().thumbDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_selected'),
          title: 'Selected',
          value: thumbColor?.resolve({MaterialState.selected}) ??
              toggleableActiveColor,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().thumbSelectedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_disabled'),
          title: 'Disabled',
          value: thumbColor?.resolve({MaterialState.disabled}) ??
              Colors.grey.shade400,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().thumbDisabledColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _TrackColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trackColor = context.watch<SwitchThemeCubit>().state.theme.trackColor;
    final toggleableActiveColor =
        context.watch<ColorThemeCubit>().state.toggleableActiveColor;

    return MaterialStatesCard<Color>(
      header: 'Track color',
      tooltip: SwitchThemeDocs.trackColor,
      items: [
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_default'),
          title: 'Default',
          value: trackColor?.resolve({}) ?? const Color(0x52000000),
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().trackDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_selected'),
          title: 'Selected',
          value: trackColor?.resolve({MaterialState.selected}) ??
              toggleableActiveColor.withAlpha(0x80),
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().trackSelectedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_disabled'),
          title: 'Disabled',
          value:
              trackColor?.resolve({MaterialState.disabled}) ?? Colors.black12,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().trackDisabledColorChanged(color);
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
        context.watch<SwitchThemeCubit>().state.theme.overlayColor;
    final colorThemeState = context.watch<ColorThemeCubit>().state;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      tooltip: SwitchThemeDocs.overlayColor,
      items: [
        MaterialStateItem(
          key: const Key('switchThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              colorThemeState.toggleableActiveColor.withAlpha(
                kRadialReactionAlpha,
              ),
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().overlayPressedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().overlayHoveredColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              colorThemeState.focusColor,
          onValueChanged: (color) {
            context.read<SwitchThemeCubit>().overlayFocusedColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _MaterialTapTargetSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          key: const Key('switchThemeEditor_materialTapTargetSizeDropdown'),
          title: 'Material tap target size',
          tooltip: SwitchThemeDocs.materialTapTargetSize,
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: (value) {
            context.read<SwitchThemeCubit>().materialTapTargetSize(value!);
          },
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('switchThemeEditor_splashRadiusTextField'),
          labelText: 'Splash radius',
          tooltip: SwitchThemeDocs.splashRadius,
          initialValue:
              (state.theme.splashRadius ?? kRadialReactionRadius).toString(),
          onChanged: (value) {
            context.read<SwitchThemeCubit>().splashRadiusChanged(value);
          },
        );
      },
    );
  }
}
