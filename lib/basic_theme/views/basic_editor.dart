import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class BasicEditor extends StatelessWidget {
  const BasicEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _PrimaryColorPicker(),
        const VerticalPadding(),
        ExpandableCard(
          header: 'More Colors',
          children: [
            _PrimaryColorDarkPicker(),
            _SecondaryColorPicker(),
            _SecondaryColorDarkPicker(),
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
            key: const Key('basicEditor_primaryColorPicker'),
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
          key: const Key('basicEditor_primaryColorDarkPicker'),
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

class _SecondaryColorPicker extends StatelessWidget {
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
          key: const Key('basicEditor_secondaryColorPicker'),
          title: 'Secondary Color',
          color: state.colorScheme.secondary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().secondaryColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onSecondary),
          onBrightnessChanged: (isDark) {
            context
                .read<BasicThemeCubit>()
                .secondaryColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}

class _SecondaryColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.secondaryVariant !=
            current.colorScheme.secondaryVariant;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicEditor_secondaryColorDarkPicker'),
          title: 'Secondary Color Dark',
          color: state.colorScheme.secondaryVariant,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().secondaryColorDarkChanged(color);
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
          key: const Key('basicEditor_surfaceColorPicker'),
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
          key: const Key('basicEditor_backgroundColorPicker'),
          title: 'Background Color',
          color: state.colorScheme.background,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().backgroundColorChanged(color);
          },
          isColorDark: UtilService.isColorDark(state.colorScheme.onBackground),
          onBrightnessChanged: (isDark) {
            context
                .read<BasicThemeCubit>()
                .backgroundColorBrightnessChanged(isDark);
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
          key: const Key('basicEditor_errorColorPicker'),
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
