import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class ColorEditor extends StatelessWidget {
  const ColorEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Colors',
      children: [
        _PrimaryColorPicker(),
        SideBySide(
          left: _PrimaryColorLightPicker(),
          right: _PrimaryColorDarkPicker(),
        ),
        SideBySideList(
          children: [
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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.primaryColor !=
                current.themeData.primaryColor ||
            previous.themeData.primaryColorBrightness !=
                current.themeData.primaryColorBrightness;
      },
      builder: (context, state) {
        return ColorAndBrightness(
          title: 'Primary Color',
          key: const Key('colorEditor_primaryColorPicker'),
          color: state.themeData.primaryColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().primaryColorChanged(color);
          },
          isColorDark: state.isPrimaryColorDark,
          onBrightnessChanged: (isDark) {
            context
                .read<AdvancedThemeCubit>()
                .primaryColorBrightnessChanged(isDark);
          },
        );
      },
    );
  }
}

class _PrimaryColorLightPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.primaryColorLight !=
            current.themeData.primaryColorLight;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_primaryColorLightPicker'),
          title: 'Primary Color Light',
          color: state.themeData.primaryColorLight,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().primaryColorLightChanged(color);
          },
        );
      },
    );
  }
}

class _PrimaryColorDarkPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.primaryColorDark !=
            current.themeData.primaryColorDark;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_primaryColorDarkPicker'),
          title: 'Primary Color Dark',
          color: state.themeData.primaryColorDark,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().primaryColorDarkChanged(color);
          },
        );
      },
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.backgroundColor !=
            current.themeData.backgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_backgroundColorPicker'),
          title: 'Background Color',
          color: state.themeData.backgroundColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().bgColorChanged(color);
          },
        );
      },
    );
  }
}

class _BottomAppBarColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomAppBarColor !=
            current.themeData.bottomAppBarColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_bottomAppBarColorPicker'),
          title: 'Bottom App Bar Color',
          color: state.themeData.bottomAppBarColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().bottomAppBarColorChanged(color);
          },
        );
      },
    );
  }
}

class _CanvasColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.canvasColor != current.themeData.canvasColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_canvasColorPicker'),
          title: 'Canvas Color',
          color: state.themeData.canvasColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().canvasColorChanged(color);
          },
        );
      },
    );
  }
}

class _CardColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.cardColor != current.themeData.cardColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_cardColorPicker'),
          title: 'Card Color',
          color: state.themeData.cardColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().cardColorChanged(color);
          },
        );
      },
    );
  }
}

class _DialogBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.dialogBackgroundColor !=
            current.themeData.dialogBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_dialogBackgroundColorPicker'),
          title: 'Dialog Background Color',
          color: state.themeData.dialogBackgroundColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().dialogBgColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.disabledColor !=
            current.themeData.disabledColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_disabledColorPicker'),
          title: 'Disabled Color',
          color: state.themeData.disabledColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().disabledColorChanged(color);
          },
        );
      },
    );
  }
}

class _DividerColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.dividerColor !=
            current.themeData.dividerColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_dividerColorPicker'),
          title: 'Divider Color',
          color: state.themeData.dividerColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().dividerColorChanged(color);
          },
        );
      },
    );
  }
}

class _ErrorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.errorColor != current.themeData.errorColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_errorColorPicker'),
          title: 'Error Color',
          color: state.themeData.errorColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().errorColorChanged(color);
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
        return previous.themeData.focusColor != current.themeData.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_focusColorPicker'),
          title: 'Focus Color',
          color: state.themeData.focusColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().focusColorChanged(color);
          },
        );
      },
    );
  }
}

class _HighlightColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.highlightColor !=
            current.themeData.highlightColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_highlightColorPicker'),
          title: 'Highlight Color',
          color: state.themeData.highlightColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().highlightColorChanged(color);
          },
        );
      },
    );
  }
}

class _HintColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.hintColor != current.themeData.hintColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_hintColorPicker'),
          title: 'Hint Color',
          color: state.themeData.hintColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().hintColorChanged(color);
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
        return previous.themeData.hoverColor != current.themeData.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_hoverColorPicker'),
          title: 'Hover Color',
          color: state.themeData.hoverColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().hoverColorChanged(color);
          },
        );
      },
    );
  }
}

class _IndicatorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.indicatorColor !=
            current.themeData.indicatorColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_indicatorColorPicker'),
          title: 'Indicator Color',
          color: state.themeData.indicatorColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().indicatorColorChanged(color);
          },
        );
      },
    );
  }
}

class _ScaffoldBackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.scaffoldBackgroundColor !=
            current.themeData.scaffoldBackgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_scaffoldBackgroundColorPicker'),
          title: 'Scaffold Background Color',
          color: state.themeData.scaffoldBackgroundColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().scaffoldBgColorChanged(color);
          },
        );
      },
    );
  }
}

class _SecondaryHeaderColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.secondaryHeaderColor !=
            current.themeData.secondaryHeaderColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_secondaryHeaderColorPicker'),
          title: 'Secondary Header Color',
          color: state.themeData.secondaryHeaderColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .secondaryHeaderColorChanged(color);
          },
        );
      },
    );
  }
}

class _SelectedRowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.selectedRowColor !=
            current.themeData.selectedRowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_selectedRowColorPicker'),
          title: 'Selected Row Color',
          color: state.themeData.selectedRowColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().selectedRowColorChanged(color);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.shadowColor != current.themeData.shadowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_shadowColorPicker'),
          title: 'Shadow Color',
          color: state.themeData.shadowColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().shadowColorChanged(color);
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
        return previous.themeData.splashColor != current.themeData.splashColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_splashColorPicker'),
          title: 'Splash Color',
          color: state.themeData.splashColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().splashColorChanged(color);
          },
        );
      },
    );
  }
}

class _ToggleableActiveColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.toggleableActiveColor !=
            current.themeData.toggleableActiveColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_toggleableActiveColorPicker'),
          title: 'Toggleable Active Color',
          color: state.themeData.toggleableActiveColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .toggleableActiveColorChanged(color);
          },
        );
      },
    );
  }
}

class _UnselectedWidgetColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.unselectedWidgetColor !=
            current.themeData.unselectedWidgetColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('colorEditor_unselectedWidgetColorPicker'),
          title: 'Unselected Widget Color',
          color: state.themeData.unselectedWidgetColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .unselectedWidgetColorChanged(color);
          },
        );
      },
    );
  }
}
