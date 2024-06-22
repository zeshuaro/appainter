import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdvancedEditor extends StatelessWidget {
  const AdvancedEditor({super.key});

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
        FilledButtonThemeEditor(),
        OutlinedButtonThemeEditor(),
        TextButtonThemeEditor(),
        IconThemeEditor(),
        InputDecorationThemeEditor(),
        SwitchThemeEditor(),
        CheckboxThemeEditor(),
        RadioThemeEditor(),
        SliderThemeEditor(),
        TextThemeEditor(),
      ],
    );
  }
}
