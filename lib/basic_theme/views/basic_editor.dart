import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class BasicEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _PrimaryColorPicker(),
        VerticalPadding(),
        ExpandableCard(
          header: 'More Colors',
          children: [
            _PrimaryColorDarkPicker(),
            _AccentColorPicker(),
            _AccentColorDarkPicker(),
            _SurfaceColorPicker(),
            _BackgroundColorPicker(),
            _ErrorColorPicker(),
          ],
        ),
      ],
    );
  }
}

class _PrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: BlocBuilder<BasicThemeCubit, BasicThemeState>(
        buildWhen: (previous, current) {
          return previous.colorScheme.primary != current.colorScheme.primary ||
              previous.colorScheme.onPrimary != current.colorScheme.onPrimary;
        },
        builder: (context, state) {
          return ColorAndBrightness(
            title: 'Primary Color',
            color: state.colorScheme.primary,
            onColorChanged: (color) {
              context.read<BasicThemeCubit>().primaryColorChanged(color);
            },
            isColorDark: UtilService.isColorDark(state.colorScheme.onPrimary),
            onBrightnessChanged: (isDark) {
              context
                  .read<BasicThemeCubit>()
                  .primaryColorBrightnessChanged(isDark);
            },
          );
        },
      ),
    );
  }
}

class _PrimaryColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.primaryVariant !=
            current.colorScheme.primaryVariant;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Primary Color Dark',
          color: state.colorScheme.primaryVariant,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().primaryColorDarkChanged(color);
          },
        );
      },
    );
  }
}

class _AccentColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.secondary !=
                current.colorScheme.secondary ||
            previous.colorScheme.onSecondary != current.colorScheme.onSecondary;
      },
      builder: (context, state) {
        return ColorAndBrightness(
          title: 'Accent Color',
          color: state.colorScheme.secondary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().accentColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onSecondary),
          onBrightnessChanged: (isDark) {
            context
                .read<BasicThemeCubit>()
                .accentColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}

class _AccentColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.secondaryVariant !=
            current.colorScheme.secondaryVariant;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Accent Color Dark',
          color: state.colorScheme.secondaryVariant,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().accentColorDarkChanged(color);
          },
        );
      },
    );
  }
}

class _SurfaceColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.surface != current.colorScheme.surface ||
            previous.colorScheme.onSurface != current.colorScheme.onSurface;
      },
      builder: (context, state) {
        return ColorAndBrightness(
          title: 'Surface Color',
          color: state.colorScheme.surface,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().surfaceColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onSurface),
          onBrightnessChanged: (isDark) {
            context
                .read<BasicThemeCubit>()
                .surfaceColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.background !=
                current.colorScheme.background ||
            previous.colorScheme.onBackground !=
                current.colorScheme.onBackground;
      },
      builder: (context, state) {
        return ColorAndBrightness(
          title: 'Background Color',
          color: state.colorScheme.background,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().bgColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onBackground),
          onBrightnessChanged: (isDark) {
            context.read<BasicThemeCubit>().bgColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}

class _ErrorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.error != current.colorScheme.error ||
            previous.colorScheme.onError != current.colorScheme.onError;
      },
      builder: (context, state) {
        return ColorAndBrightness(
          title: 'Error Color',
          color: state.colorScheme.error,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().errorColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onError),
          onBrightnessChanged: (isDark) {
            context.read<BasicThemeCubit>().errorColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}
