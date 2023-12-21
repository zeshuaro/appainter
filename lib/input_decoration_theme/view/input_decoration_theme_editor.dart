import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDecorationThemeEditor extends ExpansionPanelItem {
  const InputDecorationThemeEditor({super.key});

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
  const _FloatingLabelBehaviorDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key(
        'inputDecorationThemeEditor_floatingLabelBehaviorDropdown',
      ),
      buildWhen: (previous, current) {
        return previous.theme.floatingLabelBehavior !=
            current.theme.floatingLabelBehavior;
      },
      builder: (context, state) {
        final behavior = state.theme.floatingLabelBehavior;
        return DropdownListTile(
          title: 'Floating label behavior',
          tooltip: InputDecorationThemeDocs.floatingLabelBehavior,
          value: UtilService.enumToString(behavior),
          values: UtilService.getEnumStrings(FloatingLabelBehavior.values),
          onChanged: context
              .read<InputDecorationThemeCubit>()
              .floatingLabelBehaviorChanged,
        );
      },
    );
  }
}

class _FillColorPicker extends StatelessWidget {
  const _FillColorPicker();

  static const _fillColor = Color(0x0A000000);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_fillColorPicker'),
      buildWhen: (previous, current) {
        return previous.theme.fillColor != current.theme.fillColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Fill color',
          tooltip: InputDecorationThemeDocs.fillColor,
          color: state.theme.fillColor ?? _fillColor,
          onColorChanged:
              context.read<InputDecorationThemeCubit>().fillColorChanged,
        );
      },
    );
  }
}

class _HoverColorPicker extends StatelessWidget {
  const _HoverColorPicker();

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
      onColorChanged:
          context.read<InputDecorationThemeCubit>().hoverColorChanged,
    );
  }
}

class _AlignLabelWithHintSwitch extends StatelessWidget {
  const _AlignLabelWithHintSwitch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_alignLabelWithHintSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.alignLabelWithHint !=
            current.theme.alignLabelWithHint;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Align label with hint',
          tooltip: InputDecorationThemeDocs.alignLabelWithHint,
          value: state.theme.alignLabelWithHint,
          onChanged: context
              .read<InputDecorationThemeCubit>()
              .alignLabelWithHintChanged,
        );
      },
    );
  }
}

class _FilledSwitch extends StatelessWidget {
  const _FilledSwitch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_filledSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.filled != current.theme.filled;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Filled',
          tooltip: InputDecorationThemeDocs.filled,
          value: state.theme.filled,
          onChanged: context.read<InputDecorationThemeCubit>().filledChanged,
        );
      },
    );
  }
}

class _IsCollapsedSwitch extends StatelessWidget {
  const _IsCollapsedSwitch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_isCollapsedSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.isCollapsed != current.theme.isCollapsed;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Is collapsed',
          tooltip: InputDecorationThemeDocs.isCollapsed,
          value: state.theme.isCollapsed,
          onChanged:
              context.read<InputDecorationThemeCubit>().isCollapsedChanged,
        );
      },
    );
  }
}

class _IsDenseSwitch extends StatelessWidget {
  const _IsDenseSwitch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_isDenseSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.isDense != current.theme.isDense;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Is dense',
          tooltip: InputDecorationThemeDocs.isDense,
          value: state.theme.isDense,
          onChanged: context.read<InputDecorationThemeCubit>().isDenseChanged,
        );
      },
    );
  }
}

class _ErrorMaxLinesTextField extends StatelessWidget {
  const _ErrorMaxLinesTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_errorMaxLinesTextField'),
      buildWhen: (previous, current) {
        return previous.theme.errorMaxLines != current.theme.errorMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Error max lines',
          tooltip: InputDecorationThemeDocs.errorMaxLines,
          initialValue:
              (state.theme.errorMaxLines ?? kInputDecorationThemeErrorMaxLines)
                  .toString(),
          onChanged:
              context.read<InputDecorationThemeCubit>().errorMaxLinesChanged,
        );
      },
    );
  }
}

class _HelperMaxLinesTextField extends StatelessWidget {
  const _HelperMaxLinesTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_helperMaxLinesTextField'),
      buildWhen: (previous, current) {
        return previous.theme.helperMaxLines != current.theme.helperMaxLines;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Helper max lines',
          tooltip: InputDecorationThemeDocs.helperMaxLines,
          initialValue: (state.theme.helperMaxLines ??
                  kInputDecorationThemeHelperMaxLines)
              .toString(),
          onChanged:
              context.read<InputDecorationThemeCubit>().helperMaxLinesChanged,
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
      key: const Key('inputDecorationThemeEditor_borderDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.border != current.theme.border;
      },
      builder: (context, state) {
        final border = state.theme.border ?? const UnderlineInputBorder();
        return DropdownListTile(
          title: 'Border',
          value: _enum.convertToString(border)!,
          values: _enum.names,
          onChanged: context.read<InputDecorationThemeCubit>().borderChanged,
        );
      },
    );
  }
}

class _BorderRadiusTextField extends StatefulWidget {
  const _BorderRadiusTextField();

  @override
  State<_BorderRadiusTextField> createState() => _BorderRadiusTextFieldState();
}

class _BorderRadiusTextFieldState extends State<_BorderRadiusTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    final border = context.read<InputDecorationThemeCubit>().state.theme.border;
    if (border is OutlineInputBorder) {
      _controller.text = border.borderRadius.bottomLeft.x.toString();
    }
    super.initState();
  }

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
        ),
      ],
      child: BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
        key: const Key('inputDecorationThemeEditor_borderRadiusTextField'),
        buildWhen: (previous, current) {
          return previous.theme.border != current.theme.border;
        },
        builder: (context, state) {
          final border = state.theme.border ?? const UnderlineInputBorder();
          return MyTextFormField(
            controller: _controller,
            labelText: 'Border Radius',
            enabled: border is OutlineInputBorder,
            onChanged:
                context.read<InputDecorationThemeCubit>().borderRadiusChanged,
          );
        },
      ),
    );
  }
}

class _EnabledBorderSideFields extends StatelessWidget {
  const _EnabledBorderSideFields();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputDecorationThemeCubit, InputDecorationThemeState>(
      key: const Key('inputDecorationThemeEditor_enabledBorderSideFields'),
      buildWhen: (previous, current) {
        return previous.theme.enabledBorder?.borderSide !=
            current.theme.enabledBorder?.borderSide;
      },
      builder: (context, state) {
        final cubit = context.read<InputDecorationThemeCubit>();
        return BorderSideFields(
          headerPrefix: 'Enabled',
          borderSide:
              state.theme.enabledBorder?.borderSide ?? const BorderSide(),
          onColorChanged: cubit.enabledBorderSideColorChanged,
          onWidthChanged: cubit.enabledBorderSideWidthChanged,
        );
      },
    );
  }
}

class _DisabledBorderSideFields extends StatelessWidget {
  const _DisabledBorderSideFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InputDecorationThemeCubit>();
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
      onColorChanged: cubit.disabledBorderSideColorChanged,
      onWidthChanged: cubit.disabledBorderSideWidthChanged,
    );
  }
}

class _ErrorBorderSideFields extends StatelessWidget {
  const _ErrorBorderSideFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InputDecorationThemeCubit>();
    final borderSide = context
        .watch<InputDecorationThemeCubit>()
        .state
        .theme
        .errorBorder
        ?.borderSide;
    final errorColor = context.watch<ColorThemeCubit>().state.colorScheme.error;

    return BorderSideFields(
      headerPrefix: 'Error',
      borderSide: borderSide ?? BorderSide(color: errorColor),
      onColorChanged: cubit.errorBorderSideColorChanged,
      onWidthChanged: cubit.errorBorderSideWidthChanged,
    );
  }
}
