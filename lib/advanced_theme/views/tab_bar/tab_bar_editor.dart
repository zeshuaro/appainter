import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class TabBarEditor extends StatelessWidget {
  const TabBarEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Tab Bar',
      children: [
        SideBySideList(
          children: [
            _LabelColorPicker(),
            _UnselectedLabelColorPicker(),
            _IndicatorSizeDropdown(),
          ],
        ),
      ],
    );
  }
}

class _LabelColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.tabBarTheme.labelColor !=
                current.themeData.tabBarTheme.labelColor ||
            previous.themeData.primaryTextTheme.bodyText1?.color !=
                current.themeData.primaryTextTheme.bodyText1?.color;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('tabBarEditor_labelColorPicker'),
          title: 'Label Color',
          color: state.themeData.tabBarTheme.labelColor ??
              state.themeData.primaryTextTheme.bodyText1!.color!,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().tabBarLabelColorChanged(color);
          },
        );
      },
    );
  }
}

class _UnselectedLabelColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.tabBarTheme.unselectedLabelColor !=
                current.themeData.tabBarTheme.unselectedLabelColor ||
            previous.themeData.primaryTextTheme.bodyText1?.color !=
                current.themeData.primaryTextTheme.bodyText1?.color;
      },
      builder: (context, state) {
        final labelColor = state.themeData.tabBarTheme.labelColor ??
            state.themeData.primaryTextTheme.bodyText1!.color!;

        return ColorListTile(
          key: const Key('tabBarEditor_unselectedLabelColorPicker'),
          title: 'Unselected Label Color',
          color: state.themeData.tabBarTheme.unselectedLabelColor ??
              labelColor.withOpacity(kTabBarUnselectedColorOpacity),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .tabBarUnselectedLabelColorChanged(color);
          },
        );
      },
    );
  }
}

class _IndicatorSizeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.tabBarTheme.indicatorSize !=
            current.themeData.tabBarTheme.indicatorSize;
      },
      builder: (context, state) {
        final size = state.themeData.tabBarTheme.indicatorSize ??
            TabBarIndicatorSize.tab;
        return DropdownListTile(
          key: const Key('tabBarEditor_indicatorSizeDropdown'),
          title: 'Indicator Size',
          value: UtilService.enumToString(size),
          values: UtilService.getEnumStrings(TabBarIndicatorSize.values),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .tabBarIndicatorSizeChanged(value!);
          },
        );
      },
    );
  }
}
