import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class ColorThemeEditor extends ExpansionPanelItem {
  const ColorThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Colors';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _PrimaryColorPicker(),
        SideBySideList(
          children: [
            _PrimaryColorLightPicker(),
            _PrimaryColorDarkPicker(),
            _BackgroundColorPicker(),
            _BottomAppBarColorPicker(),
            _CanvasColorPicker(),
            _CardColorPicker(),
            _DialogBackgroundColorPicker(),
            _DisabledColorPicker(),
            _DividerColorPicker(),
            _ErrorColorPicker(),
            _FocusColorPicker(),
            _HighlightColorPicker(),
            _HintColorPicker(),
            _HoverColorPicker(),
            _IndicatorColorPicker(),
            _ScaffoldBackgroundColorPicker(),
            _SecondaryHeaderColorPicker(),
            _SelectedRowColorPicker(),
            _ShadowColorPicker(),
            _SplashColorPicker(),
            _ToggleableActiveColorPicker(),
            _UnselectedWidgetColorPicker(),
          ],
        ),
      ],
    );
  }
}

class _PrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.primaryColor != current.primaryColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_primaryColorPicker'),
          enableOpacity: false,
          title: 'Primary color',
          color: state.primaryColor,
          onColorChanged: (color) {
            final isDark = context.read<AdvancedThemeCubit>().state.isDark;
            context.read<ColorThemeCubit>().primaryColorChanged(color, isDark);
          },
        );
      },
    );
  }
}

class _PrimaryColorLightPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.primaryColorLight != current.primaryColorLight;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_primaryColorLightPicker'),
          title: 'Primary color light',
          color: state.primaryColorLight,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().primaryColorLightChanged(color);
          },
        );
      },
    );
  }
}

class _PrimaryColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.primaryColorDark != current.primaryColorDark;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_primaryColorDarkPicker'),
          title: 'Primary color dark',
          color: state.primaryColorDark,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().primaryColorDarkChanged(color);
          },
        );
      },
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.backgroundColor != current.backgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_backgroundColorPicker'),
          title: 'Background color',
          color: state.backgroundColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().backgroundColorChanged(color);
          },
        );
      },
    );
  }
}

class _BottomAppBarColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.bottomAppBarColor != current.bottomAppBarColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_bottomAppBarColorPicker'),
          title: 'Bottom app bar color',
          color: state.bottomAppBarColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().bottomAppBarColorChanged(color);
          },
        );
      },
    );
  }
}

class _CanvasColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.canvasColor != current.canvasColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_canvasColorPicker'),
          title: 'Canvas color',
          color: state.canvasColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().canvasColorChanged(color);
          },
        );
      },
    );
  }
}

class _CardColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.cardColor != current.cardColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_cardColorPicker'),
          title: 'Card color',
          color: state.cardColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().cardColorChanged(color);
          },
        );
      },
    );
  }
}

class _DialogBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.dialogBackgroundColor != current.dialogBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_dialogBackgroundColorPicker'),
          title: 'Dialog background color',
          color: state.dialogBackgroundColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().dialogBackgroundColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.disabledColor != current.disabledColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_disabledColorPicker'),
          title: 'Disabled color',
          color: state.disabledColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().disabledColorChanged(color);
          },
        );
      },
    );
  }
}

class _DividerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.dividerColor != current.dividerColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_dividerColorPicker'),
          title: 'Divider color',
          color: state.dividerColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().dividerColorChanged(color);
          },
        );
      },
    );
  }
}

class _ErrorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.errorColor != current.errorColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_errorColorPicker'),
          title: 'Error color',
          color: state.errorColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().errorColorChanged(color);
          },
        );
      },
    );
  }
}

class _FocusColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.focusColor != current.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_focusColorPicker'),
          title: 'Focus color',
          color: state.focusColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().focusColorChanged(color);
          },
        );
      },
    );
  }
}

class _HighlightColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.highlightColor != current.highlightColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_highlightColorPicker'),
          title: 'Highlight color',
          color: state.highlightColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().highlightColorChanged(color);
          },
        );
      },
    );
  }
}

class _HintColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.hintColor != current.hintColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_hintColorPicker'),
          title: 'Hint color',
          color: state.hintColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().hintColorChanged(color);
          },
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.hoverColor != current.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_hoverColorPicker'),
          title: 'Hover color',
          color: state.hoverColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().hoverColorChanged(color);
          },
        );
      },
    );
  }
}

class _IndicatorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.indicatorColor != current.indicatorColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_indicatorColorPicker'),
          title: 'Indicator color',
          color: state.indicatorColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().indicatorColorChanged(color);
          },
        );
      },
    );
  }
}

class _ScaffoldBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.scaffoldBackgroundColor !=
            current.scaffoldBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_scaffoldBackgroundColorPicker'),
          title: 'Scaffold background color',
          color: state.scaffoldBackgroundColor,
          onColorChanged: (color) {
            context
                .read<ColorThemeCubit>()
                .scaffoldBackgroundColorChanged(color);
          },
        );
      },
    );
  }
}

class _SecondaryHeaderColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.secondaryHeaderColor != current.secondaryHeaderColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_secondaryHeaderColorPicker'),
          title: 'Secondary header color',
          color: state.secondaryHeaderColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().secondaryHeaderColorChanged(color);
          },
        );
      },
    );
  }
}

class _SelectedRowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.selectedRowColor != current.selectedRowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_selectedRowColorPicker'),
          title: 'Selected row color',
          color: state.selectedRowColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().selectedRowColorChanged(color);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.shadowColor != current.shadowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_shadowColorPicker'),
          title: 'Shadow color',
          color: state.shadowColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().shadowColorChanged(color);
          },
        );
      },
    );
  }
}

class _SplashColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.splashColor != current.splashColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_splashColorPicker'),
          title: 'Splash color',
          color: state.splashColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().splashColorChanged(color);
          },
        );
      },
    );
  }
}

class _ToggleableActiveColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.toggleableActiveColor != current.toggleableActiveColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_toggleableActiveColorPicker'),
          title: 'Toggleable active color',
          color: state.toggleableActiveColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().toggleableActiveColorChanged(color);
          },
        );
      },
    );
  }
}

class _UnselectedWidgetColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      buildWhen: (previous, current) {
        return previous.unselectedWidgetColor != current.unselectedWidgetColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorThemeEditor_unselectedWidgetColorPicker'),
          title: 'Unselected widget color',
          color: state.unselectedWidgetColor,
          onColorChanged: (color) {
            context.read<ColorThemeCubit>().unselectedWidgetColorChanged(color);
          },
        );
      },
    );
  }
}
