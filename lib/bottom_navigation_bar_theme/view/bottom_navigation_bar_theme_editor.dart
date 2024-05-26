import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarThemeEditor extends ExpansionPanelItem {
  const BottomNavigationBarThemeEditor({super.key});

  @override
  String get header => 'Bottom navigation bar';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        SideBySideList(
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
        ),
        MyExpansionPanelList(
          items: const [
            _LabelTextStyleCard(
              key: Key('bottomNavigationBarThemeEditor_labelTextStyleCard'),
            ),
            _UnselectedLabelTextStyleCard(
              key: Key(
                'bottomNavigationBarThemeEditor_unselectedLabelTextStyleCard',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TypeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      key: const Key('bottomNavigationBarThemeEditor_typeDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.type != current.theme.type;
      },
      builder: (context, state) {
        final type = state.theme.type ?? BottomNavigationBarType.fixed;
        return DropdownListTile(
          title: 'Type',
          tooltip: BottomNavigationBarThemeDocs.type,
          value: UtilService.enumToString(type),
          values: UtilService.getEnumStrings(BottomNavigationBarType.values),
          onChanged: context.read<BottomNavigationBarThemeCubit>().typeChanged,
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
        context.watch<ColorThemeCubit>().state.colorScheme.surface;

    return ColorListTile(
      key: const Key('bottomNavigationBarThemeEditor_backgroundColorPicker'),
      title: 'Background color',
      tooltip: BottomNavigationBarThemeDocs.backgroundColor,
      color: backgroundColor ?? themeBackgroundColor,
      onColorChanged:
          context.read<BottomNavigationBarThemeCubit>().backgroundColorChanged,
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
      onColorChanged: context
          .read<BottomNavigationBarThemeCubit>()
          .selectedItemColorChanged,
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
      onColorChanged: context
          .read<BottomNavigationBarThemeCubit>()
          .unselectedItemColorChanged,
    );
  }
}

class _ShowSelectedLabelsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      key: const Key('bottomNavigationBarThemeEditor_showSelectedLabelsSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.showSelectedLabels !=
            current.theme.showSelectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Show selected labels',
          tooltip: BottomNavigationBarThemeDocs.showSelectedLabels,
          value: state.theme.showSelectedLabels ?? true,
          onChanged: context
              .read<BottomNavigationBarThemeCubit>()
              .showSelectedLabelsChanged,
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
      key: const Key(
        'bottomNavigationBarThemeEditor_showUnselectedLabelsSwitch',
      ),
      buildWhen: (previous, current) {
        return previous.theme.showUnselectedLabels !=
            current.theme.showUnselectedLabels;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Show unselected labels',
          tooltip: BottomNavigationBarThemeDocs.showUnselectedLabels,
          value: state.theme.showUnselectedLabels ?? true,
          onChanged: context
              .read<BottomNavigationBarThemeCubit>()
              .showUnselectedLabelsChanged,
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
      key: const Key('bottomNavigationBarThemeEditor_elevationTextField'),
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Elevation',
          tooltip: BottomNavigationBarThemeDocs.elevation,
          initialValue: state.theme.elevation?.toString() ??
              kBottomNavBarElevation.toString(),
          onChanged:
              context.read<BottomNavigationBarThemeCubit>().elevationChanged,
        );
      },
    );
  }
}

class _LabelTextStyleCard
    extends AbstractTextStyleEditor<BottomNavigationBarLabelTextStyleCubit> {
  const _LabelTextStyleCard({super.key});

  @override
  String get header => 'Label text style';

  @override
  String? get tooltip => BottomNavigationBarThemeDocs.selectedLabelStyle;
}

class _UnselectedLabelTextStyleCard extends AbstractTextStyleEditor<
    BottomNavigationBarUnselectedLabelTextStyleCubit> {
  const _UnselectedLabelTextStyleCard({super.key});

  @override
  String get header => 'Unselected label text style';

  @override
  String? get tooltip => BottomNavigationBarThemeDocs.unselectedLabelStyle;
}
