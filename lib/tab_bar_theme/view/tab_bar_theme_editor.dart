import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarThemeEditor extends ExpansionPanelItem {
  const TabBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Tab bar';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        SideBySideList(
          padding: kPaddingAll,
          children: [
            _LabelColorPicker(),
            _UnselectedLabelColorPicker(),
            _IndicatorSizeDropdown(),
          ],
        ),
        MyExpansionPanelList(
          items: const [
            _LabelTextStyleCard(
              key: Key('tabBarThemeEditor_labelTextStyleCard'),
            ),
            _UnselectedLabelTextStyleCard(
              key: Key('tabBarThemeEditor_unselectedLabelTextStyleCard'),
            ),
          ],
        ),
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
      tooltip: TabBarThemeDocs.labelColor,
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
      tooltip: TabBarThemeDocs.unselectedLabelColor,
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
          tooltip: TabBarThemeDocs.indicatorSize,
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

class _LabelTextStyleCard
    extends AbstractTextStyleEditor<TabBarLabelTextStyleCubit> {
  const _LabelTextStyleCard({Key? key}) : super(key: key);

  @override
  String get header => 'Label text style';

  @override
  String? get tooltip => TabBarThemeDocs.labelStyle;
}

class _UnselectedLabelTextStyleCard
    extends AbstractTextStyleEditor<TabBarUnselectedLabelTextStyleCubit> {
  const _UnselectedLabelTextStyleCard({Key? key}) : super(key: key);

  @override
  String get header => 'Unselected label text style';

  @override
  String? get tooltip => TabBarThemeDocs.unselectedLabelStyle;
}
