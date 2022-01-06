import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class FloatingActionButtonThemeEditor extends ExpansionPanelItem {
  const FloatingActionButtonThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Floating Action Button';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _BackgroundColorPicker(),
        SideBySideList(
          children: [
            _ForegroundColorPicker(),
            _FocusColorPicker(),
            _HoverColorPicker(),
            _SplashColorPicker(),
          ],
        ),
        _ElevationTextField(),
        SideBySideList(
          children: [
            _DisabledElevationTextField(),
            _FocusElevationTextField(),
            _HighlightElevationTextField(),
            _HoverElevationTextField(),
          ],
        ),
      ],
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = context
        .watch<FloatingActionButtonThemeCubit>()
        .state
        .theme
        .backgroundColor;
    final secondaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.secondary;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_backgroundColorPicker'),
      title: 'Background Color',
      color: backgroundColor ?? secondaryColor,
      onColorChanged: (color) {
        context
            .read<FloatingActionButtonThemeCubit>()
            .backgroundColorChanged(color);
      },
    );
  }
}

class _ForegroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foregroundColor = context
        .watch<FloatingActionButtonThemeCubit>()
        .state
        .theme
        .foregroundColor;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onSecondary;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_foregroundColorPicker'),
      title: 'Foreground Color',
      color: foregroundColor ?? onPrimaryColor,
      onColorChanged: (color) {
        context
            .read<FloatingActionButtonThemeCubit>()
            .foregroundColorChanged(color);
      },
    );
  }
}

class _FocusColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final focusColor =
        context.watch<FloatingActionButtonThemeCubit>().state.theme.focusColor;
    final themeFocusColor = context.watch<ColorThemeCubit>().state.focusColor;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_focusColorPicker'),
      title: 'Focus Color',
      color: focusColor ?? themeFocusColor,
      onColorChanged: (color) {
        context.read<FloatingActionButtonThemeCubit>().focusColorChanged(color);
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hoverColor =
        context.watch<FloatingActionButtonThemeCubit>().state.theme.hoverColor;
    final themeHoverColor = context.watch<ColorThemeCubit>().state.hoverColor;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_hoverColorPicker'),
      title: 'Hover Color',
      color: hoverColor ?? themeHoverColor,
      onColorChanged: (color) {
        context.read<FloatingActionButtonThemeCubit>().hoverColorChanged(color);
      },
    );
  }
}

class _SplashColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashColor =
        context.watch<FloatingActionButtonThemeCubit>().state.theme.splashColor;
    final themeSplashColor = context.watch<ColorThemeCubit>().state.splashColor;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_splashColorPicker'),
      title: 'Splash Color',
      color: splashColor ?? themeSplashColor,
      onColorChanged: (color) {
        context
            .read<FloatingActionButtonThemeCubit>()
            .splashColorChanged(color);
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('floatingActionButtonThemeEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue:
              (state.theme.elevation ?? kFloatingActionBtnElevation).toString(),
          onChanged: (value) {
            context
                .read<FloatingActionButtonThemeCubit>()
                .elevationChanged(value);
          },
        );
      },
    );
  }
}

class _DisabledElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.disabledElevation !=
            current.theme.disabledElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
            'floatingActionButtonThemeEditor_disabledElevationTextField',
          ),
          labelText: 'Disabled Elevation',
          initialValue:
              (state.theme.disabledElevation ?? kFloatingActionBtnElevation)
                  .toString(),
          onChanged: (value) {
            context
                .read<FloatingActionButtonThemeCubit>()
                .disabledElevationChanged(value);
          },
        );
      },
    );
  }
}

class _FocusElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.focusElevation != current.theme.focusElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
            'floatingActionButtonThemeEditor_focusElevationTextField',
          ),
          labelText: 'Focus Elevation',
          initialValue:
              (state.theme.focusElevation ?? kFloatingActionBtnFocusElevation)
                  .toString(),
          onChanged: (value) {
            context
                .read<FloatingActionButtonThemeCubit>()
                .focusElevationChanged(value);
          },
        );
      },
    );
  }
}

class _HighlightElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.highlightElevation !=
            current.theme.highlightElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
            'floatingActionButtonThemeEditor_highlightElevationTextField',
          ),
          labelText: 'Highlight Elevation',
          initialValue: (state.theme.highlightElevation ??
                  kFloatingActionBtnHighlightElevation)
              .toString(),
          onChanged: (value) {
            context
                .read<FloatingActionButtonThemeCubit>()
                .highlightElevationChanged(value);
          },
        );
      },
    );
  }
}

class _HoverElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.hoverElevation != current.theme.hoverElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
            'floatingActionButtonThemeEditor_hoverElevationTextField',
          ),
          labelText: 'Hover Elevation',
          initialValue:
              (state.theme.hoverElevation ?? kFloatingActionBtnHoverElevation)
                  .toString(),
          onChanged: (value) {
            context
                .read<FloatingActionButtonThemeCubit>()
                .hoverElevationChanged(value);
          },
        );
      },
    );
  }
}
