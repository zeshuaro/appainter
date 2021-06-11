import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class FloatingActionBtnEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Floating Action Button',
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
            current.themeData.floatingActionButtonTheme.backgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
            current.themeData.floatingActionButtonTheme.foregroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
            current.themeData.floatingActionButtonTheme.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
            current.themeData.floatingActionButtonTheme.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
            current.themeData.floatingActionButtonTheme.splashColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
