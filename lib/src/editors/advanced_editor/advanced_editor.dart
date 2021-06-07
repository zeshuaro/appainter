import 'package:flutter/material.dart';
import 'package:flutter_theme/widgets/widgets.dart';

import 'app_bar/app_bar_editor.dart';
import 'icon_theme_editor.dart';
import 'tab_bar/tab_bar_editor.dart';
import 'bottom_nav_bar/bottom_nav_bar_editor.dart';
import 'color_editor.dart';
import 'buttons/buttons.dart';

class AdvancedEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyListView(
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
      ],
    );
  }
}
