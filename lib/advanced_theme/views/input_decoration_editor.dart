import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class InputDecorationEditor extends ExpansionPanelItem {
  const InputDecorationEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Input Decoration';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        _FloatingLabelBehaviorDropdown(),
        _FillColorPicker(),
        _FocusColorPicker(),
        _HoverColorPicker(),
        _AlignLabelWithHintSwitch(),
        _FilledSwitch(),
        _IsCollapsedSwitch(),
        _IsDenseSwitch(),
        _ErrorMaxLinesTextField(),
        _HelperMaxLinesTextField(),
      ],
    );
  }
}

class _FloatingLabelBehaviorDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.floatingLabelBehavior !=
            current.themeData.inputDecorationTheme.floatingLabelBehavior;
      },
      builder: (context, state) {
        final behavior =
            state.themeData.inputDecorationTheme.floatingLabelBehavior;
        return DropdownListTile(
          key: const Key('inputDecorationEditor_floatingLabelBehaviorDropdown'),
          title: 'Floating Label Behavior',
          value: UtilService.enumToString(behavior),
          values: UtilService.getEnumStrings(FloatingLabelBehavior.values),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationFloatingLabelBehaviorChanged(value!);
          },
        );
      },
    );
  }
}

class _FillColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.fillColor !=
            current.themeData.inputDecorationTheme.fillColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('inputDecorationEditor_fillColorPicker'),
          title: 'Fill Color',
          color: state.themeData.inputDecorationTheme.fillColor ??
              kInputDecorationFillColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationFillColorChanged(color);
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
        return previous.themeData.inputDecorationTheme.focusColor !=
            current.themeData.inputDecorationTheme.focusColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('inputDecorationEditor_focusColorPicker'),
          title: 'Focus Color',
          color: state.themeData.inputDecorationTheme.focusColor ??
              state.themeData.focusColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationFocusColorChanged(color);
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
        return previous.themeData.inputDecorationTheme.hoverColor !=
            current.themeData.inputDecorationTheme.hoverColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('inputDecorationEditor_hoverColorPicker'),
          title: 'Hover Color',
          color: state.themeData.inputDecorationTheme.hoverColor ??
              state.themeData.hoverColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationHoverColorChanged(color);
          },
        );
      },
    );
  }
}

class _AlignLabelWithHintSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.alignLabelWithHint !=
            current.themeData.inputDecorationTheme.alignLabelWithHint;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationEditor_alignLabelWithHintSwitch'),
          title: 'Align Label with Hint',
          value: state.themeData.inputDecorationTheme.alignLabelWithHint,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationAlignLabelWithHintChanged(value);
          },
        );
      },
    );
  }
}

class _FilledSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.filled !=
            current.themeData.inputDecorationTheme.filled;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationEditor_filledSwitch'),
          title: 'Filled',
          value: state.themeData.inputDecorationTheme.filled,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationFilledChanged(value);
          },
        );
      },
    );
  }
}

class _IsCollapsedSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.isCollapsed !=
            current.themeData.inputDecorationTheme.isCollapsed;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationEditor_isCollapsedSwitch'),
          title: 'Is Collapsed',
          value: state.themeData.inputDecorationTheme.isCollapsed,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationIsCollapsedChanged(value);
          },
        );
      },
    );
  }
}

class _IsDenseSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.isDense !=
            current.themeData.inputDecorationTheme.isDense;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationEditor_isDenseSwitch'),
          title: 'Is Dense',
          value: state.themeData.inputDecorationTheme.isDense,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationIsDenseChanged(value);
          },
        );
      },
    );
  }
}

class _ErrorMaxLinesTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.errorMaxLines !=
            current.themeData.inputDecorationTheme.errorMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationEditor_errorMaxLinesTextField'),
          labelText: 'Error Max Lines',
          initialValue:
              state.themeData.inputDecorationTheme.errorMaxLines?.toString() ??
                  kInputDecorationErrorMaxLines.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationErrorMaxLinesChanged(value);
          },
        );
      },
    );
  }
}

class _HelperMaxLinesTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.inputDecorationTheme.helperMaxLines !=
            current.themeData.inputDecorationTheme.helperMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationEditor_helperMaxLinesTextField'),
          labelText: 'Helper Max Lines',
          initialValue:
              state.themeData.inputDecorationTheme.helperMaxLines?.toString() ??
                  kInputDecorationHelperMaxLines.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .inputDecorationHelperMaxLinesChanged(value);
          },
        );
      },
    );
  }
}
