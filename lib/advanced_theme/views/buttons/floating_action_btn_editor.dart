import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class FloatingActionBtnEditor extends ExpansionPanelItem {
  const FloatingActionBtnEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Floating Action Button';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _BgColorPicker(),
        SideBySideList(
          children: [
            _FgColorPicker(),
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

class _BgColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.backgroundColor !=
                current.themeData.floatingActionButtonTheme.backgroundColor ||
            previous.themeData.colorScheme.secondary !=
                current.themeData.colorScheme.secondary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('floatingActionBtnEditor_bgColorPicker'),
          title: 'Background Color',
          color: state.themeData.floatingActionButtonTheme.backgroundColor ??
              state.themeData.colorScheme.secondary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnBgColorChanged(color);
          },
        );
      },
    );
  }
}

class _FgColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.foregroundColor !=
                current.themeData.floatingActionButtonTheme.foregroundColor ||
            previous.themeData.colorScheme.onSecondary !=
                current.themeData.colorScheme.onSecondary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('floatingActionBtnEditor_fgColorPicker'),
          title: 'Foreground Color',
          color: state.themeData.floatingActionButtonTheme.foregroundColor ??
              state.themeData.colorScheme.onSecondary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnFgColorChanged(color);
          },
        );
      },
    );
  }
}

class _FocusColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.focusColor !=
                current.themeData.floatingActionButtonTheme.focusColor ||
            previous.themeData.focusColor != current.themeData.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('floatingActionBtnEditor_focusColorPicker'),
          title: 'Focus Color',
          color: state.themeData.floatingActionButtonTheme.focusColor ??
              state.themeData.focusColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnFocusColorChanged(color);
          },
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.hoverColor !=
                current.themeData.floatingActionButtonTheme.hoverColor ||
            previous.themeData.hoverColor != current.themeData.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('floatingActionBtnEditor_hoverColorPicker'),
          title: 'Hover Color',
          color: state.themeData.floatingActionButtonTheme.hoverColor ??
              state.themeData.hoverColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnHoverColorChanged(color);
          },
        );
      },
    );
  }
}

class _SplashColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.floatingActionButtonTheme.splashColor !=
                current.themeData.floatingActionButtonTheme.splashColor ||
            previous.themeData.splashColor != current.themeData.splashColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('floatingActionBtnEditor_splashColorPicker'),
          title: 'Splash Color',
          color: state.themeData.floatingActionButtonTheme.splashColor ??
              state.themeData.splashColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnSplashColorChanged(color);
          },
        );
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
          key: const Key('floatingActionBtnEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue:
              state.themeData.floatingActionButtonTheme.elevation?.toString() ??
                  kFloatingActionBtnElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnElevationChanged(value);
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
          key: const Key('floatingActionBtnEditor_disabledElevationTextField'),
          labelText: 'Disabled Elevation',
          initialValue: state
                  .themeData.floatingActionButtonTheme.disabledElevation
                  ?.toString() ??
              kFloatingActionBtnElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnDisabledElevationChanged(value);
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
          key: const Key('floatingActionBtnEditor_focusElevationTextField'),
          labelText: 'Focus Elevation',
          initialValue: state.themeData.floatingActionButtonTheme.focusElevation
                  ?.toString() ??
              kFloatingActionBtnFocusElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnFocusElevationChanged(value);
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
          key: const Key('floatingActionBtnEditor_highlightElevationTextField'),
          labelText: 'Highlight Elevation',
          initialValue: state
                  .themeData.floatingActionButtonTheme.highlightElevation
                  ?.toString() ??
              kFloatingActionBtnHighlightElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnHighlightElevationChanged(value);
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
          key: const Key('floatingActionBtnEditor_hoverElevationTextField'),
          labelText: 'Hover Elevation',
          initialValue: state.themeData.floatingActionButtonTheme.hoverElevation
                  ?.toString() ??
              kFloatingActionBtnHoverElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .floatingActionBtnHoverElevationChanged(value);
          },
        );
      },
    );
  }
}
