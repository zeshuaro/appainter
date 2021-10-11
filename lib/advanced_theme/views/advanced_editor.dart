import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class AdvancedEditor extends StatelessWidget {
  const AdvancedEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyListView(
      children: [
        ColorEditor(),
        AppBarEditor(),
        TabBarEditor(),
        BottomNavBarEditor(),
        FloatingActionBtnEditor(),
        ElevatedBtnEditor(),
        OutlinedBtnEditor(),
        TextBtnEditor(),
        IconThemeEditor(),
        InputDecorationEditor(),
        SwitchEditor(),
        CheckboxEditor(),
        RadioEditor(),
        TextThemeEditor(),
      ],
    );
  }
}
