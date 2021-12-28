import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class AdvancedEditor extends StatelessWidget {
  const AdvancedEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionPanelList(
      items: const [
        ColorThemeEditor(),
        AppBarThemeEditor(),
        TabBarThemeEditor(),
        BottomNavigationBarThemeEditor(),
        FloatingActionButtonThemeEditor(),
        ElevatedButtonThemeEditor(),
        OutlinedButtonThemeEditor(),
        TextButtonThemeEditor(),
        IconThemeEditor(),
        InputDecorationThemeEditor(),
        SwitchEditor(),
        CheckboxEditor(),
        RadioEditor(),
        SliderEditor(),
        TextThemeEditor(),
      ],
    );
  }
}
