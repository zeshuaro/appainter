import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/consts.dart';
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
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) => previous.seedColor != current.seedColor,
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_seedColorPicker'),
          title: 'Seed color',
          tooltip: 'Generate a ColorScheme derived from the seed color.',
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
          tooltip: BasicThemeDocs.primary,
          value: colorScheme.primary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().primaryColorChanged(color);
          },
          colorEnableOpacity: false,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryColorPicker'),
          title: 'On primary',
          tooltip: BasicThemeDocs.onPrimary,
          value: colorScheme.onPrimary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onPrimaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_primaryContainerColorPicker'),
          title: 'Primary container',
          tooltip: BasicThemeDocs.primaryContainer,
          value: colorScheme.primaryContainer,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().primaryContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryContainerColorPicker'),
          title: 'On primary container',
          tooltip: BasicThemeDocs.onPrimaryContainer,
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
          tooltip: BasicThemeDocs.secondary,
          value: colorScheme.secondary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().secondaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSecondaryColorPicker'),
          title: 'On secondary',
          tooltip: BasicThemeDocs.onSecondary,
          value: colorScheme.onSecondary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onSecondaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_secondaryContainerColorPicker'),
          title: 'Secondary container',
          tooltip: BasicThemeDocs.secondaryContainer,
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
          tooltip: BasicThemeDocs.onSecondaryContainer,
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
          tooltip: BasicThemeDocs.tertiary,
          value: colorScheme.tertiary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().tertiaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onTertiaryColorPicker'),
          title: 'On tertiary',
          tooltip: BasicThemeDocs.onTertiary,
          value: colorScheme.onTertiary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onTertiaryColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_tertiaryContainerColorPicker'),
          title: 'Tertiary container',
          tooltip: BasicThemeDocs.tertiaryContainer,
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
          tooltip: BasicThemeDocs.onTertiaryContainer,
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
          tooltip: BasicThemeDocs.error,
          value: colorScheme.error,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().errorColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorColorPicker'),
          title: 'On error',
          tooltip: BasicThemeDocs.onError,
          value: colorScheme.onError,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onErrorColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_errorContainerColorPicker'),
          title: 'Error container',
          tooltip: BasicThemeDocs.errorContainer,
          value: colorScheme.errorContainer,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().errorContainerColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorContainerColorPicker'),
          title: 'On error container',
          tooltip: BasicThemeDocs.onErrorContainer,
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
          tooltip: BasicThemeDocs.background,
          value: colorScheme.background,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().backgroundColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onBackgroundColorPicker'),
          title: 'On background',
          tooltip: BasicThemeDocs.onBackground,
          value: colorScheme.onBackground,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onBackgroundColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_surfaceColorPicker'),
          title: 'Surface',
          tooltip: BasicThemeDocs.surface,
          value: colorScheme.surface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().surfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceColorPicker'),
          title: 'On surface',
          tooltip: BasicThemeDocs.onSurface,
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
          tooltip: BasicThemeDocs.surfaceVariant,
          value: colorScheme.surfaceVariant,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().surfaceVariantColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceVariantColorPicker'),
          title: 'On surface variant',
          tooltip: BasicThemeDocs.onSurfaceVariant,
          value: colorScheme.onSurfaceVariant,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onSurfaceVariantColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_outlineColorPicker'),
          title: 'Outline',
          tooltip: BasicThemeDocs.outline,
          value: colorScheme.outline,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().outlineColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_shadowColorPicker'),
          title: 'Shadow',
          tooltip: BasicThemeDocs.shadow,
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
          tooltip: BasicThemeDocs.inverseSurface,
          value: colorScheme.inverseSurface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().inverseSurfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onInverseSurfaceColorPicker'),
          title: 'On inverse surface',
          tooltip: BasicThemeDocs.onInverseSurface,
          value: colorScheme.onInverseSurface,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().onInverseSurfaceColorChanged(color);
          },
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_inversePrimaryColorPicker'),
          title: 'Inverse primary',
          tooltip: BasicThemeDocs.inversePrimary,
          value: colorScheme.inversePrimary,
          onValueChanged: (color) {
            context.read<BasicThemeCubit>().inversePrimaryColorChanged(color);
          },
        ),
      ],
    );
  }
}
