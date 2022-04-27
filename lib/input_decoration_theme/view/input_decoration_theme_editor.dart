import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';

class InputDecorationThemeEditor extends ExpansionPanelItem {
  const InputDecorationThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Input decoration';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        const SideBySideList(
          children: [
            _FloatingLabelBehaviorDropdown(),
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
        const Divider(),
        SideBySide(
          left: _BorderDropdown(),
          right: const _BorderRadiusTextField(),
        ),
        const _EnabledBorderSideFields(),
        const _DisabledBorderSideFields(),
        const _ErrorBorderSideFields(),
      ],
    );
  }
}

class _FloatingLabelBehaviorDropdown extends StatelessWidget {
  const _FloatingLabelBehaviorDropdown({Key? key}) : super(key: key);

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
          title: 'Floating label behavior',
          tooltip: InputDecorationThemeDocs.floatingLabelBehavior,
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
  const _FillColorPicker({Key? key}) : super(key: key);

  static const _fillColor = Color(0x0A000000);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.fillColor != current.theme.fillColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('inputDecorationThemeEditor_fillColorPicker'),
          title: 'Fill color',
          tooltip: InputDecorationThemeDocs.fillColor,
          color: state.theme.fillColor ?? _fillColor,
          onColorChanged: (color) {
            context.read<InputDecorationThemeCubit>().fillColorChanged(color);
          },
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  const _HoverColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoverColor =
        context.watch<InputDecorationThemeCubit>().state.theme.hoverColor;
    final themeHoverColor = context.watch<ColorThemeCubit>().state.hoverColor;

    return ColorListTile(
      key: const Key('inputDecorationThemeEditor_hoverColorPicker'),
      title: 'Hover color',
      tooltip: InputDecorationThemeDocs.hoverColor,
      color: hoverColor ?? themeHoverColor,
      onColorChanged: (color) {
        context.read<InputDecorationThemeCubit>().hoverColorChanged(color);
      },
    );
  }
}

class _AlignLabelWithHintSwitch extends StatelessWidget {
  const _AlignLabelWithHintSwitch({Key? key}) : super(key: key);

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
          title: 'Align label with hint',
          tooltip: InputDecorationThemeDocs.alignLabelWithHint,
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
  const _FilledSwitch({Key? key}) : super(key: key);

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
          tooltip: InputDecorationThemeDocs.filled,
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
  const _IsCollapsedSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.isCollapsed != current.theme.isCollapsed;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_isCollapsedSwitch'),
          title: 'Is collapsed',
          tooltip: InputDecorationThemeDocs.isCollapsed,
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
  const _IsDenseSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.isDense != current.theme.isDense;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('inputDecorationThemeEditor_isDenseSwitch'),
          title: 'Is dense',
          tooltip: InputDecorationThemeDocs.isDense,
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
  const _ErrorMaxLinesTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.errorMaxLines != current.theme.errorMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationThemeEditor_errorMaxLinesTextField'),
          labelText: 'Error max lines',
          tooltip: InputDecorationThemeDocs.errorMaxLines,
          initialValue:
              (state.theme.errorMaxLines ?? kInputDecorationThemeErrorMaxLines)
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
  const _HelperMaxLinesTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.helperMaxLines != current.theme.helperMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('inputDecorationThemeEditor_helperMaxLinesTextField'),
          labelText: 'Helper max lines',
          tooltip: InputDecorationThemeDocs.helperMaxLines,
          initialValue: (state.theme.helperMaxLines ??
                  kInputDecorationThemeHelperMaxLines)
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

class _BorderDropdown extends StatelessWidget {
  final _enum = InputBorderEnum();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.border != current.theme.border;
      },
      builder: (context, state) {
        final border = state.theme.border ?? const UnderlineInputBorder();
        return DropdownListTile(
          key: const Key(
            'inputDecorationThemeEditor_borderDropdown',
          ),
          title: 'Border',
          value: _enum.convertToString(border)!,
          values: _enum.names,
          onChanged: (value) {
            context.read<InputDecorationThemeCubit>().borderChanged(value!);
          },
        );
      },
    );
  }
}

class _BorderRadiusTextField extends StatefulWidget {
  const _BorderRadiusTextField({Key? key}) : super(key: key);

  @override
  State<_BorderRadiusTextField> createState() => _BorderRadiusTextFieldState();
}

class _BorderRadiusTextFieldState extends State<_BorderRadiusTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<InputDecorationThemeCubit, InputDecorationThemeState>(
          listenWhen: (previous, current) {
            return previous.theme.border?.isOutline != true &&
                current.theme.border?.isOutline == true;
          },
          listener: (context, state) {
            final border = state.theme.border;
            if (border is OutlineInputBorder) {
              _controller.text = border.borderRadius.bottomLeft.x.toString();
            }
          },
        ),
        BlocListener<InputDecorationThemeCubit, InputDecorationThemeState>(
          listenWhen: (previous, current) {
            return previous.theme.border?.isOutline == true &&
                current.theme.border?.isOutline != true;
          },
          listener: (context, state) => _controller.clear(),
        )
      ],
      child: BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
        buildWhen: (previous, current) {
          return previous.theme.border != current.theme.border;
        },
        builder: (context, state) {
          final border = state.theme.border ?? const UnderlineInputBorder();
          return MyTextFormField(
            key: const Key('inputDecorationThemeEditor_borderRadiusTextField'),
            controller: _controller,
            labelText: 'Border Radius',
            enabled: border is OutlineInputBorder,
            onChanged: (value) {
              context
                  .read<InputDecorationThemeCubit>()
                  .borderRadiusChanged(value);
            },
          );
        },
      ),
    );
  }
}

class _EnabledBorderSideFields extends StatelessWidget {
  const _EnabledBorderSideFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.enabledBorder?.borderSide !=
            current.theme.enabledBorder?.borderSide;
      },
      builder: (context, state) {
        return BorderSideFields(
          headerPrefix: 'Enabled',
          borderSide:
              state.theme.enabledBorder?.borderSide ?? const BorderSide(),
          onColorChanged: context
              .read<InputDecorationThemeCubit>()
              .enabledBorderSideColorChanged,
          onWidthChanged: context
              .read<InputDecorationThemeCubit>()
              .enabledBorderSideWidthChanged,
        );
      },
    );
  }
}

class _DisabledBorderSideFields extends StatelessWidget {
  const _DisabledBorderSideFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderSide = context
        .watch<InputDecorationThemeCubit>()
        .state
        .theme
        .disabledBorder
        ?.borderSide;
    final disabledColor = context.watch<ColorThemeCubit>().state.disabledColor;

    return BorderSideFields(
      headerPrefix: 'Disabled',
      borderSide: borderSide ?? BorderSide(color: disabledColor),
      onColorChanged: context
          .read<InputDecorationThemeCubit>()
          .disabledBorderSideColorChanged,
      onWidthChanged: context
          .read<InputDecorationThemeCubit>()
          .disabledBorderSideWidthChanged,
    );
  }
}

class _ErrorBorderSideFields extends StatelessWidget {
  const _ErrorBorderSideFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderSide = context
        .watch<InputDecorationThemeCubit>()
        .state
        .theme
        .errorBorder
        ?.borderSide;
    final errorColor = context.watch<ColorThemeCubit>().state.errorColor;

    return BorderSideFields(
      headerPrefix: 'Error',
      borderSide: borderSide ?? BorderSide(color: errorColor),
      onColorChanged:
          context.read<InputDecorationThemeCubit>().errorBorderSideColorChanged,
      onWidthChanged:
          context.read<InputDecorationThemeCubit>().errorBorderSideWidthChanged,
    );
  }
}
