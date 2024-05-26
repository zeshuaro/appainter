import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicThemeEditor extends StatelessWidget {
  const BasicThemeEditor({super.key});

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
      key: const Key('basicThemeEditor_seedColorPicker'),
      buildWhen: (previous, current) => previous.seedColor != current.seedColor,
      builder: (context, state) {
        return ColorListTile(
          title: 'Seed color',
          tooltip: 'Generate a ColorScheme derived from the seed color.',
          color: state.seedColor,
          onColorChanged: context.read<BasicThemeCubit>().seedColorChanged,
        );
      },
    );
  }
}

class _PrimaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Primary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_primaryColorPicker'),
          title: 'Primary',
          tooltip: BasicThemeDocs.primary,
          value: colorScheme.primary,
          onValueChanged: cubit.primaryColorChanged,
          colorEnableOpacity: false,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryColorPicker'),
          title: 'On primary',
          tooltip: BasicThemeDocs.onPrimary,
          value: colorScheme.onPrimary,
          onValueChanged: cubit.onPrimaryColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_primaryContainerColorPicker'),
          title: 'Primary container',
          tooltip: BasicThemeDocs.primaryContainer,
          value: colorScheme.primaryContainer,
          onValueChanged: cubit.primaryContainerColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onPrimaryContainerColorPicker'),
          title: 'On primary container',
          tooltip: BasicThemeDocs.onPrimaryContainer,
          value: colorScheme.onPrimaryContainer,
          onValueChanged: cubit.onPrimaryContainerColorChanged,
        ),
      ],
    );
  }
}

class _SecondaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Secondary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_secondaryColorPicker'),
          title: 'Secondary',
          tooltip: BasicThemeDocs.secondary,
          value: colorScheme.secondary,
          onValueChanged: cubit.secondaryColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSecondaryColorPicker'),
          title: 'On secondary',
          tooltip: BasicThemeDocs.onSecondary,
          value: colorScheme.onSecondary,
          onValueChanged: cubit.onSecondaryColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_secondaryContainerColorPicker'),
          title: 'Secondary container',
          tooltip: BasicThemeDocs.secondaryContainer,
          value: colorScheme.secondaryContainer,
          onValueChanged: cubit.secondaryContainerColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSecondaryContainerColorPicker'),
          title: 'On secondary container',
          tooltip: BasicThemeDocs.onSecondaryContainer,
          value: colorScheme.onSecondaryContainer,
          onValueChanged: cubit.onSecondaryContainerColorChanged,
        ),
      ],
    );
  }
}

class _TertiaryColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Tertiary colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_tertiaryColorPicker'),
          title: 'Tertiary',
          tooltip: BasicThemeDocs.tertiary,
          value: colorScheme.tertiary,
          onValueChanged: cubit.tertiaryColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onTertiaryColorPicker'),
          title: 'On tertiary',
          tooltip: BasicThemeDocs.onTertiary,
          value: colorScheme.onTertiary,
          onValueChanged: cubit.onTertiaryColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_tertiaryContainerColorPicker'),
          title: 'Tertiary container',
          tooltip: BasicThemeDocs.tertiaryContainer,
          value: colorScheme.tertiaryContainer,
          onValueChanged: cubit.tertiaryContainerColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onTertiaryContainerColorPicker'),
          title: 'On tertiary container',
          tooltip: BasicThemeDocs.onTertiaryContainer,
          value: colorScheme.onTertiaryContainer,
          onValueChanged: cubit.onTertiaryContainerColorChanged,
        ),
      ],
    );
  }
}

class _ErrorColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Error colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_errorColorPicker'),
          title: 'Error',
          tooltip: BasicThemeDocs.error,
          value: colorScheme.error,
          onValueChanged: cubit.errorColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorColorPicker'),
          title: 'On error',
          tooltip: BasicThemeDocs.onError,
          value: colorScheme.onError,
          onValueChanged: cubit.onErrorColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_errorContainerColorPicker'),
          title: 'Error container',
          tooltip: BasicThemeDocs.errorContainer,
          value: colorScheme.errorContainer,
          onValueChanged: cubit.errorContainerColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onErrorContainerColorPicker'),
          title: 'On error container',
          tooltip: BasicThemeDocs.onErrorContainer,
          value: colorScheme.onErrorContainer,
          onValueChanged: cubit.onErrorContainerColorChanged,
        ),
      ],
    );
  }
}

class _NeutralColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Neutral colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_surfaceColorPicker'),
          title: 'Surface',
          tooltip: BasicThemeDocs.surface,
          value: colorScheme.surface,
          onValueChanged: cubit.surfaceColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceColorPicker'),
          title: 'On surface',
          tooltip: BasicThemeDocs.onSurface,
          value: colorScheme.onSurface,
          onValueChanged: cubit.onSurfaceColorChanged,
        ),
      ],
    );
  }
}

class _NeutralVariantColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Neutral variant colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_surfaceContainerHighestColorPicker'),
          title: 'Surface container highest',
          tooltip: BasicThemeDocs.surfaceContainerHighest,
          value: colorScheme.surfaceContainerHighest,
          onValueChanged: cubit.surfaceContainerHighestColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onSurfaceVariantColorPicker'),
          title: 'On surface variant',
          tooltip: BasicThemeDocs.onSurfaceVariant,
          value: colorScheme.onSurfaceVariant,
          onValueChanged: cubit.onSurfaceVariantColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_outlineColorPicker'),
          title: 'Outline',
          tooltip: BasicThemeDocs.outline,
          value: colorScheme.outline,
          onValueChanged: cubit.outlineColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_shadowColorPicker'),
          title: 'Shadow',
          tooltip: BasicThemeDocs.shadow,
          value: colorScheme.shadow,
          onValueChanged: cubit.shadowColorChanged,
        ),
      ],
    );
  }
}

class _InverseColorPickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BasicThemeCubit>();
    final colorScheme = context.watch<BasicThemeCubit>().state.colorScheme;

    return MaterialStatesCard<Color>(
      header: 'Inverse colors',
      items: [
        MaterialStateItem(
          key: const Key('basicThemeEditor_inverseSurfaceColorPicker'),
          title: 'Inverse surface',
          tooltip: BasicThemeDocs.inverseSurface,
          value: colorScheme.inverseSurface,
          onValueChanged: cubit.inverseSurfaceColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_onInverseSurfaceColorPicker'),
          title: 'On inverse surface',
          tooltip: BasicThemeDocs.onInverseSurface,
          value: colorScheme.onInverseSurface,
          onValueChanged: cubit.onInverseSurfaceColorChanged,
        ),
        MaterialStateItem(
          key: const Key('basicThemeEditor_inversePrimaryColorPicker'),
          title: 'Inverse primary',
          tooltip: BasicThemeDocs.inversePrimary,
          value: colorScheme.inversePrimary,
          onValueChanged: cubit.inversePrimaryColorChanged,
        ),
      ],
    );
  }
}
