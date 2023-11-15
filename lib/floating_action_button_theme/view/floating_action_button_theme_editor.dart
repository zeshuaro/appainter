import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonThemeEditor extends ExpansionPanelItem {
  const FloatingActionButtonThemeEditor({super.key});

  @override
  String get header => 'Floating action button';

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
      title: 'Background color',
      tooltip: FloatingActionButtonThemeDocs.backgroundColor,
      color: backgroundColor ?? secondaryColor,
      onColorChanged:
          context.read<FloatingActionButtonThemeCubit>().backgroundColorChanged,
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
      title: 'Foreground color',
      tooltip: FloatingActionButtonThemeDocs.foregroundColor,
      color: foregroundColor ?? onPrimaryColor,
      onColorChanged:
          context.read<FloatingActionButtonThemeCubit>().foregroundColorChanged,
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
      title: 'Focus color',
      tooltip: FloatingActionButtonThemeDocs.focusColor,
      color: focusColor ?? themeFocusColor,
      onColorChanged:
          context.read<FloatingActionButtonThemeCubit>().focusColorChanged,
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
      title: 'Hover color',
      tooltip: FloatingActionButtonThemeDocs.hoverColor,
      color: hoverColor ?? themeHoverColor,
      onColorChanged:
          context.read<FloatingActionButtonThemeCubit>().hoverColorChanged,
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
      title: 'Splash color',
      tooltip: FloatingActionButtonThemeDocs.splashColor,
      color: splashColor ?? themeSplashColor,
      onColorChanged:
          context.read<FloatingActionButtonThemeCubit>().splashColorChanged,
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloatingActionButtonThemeCubit,
        FloatingActionButtonThemeState>(
      key: const Key('floatingActionButtonThemeEditor_elevationTextField'),
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Elevation',
          tooltip: FloatingActionButtonThemeDocs.elevation,
          initialValue:
              (state.theme.elevation ?? kFloatingActionBtnElevation).toString(),
          onChanged:
              context.read<FloatingActionButtonThemeCubit>().elevationChanged,
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
      key: const Key(
        'floatingActionButtonThemeEditor_disabledElevationTextField',
      ),
      buildWhen: (previous, current) {
        return previous.theme.disabledElevation !=
            current.theme.disabledElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Disabled elevation',
          tooltip: FloatingActionButtonThemeDocs.disabledElevation,
          initialValue:
              (state.theme.disabledElevation ?? kFloatingActionBtnElevation)
                  .toString(),
          onChanged: context
              .read<FloatingActionButtonThemeCubit>()
              .disabledElevationChanged,
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
      key: const Key(
        'floatingActionButtonThemeEditor_focusElevationTextField',
      ),
      buildWhen: (previous, current) {
        return previous.theme.focusElevation != current.theme.focusElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Focus elevation',
          tooltip: FloatingActionButtonThemeDocs.focusElevation,
          initialValue:
              (state.theme.focusElevation ?? kFloatingActionBtnFocusElevation)
                  .toString(),
          onChanged: context
              .read<FloatingActionButtonThemeCubit>()
              .focusElevationChanged,
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
      key: const Key(
        'floatingActionButtonThemeEditor_highlightElevationTextField',
      ),
      buildWhen: (previous, current) {
        return previous.theme.highlightElevation !=
            current.theme.highlightElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Highlight elevation',
          tooltip: FloatingActionButtonThemeDocs.highlightElevation,
          initialValue: (state.theme.highlightElevation ??
                  kFloatingActionBtnHighlightElevation)
              .toString(),
          onChanged: context
              .read<FloatingActionButtonThemeCubit>()
              .highlightElevationChanged,
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
      key: const Key(
        'floatingActionButtonThemeEditor_hoverElevationTextField',
      ),
      buildWhen: (previous, current) {
        return previous.theme.hoverElevation != current.theme.hoverElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Hover elevation',
          tooltip: FloatingActionButtonThemeDocs.hoverElevation,
          initialValue:
              (state.theme.hoverElevation ?? kFloatingActionBtnHoverElevation)
                  .toString(),
          onChanged: context
              .read<FloatingActionButtonThemeCubit>()
              .hoverElevationChanged,
        );
      },
    );
  }
}
