import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TextButtonEditor extends StatelessWidget {
  const TextButtonEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Text Button',
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.textButtonTheme.style?.backgroundColor !=
                current.themeData.textButtonTheme.style?.backgroundColor ||
            previous.themeData.colorScheme.primary !=
                current.themeData.colorScheme.primary;
      },
      builder: (context, state) {
        final themeData = state.themeData;

        return MaterialStatePropertyCard<Color>(
          header: 'Background Color',
          items: [
            MaterialStateItem(
              key: const Key('textButtonEditor_backgroundColor_default'),
              title: 'Default',
              value: themeData.textButtonTheme.style?.backgroundColor
                      ?.resolve({}) ??
                  themeData.colorScheme.primary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonBackgroundColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ForegroundColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.textButtonTheme.style?.foregroundColor !=
                current.themeData.textButtonTheme.style?.foregroundColor ||
            previous.themeData.colorScheme != current.themeData.colorScheme;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final colorScheme = themeData.colorScheme;
        final foregroundColor =
            themeData.textButtonTheme.style?.foregroundColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Foreground Color',
          items: [
            MaterialStateItem(
              key: const Key('textButtonEditor_foregroundColor_default'),
              title: 'Default',
              value: foregroundColor?.resolve({}) ?? colorScheme.primary,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonForegroundDefaultColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('textButtonEditor_foregroundColor_disabled'),
              title: 'Disabled',
              value: foregroundColor?.resolve({MaterialState.disabled}) ??
                  colorScheme.onSurface.withOpacity(0.38),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonForegroundDisabledColorChanged(color),
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
        return previous.themeData.textButtonTheme.style?.overlayColor !=
                current.themeData.textButtonTheme.style?.overlayColor ||
            previous.themeData.colorScheme.primary !=
                current.themeData.colorScheme.primary;
      },
      builder: (context, state) {
        final themeData = state.themeData;
        final primary = themeData.colorScheme.primary;
        final overlayColor = themeData.textButtonTheme.style?.overlayColor;

        return MaterialStatePropertyCard<Color>(
          header: 'Overlay Color',
          items: [
            MaterialStateItem(
              key: const Key('textButtonEditor_overlayColor_hovered'),
              title: 'Hovered',
              value: overlayColor?.resolve({MaterialState.hovered}) ??
                  primary.withOpacity(0.04),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonOverlayHoveredColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('textButtonEditor_overlayColor_focused'),
              title: 'Focused',
              value: overlayColor?.resolve({MaterialState.focused}) ??
                  primary.withOpacity(0.12),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonOverlayFocusedColorChanged(color),
            ),
            MaterialStateItem(
              key: const Key('textButtonEditor_overlayColor_pressed'),
              title: 'Pressed',
              value: overlayColor?.resolve({MaterialState.pressed}) ??
                  primary.withOpacity(0.12),
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonOverlayPressedColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ShadowColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.textButtonTheme.style?.shadowColor !=
            current.themeData.textButtonTheme.style?.shadowColor;
      },
      builder: (context, state) {
        final themeData = state.themeData;

        return MaterialStatePropertyCard<Color>(
          header: 'Shadow Color',
          items: [
            MaterialStateItem(
              key: const Key('textButtonEditor_shadowColor_default'),
              title: 'Default',
              value:
                  themeData.textButtonTheme.style?.shadowColor?.resolve({}) ??
                      themeData.shadowColor,
              onValueChanged: (color) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonShadowColorChanged(color),
            ),
          ],
        );
      },
    );
  }
}

class _ElevationTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.textButtonTheme.style?.elevation !=
            current.themeData.textButtonTheme.style?.elevation;
      },
      builder: (context, state) {
        return MaterialStatePropertyCard<String>(
          header: 'Elevation',
          items: [
            MaterialStateItem(
              key: const Key(
                'textButtonEditor_elevationTextField_default',
              ),
              title: 'Default',
              value: (state.themeData.textButtonTheme.style?.elevation
                          ?.resolve({}) ??
                      kTextButtonElevation)
                  .toString(),
              onValueChanged: (value) => context
                  .read<AdvancedThemeCubit>()
                  .textButtonElevationChanged(value),
            ),
          ],
        );
      },
    );
  }
}
