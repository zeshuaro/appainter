import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class InputDecorationThemeEditor extends ExpansionPanelItem {
  const InputDecorationThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Input Decoration';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        _FloatingLabelBehaviorDropdown(),
        SideBySideList(
          children: [
            _FillColorPicker(),
            _HoverColorPicker(),
            _AlignLabelWithHintSwitch(),
            _FilledSwitch(),
            _IsCollapsedSwitch(),
            _IsDenseSwitch(),
            _ErrorMaxLinesTextField(),
            _HelperMaxLinesTextField(),
          ],
        ),
      ],
    );
  }
}

class _FloatingLabelBehaviorDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.floatingLabelBehavior !=
            current.theme.floatingLabelBehavior;
      },
      builder: (context, state) {
        final behavior = state.theme.floatingLabelBehavior;
        return DropdownListTile(
          key: const Key(
            'inputDecorationThemeEditor_floatingLabelBehaviorDropdown',
          ),
          title: 'Floating Label Behavior',
          value: UtilService.enumToString(behavior),
          values: UtilService.getEnumStrings(FloatingLabelBehavior.values),
          onChanged: (value) {
            context
                .read<InputDecorationThemeCubit>()
                .floatingLabelBehaviorChanged(value!);
          },
        );
      },
    );
  }
}

class _FillColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.fillColor != current.theme.fillColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('inputDecorationThemeEditor_fillColorPicker'),
          title: 'Fill Color',
          color: state.theme.fillColor ?? kInputDecorationFillColor,
          onColorChanged: (color) {
            context.read<InputDecorationThemeCubit>().fillColorChanged(color);
          },
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hoverColor =
        context.watch<InputDecorationThemeCubit>().state.theme.hoverColor;
    final themeHoverColor = context.watch<ColorThemeCubit>().state.hoverColor;

    return ColorListTile(
      key: const Key('inputDecorationThemeEditor_hoverColorPicker'),
      title: 'Hover Color',
      color: hoverColor ?? themeHoverColor,
      onColorChanged: (color) {
        context.read<InputDecorationThemeCubit>().hoverColorChanged(color);
      },
    );
  }
}

class _AlignLabelWithHintSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.alignLabelWithHint !=
            current.theme.alignLabelWithHint;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_alignLabelWithHintSwitch'),
          title: 'Align Label with Hint',
          value: state.theme.alignLabelWithHint,
          onChanged: (value) {
            context
                .read<InputDecorationThemeCubit>()
                .alignLabelWithHintChanged(value);
          },
        );
      },
    );
  }
}

class _FilledSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.filled != current.theme.filled;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_filledSwitch'),
          title: 'Filled',
          value: state.theme.filled,
          onChanged: (value) {
            context.read<InputDecorationThemeCubit>().filledChanged(value);
          },
        );
      },
    );
  }
}

class _IsCollapsedSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.isCollapsed != current.theme.isCollapsed;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_isCollapsedSwitch'),
          title: 'Is Collapsed',
          value: state.theme.isCollapsed,
          onChanged: (value) {
            context.read<InputDecorationThemeCubit>().isCollapsedChanged(value);
          },
        );
      },
    );
  }
}

class _IsDenseSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.isDense != current.theme.isDense;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_isDenseSwitch'),
          title: 'Is Dense',
          value: state.theme.isDense,
          onChanged: (value) {
            context.read<InputDecorationThemeCubit>().isDenseChanged(value);
          },
        );
      },
    );
  }
}

class _ErrorMaxLinesTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.errorMaxLines != current.theme.errorMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationThemeEditor_errorMaxLinesTextField'),
          labelText: 'Error Max Lines',
          initialValue:
              (state.theme.errorMaxLines ?? kInputDecorationErrorMaxLines)
                  .toString(),
          onChanged: (value) {
            context
                .read<InputDecorationThemeCubit>()
                .errorMaxLinesChanged(value);
          },
        );
      },
    );
  }
}

class _HelperMaxLinesTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.helperMaxLines != current.theme.helperMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationThemeEditor_helperMaxLinesTextField'),
          labelText: 'Helper Max Lines',
          initialValue:
              (state.theme.helperMaxLines ?? kInputDecorationHelperMaxLines)
                  .toString(),
          onChanged: (value) {
            context
                .read<InputDecorationThemeCubit>()
                .helperMaxLinesChanged(value);
          },
        );
      },
    );
  }
}
