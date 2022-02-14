import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class TabBarThemeEditor extends ExpansionPanelItem {
  const TabBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Tab bar';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        _LabelColorPicker(),
        _UnselectedLabelColorPicker(),
        _IndicatorSizeDropdown(),
      ],
    );
  }
}

class _LabelColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelColor = context.watch<TabBarThemeCubit>().state.theme.labelColor;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;

    return ColorListTile(
      key: const Key('tabBarThemeEditor_labelColorPicker'),
      title: 'Label color',
      color: labelColor ?? onPrimaryColor,
      onColorChanged: (color) {
        context.read<TabBarThemeCubit>().labelColorChanged(color);
      },
    );
  }
}

class _UnselectedLabelColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final unselectedLabelColor =
        context.watch<TabBarThemeCubit>().state.theme.unselectedLabelColor;
    final unselectedColor = context
        .watch<ColorThemeCubit>()
        .state
        .colorScheme
        .onPrimary
        .withOpacity(0.7);

    return ColorListTile(
      key: const Key('tabBarThemeEditor_unselectedLabelColorPicker'),
      title: 'Unselected label color',
      color: unselectedLabelColor ?? unselectedColor,
      onColorChanged: (color) {
        context.read<TabBarThemeCubit>().unselectedLabelColorChanged(color);
      },
    );
  }
}

class _IndicatorSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarThemeCubit, TabBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.indicatorSize != current.theme.indicatorSize;
      },
      builder: (context, state) {
        final size = state.theme.indicatorSize ?? TabBarIndicatorSize.tab;
        return DropdownListTile(
          key: const Key('tabBarThemeEditor_indicatorSizeDropdown'),
          title: 'Indicator size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(TabBarIndicatorSize.values),
          onChanged: (value) {
            context.read<TabBarThemeCubit>().indicatorSizeChanged(value!);
          },
        );
      },
    );
  }
}
