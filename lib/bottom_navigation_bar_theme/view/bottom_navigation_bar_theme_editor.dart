import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class BottomNavigationBarThemeEditor extends ExpansionPanelItem {
  const BottomNavigationBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Bottom Navigation Bar';

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
          title: 'Type',
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
        context.watch<AdvancedThemeCubit>().state.themeData.backgroundColor;

    return ColorListTile(
      key: const Key('bottomNavigationBarThemeEditor_backgroundColorPicker'),
      title: 'Background Color',
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
    final primaryColor =
        context.watch<AdvancedThemeCubit>().state.themeData.primaryColor;

    return ColorListTile(
      key: const Key('bottomNavigationBarThemeEditor_selectedItemColorPicker'),
      title: 'Selected Item Color',
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
    final unselectedWidgetColor = context
        .watch<AdvancedThemeCubit>()
        .state
        .themeData
        .unselectedWidgetColor;

    return ColorListTile(
      key: const Key(
        'bottomNavigationBarThemeEditor_unselectedItemColorPicker',
      ),
      title: 'Unselected Item Color',
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
          title: 'Show Selected Labels',
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
          title: 'Show Unselected Labels',
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
