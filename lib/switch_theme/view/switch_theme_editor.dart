import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchThemeEditor extends ExpansionPanelItem {
  const SwitchThemeEditor({super.key});

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
        ),
      ],
    );
  }
}

class _ThumbColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SwitchThemeCubit>();
    final thumbColor = context.watch<SwitchThemeCubit>().state.theme.thumbColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return MaterialStatesCard<Color>(
      header: 'Thumb color',
      tooltip: SwitchThemeDocs.thumbColor,
      items: [
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_default'),
          title: 'Default',
          value: thumbColor?.resolve({}) ?? Colors.grey.shade50,
          onValueChanged: cubit.thumbDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_selected'),
          title: 'Selected',
          value: thumbColor?.resolve({WidgetState.selected}) ?? primaryColor,
          onValueChanged: cubit.thumbSelectedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_thumbColor_disabled'),
          title: 'Disabled',
          value: thumbColor?.resolve({WidgetState.disabled}) ??
              Colors.grey.shade400,
          onValueChanged: cubit.thumbDisabledColorChanged,
        ),
      ],
    );
  }
}

class _TrackColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SwitchThemeCubit>();
    final trackColor = context.watch<SwitchThemeCubit>().state.theme.trackColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return MaterialStatesCard<Color>(
      header: 'Track color',
      tooltip: SwitchThemeDocs.trackColor,
      items: [
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_default'),
          title: 'Default',
          value: trackColor?.resolve({}) ?? const Color(0x52000000),
          onValueChanged: cubit.trackDefaultColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_selected'),
          title: 'Selected',
          value: trackColor?.resolve({WidgetState.selected}) ??
              primaryColor.withAlpha(0x80),
          onValueChanged: cubit.trackSelectedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_trackColor_disabled'),
          title: 'Disabled',
          value: trackColor?.resolve({WidgetState.disabled}) ?? Colors.black12,
          onValueChanged: cubit.trackDisabledColorChanged,
        ),
      ],
    );
  }
}

class _OverlayColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SwitchThemeCubit>();
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
          value: overlayColor?.resolve({WidgetState.pressed}) ??
              colorThemeState.primaryColor.withAlpha(kRadialReactionAlpha),
          onValueChanged: cubit.overlayPressedColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({WidgetState.hovered}) ??
              colorThemeState.hoverColor,
          onValueChanged: cubit.overlayHoveredColorChanged,
        ),
        MaterialStateItem(
          key: const Key('switchThemeEditor_overlayColor_focused'),
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
    return BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
      key: const Key('switchThemeEditor_materialTapTargetSizeDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.materialTapTargetSize !=
            current.theme.materialTapTargetSize;
      },
      builder: (context, state) {
        final size =
            state.theme.materialTapTargetSize ?? MaterialTapTargetSize.padded;
        return DropdownListTile(
          title: 'Material tap target size',
          tooltip: SwitchThemeDocs.materialTapTargetSize,
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(MaterialTapTargetSize.values),
          onChanged: context.read<SwitchThemeCubit>().materialTapTargetSize,
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
      key: const Key('switchThemeEditor_splashRadiusTextField'),
      buildWhen: (previous, current) {
        return previous.theme.splashRadius != current.theme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
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
