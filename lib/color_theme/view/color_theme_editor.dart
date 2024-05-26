import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorThemeEditor extends ExpansionPanelItem {
  const ColorThemeEditor({super.key});

  @override
  String get header => 'Colors';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        _PrimaryColorPicker(),
        _SecondaryColorPicker(),
        _PrimaryColorLightPicker(),
        _PrimaryColorDarkPicker(),
        _BackgroundColorPicker(),
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
        _ShadowColorPicker(),
        _SplashColorPicker(),
        _UnselectedWidgetColorPicker(),
      ],
    );
  }
}

class _PrimaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_primaryColorPicker'),
      buildWhen: (previous, current) {
        return previous.primaryColor != current.primaryColor;
      },
      builder: (context, state) {
        return ColorListTile(
          enableOpacity: false,
          title: 'Primary color',
          tooltip: ColorThemeDocs.primaryColor,
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

class _SecondaryColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_secondaryColorPicker'),
      buildWhen: (previous, current) {
        return previous.colorScheme.secondary != current.colorScheme.secondary;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Secondary color',
          tooltip: ColorThemeDocs.secondary,
          color: state.colorScheme.secondary,
          onColorChanged: (color) {
            final isDark = context.read<AdvancedThemeCubit>().state.isDark;
            context
                .read<ColorThemeCubit>()
                .secondaryColorChanged(color, isDark);
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
      key: const Key('colorThemeEditor_primaryColorLightPicker'),
      buildWhen: (previous, current) {
        return previous.primaryColorLight != current.primaryColorLight;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Primary color light',
          tooltip: ColorThemeDocs.primaryColorLight,
          color: state.primaryColorLight,
          onColorChanged:
              context.read<ColorThemeCubit>().primaryColorLightChanged,
        );
      },
    );
  }
}

class _PrimaryColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_primaryColorDarkPicker'),
      buildWhen: (previous, current) {
        return previous.primaryColorDark != current.primaryColorDark;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Primary color dark',
          tooltip: ColorThemeDocs.primaryColorDark,
          color: state.primaryColorDark,
          onColorChanged:
              context.read<ColorThemeCubit>().primaryColorDarkChanged,
        );
      },
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_surfaceColorPicker'),
      buildWhen: (previous, current) {
        return previous.colorScheme.surface != current.colorScheme.surface;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Surface color',
          tooltip: BasicThemeDocs.surface,
          color: state.colorScheme.surface,
          onColorChanged: context.read<ColorThemeCubit>().surfaceColorChanged,
        );
      },
    );
  }
}

class _CanvasColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_canvasColorPicker'),
      buildWhen: (previous, current) {
        return previous.canvasColor != current.canvasColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Canvas color',
          tooltip: ColorThemeDocs.canvasColor,
          color: state.canvasColor,
          onColorChanged: context.read<ColorThemeCubit>().canvasColorChanged,
        );
      },
    );
  }
}

class _CardColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_cardColorPicker'),
      buildWhen: (previous, current) {
        return previous.cardColor != current.cardColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Card color',
          tooltip: ColorThemeDocs.cardColor,
          color: state.cardColor,
          onColorChanged: context.read<ColorThemeCubit>().cardColorChanged,
        );
      },
    );
  }
}

class _DialogBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_dialogBackgroundColorPicker'),
      buildWhen: (previous, current) {
        return previous.dialogBackgroundColor != current.dialogBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Dialog background color',
          tooltip: ColorThemeDocs.dialogBackgroundColor,
          color: state.dialogBackgroundColor,
          onColorChanged:
              context.read<ColorThemeCubit>().dialogBackgroundColorChanged,
        );
      },
    );
  }
}

class _DisabledColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_disabledColorPicker'),
      buildWhen: (previous, current) {
        return previous.disabledColor != current.disabledColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Disabled color',
          tooltip: ColorThemeDocs.disabledColor,
          color: state.disabledColor,
          onColorChanged: context.read<ColorThemeCubit>().disabledColorChanged,
        );
      },
    );
  }
}

class _DividerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_dividerColorPicker'),
      buildWhen: (previous, current) {
        return previous.dividerColor != current.dividerColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Divider color',
          tooltip: ColorThemeDocs.dividerColor,
          color: state.dividerColor,
          onColorChanged: context.read<ColorThemeCubit>().dividerColorChanged,
        );
      },
    );
  }
}

class _ErrorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_errorColorPicker'),
      buildWhen: (previous, current) {
        return previous.colorScheme.error != current.colorScheme.error;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Error color',
          tooltip: BasicThemeDocs.error,
          color: state.colorScheme.error,
          onColorChanged: context.read<ColorThemeCubit>().errorColorChanged,
        );
      },
    );
  }
}

class _FocusColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_focusColorPicker'),
      buildWhen: (previous, current) {
        return previous.focusColor != current.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Focus color',
          tooltip: ColorThemeDocs.focusColor,
          color: state.focusColor,
          onColorChanged: context.read<ColorThemeCubit>().focusColorChanged,
        );
      },
    );
  }
}

class _HighlightColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_highlightColorPicker'),
      buildWhen: (previous, current) {
        return previous.highlightColor != current.highlightColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Highlight color',
          tooltip: ColorThemeDocs.highlightColor,
          color: state.highlightColor,
          onColorChanged: context.read<ColorThemeCubit>().highlightColorChanged,
        );
      },
    );
  }
}

class _HintColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_hintColorPicker'),
      buildWhen: (previous, current) {
        return previous.hintColor != current.hintColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Hint color',
          tooltip: ColorThemeDocs.hintColor,
          color: state.hintColor,
          onColorChanged: context.read<ColorThemeCubit>().hintColorChanged,
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_hoverColorPicker'),
      buildWhen: (previous, current) {
        return previous.hoverColor != current.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Hover color',
          tooltip: ColorThemeDocs.hoverColor,
          color: state.hoverColor,
          onColorChanged: context.read<ColorThemeCubit>().hoverColorChanged,
        );
      },
    );
  }
}

class _IndicatorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_indicatorColorPicker'),
      buildWhen: (previous, current) {
        return previous.indicatorColor != current.indicatorColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Indicator color',
          tooltip: ColorThemeDocs.indicatorColor,
          color: state.indicatorColor,
          onColorChanged: context.read<ColorThemeCubit>().indicatorColorChanged,
        );
      },
    );
  }
}

class _ScaffoldBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_scaffoldBackgroundColorPicker'),
      buildWhen: (previous, current) {
        return previous.scaffoldBackgroundColor !=
            current.scaffoldBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Scaffold background color',
          tooltip: ColorThemeDocs.scaffoldBackgroundColor,
          color: state.scaffoldBackgroundColor,
          onColorChanged:
              context.read<ColorThemeCubit>().scaffoldBackgroundColorChanged,
        );
      },
    );
  }
}

class _SecondaryHeaderColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_secondaryHeaderColorPicker'),
      buildWhen: (previous, current) {
        return previous.secondaryHeaderColor != current.secondaryHeaderColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Secondary header color',
          tooltip: ColorThemeDocs.secondaryHeaderColor,
          color: state.secondaryHeaderColor,
          onColorChanged:
              context.read<ColorThemeCubit>().secondaryHeaderColorChanged,
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_shadowColorPicker'),
      buildWhen: (previous, current) {
        return previous.shadowColor != current.shadowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Shadow color',
          tooltip: ColorThemeDocs.shadowColor,
          color: state.shadowColor,
          onColorChanged: context.read<ColorThemeCubit>().shadowColorChanged,
        );
      },
    );
  }
}

class _SplashColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_splashColorPicker'),
      buildWhen: (previous, current) {
        return previous.splashColor != current.splashColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Splash color',
          tooltip: ColorThemeDocs.splashColor,
          color: state.splashColor,
          onColorChanged: context.read<ColorThemeCubit>().splashColorChanged,
        );
      },
    );
  }
}

class _UnselectedWidgetColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorThemeCubit, ColorThemeState>(
      key: const Key('colorThemeEditor_unselectedWidgetColorPicker'),
      buildWhen: (previous, current) {
        return previous.unselectedWidgetColor != current.unselectedWidgetColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Unselected widget color',
          tooltip: ColorThemeDocs.unselectedWidgetColor,
          color: state.unselectedWidgetColor,
          onColorChanged:
              context.read<ColorThemeCubit>().unselectedWidgetColorChanged,
        );
      },
    );
  }
}
