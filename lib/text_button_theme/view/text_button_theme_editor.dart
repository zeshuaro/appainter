import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class TextButtonThemeEditor extends ExpansionPanelItem {
  const TextButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text button';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _BackgroundColorPickers(),
        _ForegroundColorPickers(),
        _OverlayColorPickers(),
        _ShadowColorPickers(),
        _ElevationTextFields(),
      ],
    );
  }
}

class _BackgroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = context
        .watch<TextButtonThemeCubit>()
        .state
        .theme
        .style
        ?.backgroundColor;

    return MaterialStatesCard<Color>(
      header: 'Background color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: backgroundColor?.resolve({}) ?? Colors.transparent,
          onValueChanged: (color) {
            context.read<TextButtonThemeCubit>().backgroundColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foregroundColor = context
        .watch<TextButtonThemeCubit>()
        .state
        .theme
        .style
        ?.foregroundColor;
    final colorScheme = context.watch<ColorThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Foreground color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_foregroundColor_default'),
          title: 'Default',
          value: foregroundColor?.resolve({}) ?? colorScheme.primary,
          onValueChanged: (color) {
            context
                .read<TextButtonThemeCubit>()
                .foregroundDefaultColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_foregroundColor_disabled'),
          title: 'Disabled',
          value: foregroundColor?.resolve({MaterialState.disabled}) ??
              colorScheme.onSurface.withOpacity(0.38),
          onValueChanged: (color) {
            context
                .read<TextButtonThemeCubit>()
                .foregroundDisabledColorChanged(color);
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
        context.watch<TextButtonThemeCubit>().state.theme.style?.overlayColor;
    final primaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.primary;

    return MaterialStatesCard<Color>(
      header: 'Overlay color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              primaryColor.withOpacity(0.04),
          onValueChanged: (color) {
            context
                .read<TextButtonThemeCubit>()
                .overlayHoveredColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_overlayColor_focused'),
          title: 'Focused',
          value: overlayColor?.resolve({MaterialState.focused}) ??
              primaryColor.withOpacity(0.12),
          onValueChanged: (color) {
            context
                .read<TextButtonThemeCubit>()
                .overlayFocusedColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_overlayColor_pressed'),
          title: 'Pressed',
          value: overlayColor?.resolve({MaterialState.pressed}) ??
              primaryColor.withOpacity(0.12),
          onValueChanged: (color) {
            context
                .read<TextButtonThemeCubit>()
                .overlayPressedColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ShadowColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shadowColor =
        context.watch<TextButtonThemeCubit>().state.theme.style?.shadowColor;
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return MaterialStatesCard<Color>(
      header: 'Shadow color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_shadowColor_default'),
          title: 'Default',
          value: shadowColor?.resolve({}) ?? themeShadowColor,
          onValueChanged: (color) {
            context.read<TextButtonThemeCubit>().shadowColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextButtonThemeCubit, TextButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.style?.elevation !=
            current.theme.style?.elevation;
      },
      builder: (context, state) {
        return MaterialStatesCard<String>(
          header: 'Elevation',
          items: [
            MaterialStateItem(
              key: const Key(
                'textButtonThemeEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (state.theme.style?.elevation?.resolve({}) ??
                      kTextButtonElevation)
                  .toString(),
              onValueChanged: (value) {
                context.read<TextButtonThemeCubit>().elevationChanged(value);
              },
            ),
          ],
        );
      },
    );
  }
}
