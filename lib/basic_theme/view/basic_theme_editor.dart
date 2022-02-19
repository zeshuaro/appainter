import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/simple_theme/simple_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicThemeEditor extends StatelessWidget {
  const BasicThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: EdgeInsets.zero,
      child: MyListView(
        padding: kPaddingAll,
        shrinkwrap: true,
        physics: const ScrollPhysics(),
        children: [
          _SeedColorPicker(),
          const Divider(),
          _PrimaryColorPickers(),
          _SecondaryColorPickers(),
          _TertiaryColorPickers(),
          _ErrorColorPickers(),
          _NeutralColorPickers(),
          _NeutralVariantColorPickers(),
          _InverseColorPickers(),
        ],
      ),
    );
  }
}

class _SeedColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) => previous.seedColor != current.seedColor,
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_seedColorPicker'),
          title: 'Seed color',
          color: state.seedColor,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().seedColorChanged(color);
          },
        );
      },
    );
  }
}

class _PrimaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Primary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_primaryColorPicker'),
          title: 'Primary',
          value: colorScheme.primary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().primaryColorChanged(color);
          },
          colorEnableOpacity: false,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryColorPicker'),
          title: 'On primary',
          value: colorScheme.onPrimary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onPrimaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_primaryContainerColorPicker'),
          title: 'Primary container',
          value: colorScheme.primaryContainer,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().primaryContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryContainerColorPicker'),
          title: 'On primary container',
          value: colorScheme.onPrimaryContainer,
          onValueChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onPrimaryContainerColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _SecondaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Secondary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_secondaryColorPicker'),
          title: 'Secondary',
          value: colorScheme.secondary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().secondaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSecondaryColorPicker'),
          title: 'On secondary',
          value: colorScheme.onSecondary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onSecondaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_secondaryContainerColorPicker'),
          title: 'Secondary container',
          value: colorScheme.secondaryContainer,
          onValueChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .secondaryContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSecondaryContainerColorPicker'),
          title: 'On secondary container',
          value: colorScheme.onSecondaryContainer,
          onValueChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onSecondaryContainerColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _TertiaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Tertiary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_tertiaryColorPicker'),
          title: 'Tertiary',
          value: colorScheme.tertiary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().tertiaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onTertiaryColorPicker'),
          title: 'On tertiary',
          value: colorScheme.onTertiary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onTertiaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_tertiaryContainerColorPicker'),
          title: 'Tertiary container',
          value: colorScheme.tertiaryContainer,
          onValueChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .tertiaryContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onTertiaryContainerColorPicker'),
          title: 'On tertiary container',
          value: colorScheme.onTertiaryContainer,
          onValueChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onTertiaryContainerColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _ErrorColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Error colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_errorColorPicker'),
          title: 'Error',
          value: colorScheme.error,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().errorColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorColorPicker'),
          title: 'On error',
          value: colorScheme.onError,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onErrorColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_errorContainerColorPicker'),
          title: 'Error container',
          value: colorScheme.errorContainer,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().errorContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorContainerColorPicker'),
          title: 'On error container',
          value: colorScheme.onErrorContainer,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onErrorContainerColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _NeutralColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Neutral colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_backgroundColorPicker'),
          title: 'Background',
          value: colorScheme.background,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().backgroundColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onBackgroundColorPicker'),
          title: 'On background',
          value: colorScheme.onBackground,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onBackgroundColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_surfaceColorPicker'),
          title: 'Surface',
          value: colorScheme.surface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().surfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceColorPicker'),
          title: 'On surface',
          value: colorScheme.onSurface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onSurfaceColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _NeutralVariantColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Neutral variant colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_surfaceVariantColorPicker'),
          title: 'Surface variant',
          value: colorScheme.surfaceVariant,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().surfaceVariantColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceVariantColorPicker'),
          title: 'On surface variant',
          value: colorScheme.onSurfaceVariant,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onSurfaceVariantColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_outlineColorPicker'),
          title: 'Outline',
          value: colorScheme.outline,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().outlineColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_shadowColorPicker'),
          title: 'Shadow',
          value: colorScheme.shadow,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().shadowColorChanged(color);
          },
        ),
      ],
    );
  }
}

class _InverseColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Inverse colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_inverseSurfaceColorPicker'),
          title: 'Inverse surface',
          value: colorScheme.inverseSurface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().inverseSurfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onInverseSurfaceColorPicker'),
          title: 'On inverse surface',
          value: colorScheme.onInverseSurface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onInverseSurfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_inversePrimaryColorPicker'),
          title: 'Inverse primary',
          value: colorScheme.inversePrimary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().inversePrimaryColorChanged(color);
          },
        ),
      ],
    );
  }
}
