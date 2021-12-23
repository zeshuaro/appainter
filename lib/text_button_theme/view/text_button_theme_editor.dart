import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextButtonThemeEditor extends ExpansionPanelItem {
  const TextButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Text Button';

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
    final primary =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme.primary;

    return MaterialStatePropertyCard<Color>(
      header: 'Background Color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_backgroundColor_default'),
          title: 'Default',
          value: backgroundColor?.resolve({}) ?? primary,
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
    final colorScheme =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme;

    return MaterialStatePropertyCard<Color>(
      header: 'Foreground Color',
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
    final primary =
        context.watch<AdvancedThemeCubit>().state.themeData.colorScheme.primary;

    return MaterialStatePropertyCard<Color>(
      header: 'Overlay Color',
      items: [
        MaterialStateItem(
          key: const Key('textButtonThemeEditor_overlayColor_hovered'),
          title: 'Hovered',
          value: overlayColor?.resolve({MaterialState.hovered}) ??
              primary.withOpacity(0.04),
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
              primary.withOpacity(0.12),
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
              primary.withOpacity(0.12),
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
    final themeShadowColor =
        context.watch<AdvancedThemeCubit>().state.themeData.shadowColor;

    return MaterialStatePropertyCard<Color>(
      header: 'Shadow Color',
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
        return MaterialStatePropertyCard<String>(
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
