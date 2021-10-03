import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class BottomNavBarEditor extends StatelessWidget {
  const BottomNavBarEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Bottom Navigation Bar',
      children: [
        SideBySideList(
          children: [
            _TypeDropdown(),
            _BgColorPicker(),
            _SelectedItemColorPicker(),
            _UnselectedItemColorPicker(),
            _ShowSelectedLabelsSwitch(),
            _ShowUnselectedLabelsSwitch(),
            _ElevationTextField(),
          ],
        ),
      ],
    );
  }
}

class _TypeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.type !=
            current.themeData.bottomNavigationBarTheme.type;
      },
      builder: (context, state) {
        final type = state.themeData.bottomNavigationBarTheme.type ??
            BottomNavigationBarType.fixed;
        return DropdownListTile(
          title: 'Type',
          value: UtilService.enumToString(type),
          values: UtilService.getEnumStrings(BottomNavigationBarType.values),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().bottomNavBarTypeChanged(value!);
          },
        );
      },
    );
  }
}

class _BgColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.backgroundColor !=
                current.themeData.bottomNavigationBarTheme.backgroundColor ||
            previous.themeData.backgroundColor !=
                current.themeData.backgroundColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('bottomNavBarEditor_bgColorPicker'),
          title: 'Background Color',
          color: state.themeData.bottomNavigationBarTheme.backgroundColor ??
              state.themeData.backgroundColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarBgColorChanged(color);
          },
        );
      },
    );
  }
}

class _SelectedItemColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.selectedItemColor !=
                current.themeData.bottomNavigationBarTheme.selectedItemColor ||
            previous.themeData.primaryColor != current.themeData.primaryColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('bottomNavBarEditor_selectedItemColorPicker'),
          title: 'Selected Item Color',
          color: state.themeData.bottomNavigationBarTheme.selectedItemColor ??
              state.themeData.primaryColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarSelectedItemColorChanged(color);
          },
        );
      },
    );
  }
}

class _UnselectedItemColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous
                    .themeData.bottomNavigationBarTheme.unselectedItemColor !=
                current
                    .themeData.bottomNavigationBarTheme.unselectedItemColor ||
            previous.themeData.unselectedWidgetColor !=
                current.themeData.unselectedWidgetColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('bottomNavBarEditor_unselectedItemColorPicker'),
          title: 'Unselected Item Color',
          color: state.themeData.bottomNavigationBarTheme.unselectedItemColor ??
              state.themeData.unselectedWidgetColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarUnselectedItemColorChanged(color);
          },
        );
      },
    );
  }
}

class _ShowSelectedLabelsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.showSelectedLabels !=
            current.themeData.bottomNavigationBarTheme.showSelectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Show Selected Labels',
          key: const Key('bottomNavBarEditor_showSelectedLabelsSwitch'),
          value: state.themeData.bottomNavigationBarTheme.showSelectedLabels ??
              true,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarShowSelectedLabelsChanged(value);
          },
        );
      },
    );
  }
}

class _ShowUnselectedLabelsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous
                .themeData.bottomNavigationBarTheme.showUnselectedLabels !=
            current.themeData.bottomNavigationBarTheme.showUnselectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('bottomNavBarEditor_showUnselectedLabelsSwitch'),
          title: 'Show Unselected Labels',
          value:
              state.themeData.bottomNavigationBarTheme.showUnselectedLabels ??
                  true,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarShowUnselectedLabelsChanged(value);
          },
        );
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.elevation !=
            current.themeData.bottomNavigationBarTheme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('bottomNavBarEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue:
              state.themeData.bottomNavigationBarTheme.elevation?.toString() ??
                  kBottomNavBarElevation.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarElevationChanged(value);
          },
        );
      },
    );
  }
}
