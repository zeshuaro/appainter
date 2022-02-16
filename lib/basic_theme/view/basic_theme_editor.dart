import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicThemeEditor extends StatelessWidget {
  const BasicThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: SideBySideList(
        children: [
          _PrimaryColorPicker(),
          _OnPrimaryColorPicker(),
          _PrimaryContainerColorPicker(),
          _OnPrimaryContainerColorPicker(),
          _SecondaryColorPicker(),
          _OnSecondaryColorPicker(),
          _SecondaryContainerColorPicker(),
          _OnSecondaryContainerColorPicker(),
          _TertiaryColorPicker(),
          _OnTertiaryColorPicker(),
          _TertiaryContainerColorPicker(),
          _OnTertiaryContainerColorPicker(),
          _ErrorColorPicker(),
          _OnErrorColorPicker(),
          _ErrorContainerColorPicker(),
          _OnErrorContainerColorPicker(),
          _BackgroundColorPicker(),
          _OnBackgroundColorPicker(),
          _SurfaceColorPicker(),
          _OnSurfaceColorPicker(),
          _SurfaceVariantColorPicker(),
          _OnSurfaceVariantColorPicker(),
          _OutlineColorPicker(),
          _ShadowColorPicker(),
          _InverseSurfaceColorPicker(),
          _OnInverseSurfaceColorPicker(),
          _InversePrimaryColorPicker(),
        ],
      ),
    );
  }
}

class _PrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.primary != current.colorScheme.primary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_primaryColorPicker'),
          enableOpacity: false,
          title: 'Primary color',
          color: state.colorScheme.primary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().primaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnPrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onPrimary != current.colorScheme.onPrimary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onPrimaryColorPicker'),
          title: 'On primary color',
          color: state.colorScheme.onPrimary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onPrimaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _PrimaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.primaryContainer !=
            current.colorScheme.primaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_primaryContainerColorPicker'),
          title: 'Primary container color',
          color: state.colorScheme.primaryContainer,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().primaryContainerColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnPrimaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onPrimaryContainer !=
            current.colorScheme.onPrimaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onPrimaryContainerColorPicker'),
          title: 'On primary container color',
          color: state.colorScheme.onPrimaryContainer,
          onColorChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onPrimaryContainerColorChanged(color);
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
        return previous.colorScheme.secondary != current.colorScheme.secondary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_secondaryColorPicker'),
          title: 'Secondary color',
          color: state.colorScheme.secondary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().secondaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnSecondaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onSecondary !=
            current.colorScheme.onSecondary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onSecondaryColorPicker'),
          title: 'On secondary color',
          color: state.colorScheme.onSecondary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onSecondaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _SecondaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.secondaryContainer !=
            current.colorScheme.secondaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_secondaryContainerColorPicker'),
          title: 'Secondary container color',
          color: state.colorScheme.secondaryContainer,
          onColorChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .secondaryContainerColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnSecondaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onSecondaryContainer !=
            current.colorScheme.onSecondaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onSecondaryContainerColorPicker'),
          title: 'On secondary container color',
          color: state.colorScheme.onSecondaryContainer,
          onColorChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onSecondaryContainerColorChanged(color);
          },
        );
      },
    );
  }
}

class _TertiaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.tertiary != current.colorScheme.tertiary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_tertiaryColorPicker'),
          title: 'Tertiary color',
          color: state.colorScheme.tertiary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().tertiaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnTertiaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onTertiary !=
            current.colorScheme.onTertiary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onTertiaryColorPicker'),
          title: 'On tertiary color',
          color: state.colorScheme.onTertiary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onTertiaryColorChanged(color);
          },
        );
      },
    );
  }
}

class _TertiaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.tertiaryContainer !=
            current.colorScheme.tertiaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_tertiaryContainerColorPicker'),
          title: 'Tertiary container color',
          color: state.colorScheme.tertiaryContainer,
          onColorChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .tertiaryContainerColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnTertiaryContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onTertiaryContainer !=
            current.colorScheme.onTertiaryContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onTertiaryContainerColorPicker'),
          title: 'On tertiary container color',
          color: state.colorScheme.onTertiaryContainer,
          onColorChanged: (color) {
            context
                .read<BasicThemeCubit>()
                .onTertiaryContainerColorChanged(color);
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
        return previous.colorScheme.error != current.colorScheme.error;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_errorColorPicker'),
          title: 'Error color',
          color: state.colorScheme.error,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().errorColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnErrorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onError != current.colorScheme.onError;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onErrorColorPicker'),
          title: 'On error color',
          color: state.colorScheme.onError,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onErrorColorChanged(color);
          },
        );
      },
    );
  }
}

class _ErrorContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.errorContainer !=
            current.colorScheme.errorContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_errorContainerColorPicker'),
          title: 'Error container color',
          color: state.colorScheme.errorContainer,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().errorContainerColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnErrorContainerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onErrorContainer !=
            current.colorScheme.onErrorContainer;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onErrorContainerColorPicker'),
          title: 'On error container color',
          color: state.colorScheme.onErrorContainer,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onErrorContainerColorChanged(color);
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
            current.colorScheme.background;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_backgroundColorPicker'),
          title: 'Background color',
          color: state.colorScheme.background,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().backgroundColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onBackground !=
            current.colorScheme.onBackground;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onBackgroundColorPicker'),
          title: 'On background color',
          color: state.colorScheme.onBackground,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onBackgroundColorChanged(color);
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
        return previous.colorScheme.surface != current.colorScheme.surface;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_surfaceColorPicker'),
          title: 'Surface color',
          color: state.colorScheme.surface,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().surfaceColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnSurfaceColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onSurface != current.colorScheme.onSurface;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onSurfaceColorPicker'),
          title: 'On surface color',
          color: state.colorScheme.onSurface,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onSurfaceColorChanged(color);
          },
        );
      },
    );
  }
}

class _SurfaceVariantColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.surfaceVariant !=
            current.colorScheme.surfaceVariant;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_surfaceVariantColorPicker'),
          title: 'Surface variant color',
          color: state.colorScheme.surfaceVariant,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().surfaceVariantColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnSurfaceVariantColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onSurfaceVariant !=
            current.colorScheme.onSurfaceVariant;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onSurfaceVariantColorPicker'),
          title: 'On surface variant color',
          color: state.colorScheme.onSurfaceVariant,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onSurfaceVariantColorChanged(color);
          },
        );
      },
    );
  }
}

class _OutlineColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.outline != current.colorScheme.outline;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_outlineColorPicker'),
          title: 'Outline color',
          color: state.colorScheme.outline,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().outlineColorChanged(color);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.shadow != current.colorScheme.shadow;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_shadowColorPicker'),
          title: 'Shadow color',
          color: state.colorScheme.shadow,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().shadowColorChanged(color);
          },
        );
      },
    );
  }
}

class _InverseSurfaceColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.inverseSurface !=
            current.colorScheme.inverseSurface;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_inverseSurfaceColorPicker'),
          title: 'Inverse surface color',
          color: state.colorScheme.inverseSurface,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().inverseSurfaceColorChanged(color);
          },
        );
      },
    );
  }
}

class _OnInverseSurfaceColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.onInverseSurface !=
            current.colorScheme.onInverseSurface;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_onInverseSurfaceColorPicker'),
          title: 'On inverse surface color',
          color: state.colorScheme.onInverseSurface,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().onInverseSurfaceColorChanged(color);
          },
        );
      },
    );
  }
}

class _InversePrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicThemeCubit, BasicThemeState>(
      buildWhen: (previous, current) {
        return previous.colorScheme.inversePrimary !=
            current.colorScheme.inversePrimary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('basicThemeEditor_inversePrimaryColorPicker'),
          title: 'Inverse primary color',
          color: state.colorScheme.inversePrimary,
          onColorChanged: (color) {
            context.read<BasicThemeCubit>().inversePrimaryColorChanged(color);
          },
        );
      },
    );
  }
}
