import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/checkbox_theme/checkbox_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/radio_theme/radio_theme.dart';
import 'package:flutter_theme/slider_theme/slider_theme.dart';
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/text_theme/text_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'advanced_theme_state.dart';

class AdvancedThemeCubit extends Cubit<AdvancedThemeState> {
  final ColorThemeCubit colorThemeCubit;
  final AppBarThemeCubit appBarThemeCubit;
  final TabBarThemeCubit tabBarThemeCubit;
  final BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;
  final FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  final ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  final OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  final TextButtonThemeCubit textButtonThemeCubit;
  final IconThemeCubit iconThemeCubit;
  final InputDecorationThemeCubit inputDecorationThemeCubit;
  final SwitchThemeCubit switchThemeCubit;
  final CheckboxThemeCubit checkboxThemeCubit;
  final RadioThemeCubit radioThemeCubit;
  final SliderThemeCubit sliderThemeCubit;
  final TextThemeCubit textThemeCubit;

  AdvancedThemeCubit({
    required this.colorThemeCubit,
    required this.appBarThemeCubit,
    required this.tabBarThemeCubit,
    required this.bottomNavigationBarThemeCubit,
    required this.floatingActionButtonThemeCubit,
    required this.elevatedButtonThemeCubit,
    required this.outlinedButtonThemeCubit,
    required this.textButtonThemeCubit,
    required this.iconThemeCubit,
    required this.inputDecorationThemeCubit,
    required this.switchThemeCubit,
    required this.checkboxThemeCubit,
    required this.radioThemeCubit,
    required this.sliderThemeCubit,
    required this.textThemeCubit,
  }) : super(const AdvancedThemeState());

  void themeDataChanged(ThemeData theme) {
    colorThemeCubit.themeChanged(theme);
    appBarThemeCubit.themeChanged(theme.appBarTheme);
    tabBarThemeCubit.themeChanged(theme.tabBarTheme);
    bottomNavigationBarThemeCubit.themeChanged(theme.bottomNavigationBarTheme);
    floatingActionButtonThemeCubit.themeChanged(
      theme.floatingActionButtonTheme,
    );
    elevatedButtonThemeCubit.themeChanged(theme.elevatedButtonTheme);
    outlinedButtonThemeCubit.themeChanged(theme.outlinedButtonTheme);
    textButtonThemeCubit.themeChanged(theme.textButtonTheme);
    iconThemeCubit.themeChanged(theme.iconTheme);
    inputDecorationThemeCubit.themeChanged(theme.inputDecorationTheme);
    switchThemeCubit.themeChanged(theme.switchTheme);
    checkboxThemeCubit.themeChanged(theme.checkboxTheme);
    radioThemeCubit.themeChanged(theme.radioTheme);
    sliderThemeCubit.themeChanged(theme.sliderTheme);
    textThemeCubit.themeChanged(theme.textTheme);
  }

  void randomizedThemeRequested([int? seed]) {
    final theme = ThemeData.localize(
      ThemeData.from(
        colorScheme: randomColorSchemeLight(
          seed: seed ?? DateTime.now().millisecondsSinceEpoch,
          shouldPrint: false,
        ),
      ),
      Typography.englishLike2018,
    );
    themeDataChanged(theme);
  }

  void defaultThemeRequested() {
    final theme = ThemeData.localize(ThemeData(), Typography.englishLike2018);
    themeDataChanged(theme);
  }
}
