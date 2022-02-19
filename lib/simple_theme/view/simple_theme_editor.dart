import 'package:appainter/simple_theme/simple_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleThemeEditor extends StatelessWidget {
  const SimpleThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: MyListView(
        shrinkwrap: true,
        physics: const ScrollPhysics(),
        children: [
          _SeedColorPicker(),
          const Divider(),
          _PrimaryColorPicker(),
          _SecondaryColorPicker(),
          _TertiaryColorPicker(),
          _NeutralColorPicker(),
        ],
      ),
    );
  }
}

class _SeedColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) => previous.seedColor != current.seedColor,
      builder: (context, state) {
        return ColorListTile(
          key: const Key('singleThemeEditor_seedColorPicker'),
          title: 'Seed color',
          color: state.seedColor,
          onColorChanged: (color) {
            context.read<SimpleThemeCubit>().seedColorChanged(color);
          },
        );
      },
    );
  }
}

class _PrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.primary != current.colorScheme.primary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('singleThemeEditor_primaryColorPicker'),
          title: 'Primary color',
          color: state.colorScheme.primary,
          onColorChanged: (color) {
            context.read<SimpleThemeCubit>().primaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _SecondaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.secondary != current.colorScheme.secondary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('singleThemeEditor_secondaryColorPicker'),
          title: 'Secondary color',
          color: state.colorScheme.secondary,
          onColorChanged: (color) {
            context.read<SimpleThemeCubit>().secondaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _TertiaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.tertiary != current.colorScheme.tertiary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('singleThemeEditor_tertiaryColorPicker'),
          title: 'Tertiary color',
          color: state.colorScheme.tertiary,
          onColorChanged: (color) {
            context.read<SimpleThemeCubit>().tertiaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _NeutralColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleThemeCubit, SimpleThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.background !=
            current.colorScheme.background;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('singleThemeEditor_neutralColorPicker'),
          title: 'Neutral color',
          color: state.colorScheme.background,
          onColorChanged: (color) {
            context.read<SimpleThemeCubit>().neutralColorChanged(color);
          },
        );
      },
    );
  }
}
