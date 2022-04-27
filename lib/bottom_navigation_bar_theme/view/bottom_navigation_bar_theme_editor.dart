import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';

class BottomNavigationBarThemeEditor extends ExpansionPanelItem {
  const BottomNavigationBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Bottom navigation bar';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        _TypeDropdown(),
        _BackgroundColorPicker(),
        _SelectedItemColorPicker(),
        _UnselectedItemColorPicker(),
        _ShowSelectedLabelsSwitch(),
        _ShowUnselectedLabelsSwitch(),
        _ElevationTextField(),
      ],
    );
  }
}

class _TypeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.type != current.theme.type;
      },
      builder: (context, state) {
        final type = state.theme.type ?? BottomNavigationBarType.fixed;
        return DropdownListTile(
          key: const Key('bottomNavigationBarThemeEditor_typeDropdown'),
          title: 'Type',
          tooltip: BottomNavigationBarThemeDocs.type,
          value: UtilService.enumToString(type),
          values: UtilService.getEnumStrings(BottomNavigationBarType.values),
          onChanged: (value) {
            context.read<BottomNavigationBarThemeCubit>().typeChanged(value!);
          },
        );
      },
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = context
        .watch<BottomNavigationBarThemeCubit>()
        .state
        .theme
        .backgroundColor;
    final themeBackgroundColor =
        context.watch<ColorThemeCubit>().state.backgroundColor;

    return ColorListTile(
      key: const Key('bottomNavigationBarThemeEditor_backgroundColorPicker'),
      title: 'Background color',
      tooltip: BottomNavigationBarThemeDocs.backgroundColor,
      color: backgroundColor ?? themeBackgroundColor,
      onColorChanged: (color) {
        context
            .read<BottomNavigationBarThemeCubit>()
            .backgroundColorChanged(color);
      },
    );
  }
}

class _SelectedItemColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedItemColor = context
        .watch<BottomNavigationBarThemeCubit>()
        .state
        .theme
        .selectedItemColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('bottomNavigationBarThemeEditor_selectedItemColorPicker'),
      title: 'Selected item color',
      tooltip: BottomNavigationBarThemeDocs.selectedItemColor,
      color: selectedItemColor ?? primaryColor,
      onColorChanged: (color) {
        context
            .read<BottomNavigationBarThemeCubit>()
            .selectedItemColorChanged(color);
      },
    );
  }
}

class _UnselectedItemColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final unselectedItemColor = context
        .watch<BottomNavigationBarThemeCubit>()
        .state
        .theme
        .unselectedItemColor;
    final unselectedWidgetColor =
        context.watch<ColorThemeCubit>().state.unselectedWidgetColor;

    return ColorListTile(
      key: const Key(
        'bottomNavigationBarThemeEditor_unselectedItemColorPicker',
      ),
      title: 'Unselected item color',
      tooltip: BottomNavigationBarThemeDocs.unselectedItemColor,
      color: unselectedItemColor ?? unselectedWidgetColor,
      onColorChanged: (color) {
        context
            .read<BottomNavigationBarThemeCubit>()
            .unselectedItemColorChanged(color);
      },
    );
  }
}

class _ShowSelectedLabelsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.showSelectedLabels !=
            current.theme.showSelectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Show selected labels',
          tooltip: BottomNavigationBarThemeDocs.showSelectedLabels,
          key: const Key(
            'bottomNavigationBarThemeEditor_showSelectedLabelsSwitch',
          ),
          value: state.theme.showSelectedLabels ?? true,
          onChanged: (value) {
            context
                .read<BottomNavigationBarThemeCubit>()
                .showSelectedLabelsChanged(value);
          },
        );
      },
    );
  }
}

class _ShowUnselectedLabelsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.showUnselectedLabels !=
            current.theme.showUnselectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key(
            'bottomNavigationBarThemeEditor_showUnselectedLabelsSwitch',
          ),
          title: 'Show unselected labels',
          tooltip: BottomNavigationBarThemeDocs.showUnselectedLabels,
          value: state.theme.showUnselectedLabels ?? true,
          onChanged: (value) {
            context
                .read<BottomNavigationBarThemeCubit>()
                .showUnselectedLabelsChanged(value);
          },
        );
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('bottomNavigationBarThemeEditor_elevationTextField'),
          labelText: 'Elevation',
          tooltip: BottomNavigationBarThemeDocs.elevation,
          initialValue: state.theme.elevation?.toString() ??
              kBottomNavBarElevation.toString(),
          onChanged: (value) {
            context
                .read<BottomNavigationBarThemeCubit>()
                .elevationChanged(value);
          },
        );
      },
    );
  }
}
