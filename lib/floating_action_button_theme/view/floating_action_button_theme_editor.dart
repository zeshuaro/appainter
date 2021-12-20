import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

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
    final secondary = context
        .watch<AdvancedThemeCubit>()
        .state
        .themeData
        .colorScheme
        .secondary;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_backgroundColorPicker'),
      title: 'Background Color',
      color: backgroundColor ?? secondary,
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
    final onSecondary = context
        .watch<AdvancedThemeCubit>()
        .state
        .themeData
        .colorScheme
        .onSecondary;

    return ColorListTile(
      key: const Key('floatingActionButtonThemeEditor_foregroundColorPicker'),
      title: 'Foreground Color',
      color: foregroundColor ?? onSecondary,
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
    final themeFocusColor =
        context.watch<AdvancedThemeCubit>().state.themeData.focusColor;

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
    final themeHoverColor =
        context.watch<AdvancedThemeCubit>().state.themeData.hoverColor;

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
    final themeSplashColor =
        context.watch<AdvancedThemeCubit>().state.themeData.splashColor;

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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.elevation !=
            current.themeData.floatingActionButtonTheme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('floatingActionButtonThemeEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue:
              state.themeData.floatingActionButtonTheme.elevation?.toString() ??
                  kFloatingActionBtnElevation.toString(),
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.disabledElevation !=
            current.themeData.floatingActionButtonTheme.disabledElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
              'floatingActionButtonThemeEditor_disabledElevationTextField'),
          labelText: 'Disabled Elevation',
          initialValue: state
                  .themeData.floatingActionButtonTheme.disabledElevation
                  ?.toString() ??
              kFloatingActionBtnElevation.toString(),
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.focusElevation !=
            current.themeData.floatingActionButtonTheme.focusElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
              'floatingActionButtonThemeEditor_focusElevationTextField'),
          labelText: 'Focus Elevation',
          initialValue: state.themeData.floatingActionButtonTheme.focusElevation
                  ?.toString() ??
              kFloatingActionBtnFocusElevation.toString(),
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous
                .themeData.floatingActionButtonTheme.highlightElevation !=
            current.themeData.floatingActionButtonTheme.highlightElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
              'floatingActionButtonThemeEditor_highlightElevationTextField'),
          labelText: 'Highlight Elevation',
          initialValue: state
                  .themeData.floatingActionButtonTheme.highlightElevation
                  ?.toString() ??
              kFloatingActionBtnHighlightElevation.toString(),
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.hoverElevation !=
            current.themeData.floatingActionButtonTheme.hoverElevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key(
              'floatingActionButtonThemeEditor_hoverElevationTextField'),
          labelText: 'Hover Elevation',
          initialValue: state.themeData.floatingActionButtonTheme.hoverElevation
                  ?.toString() ??
              kFloatingActionBtnHoverElevation.toString(),
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
