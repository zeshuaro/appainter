import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'advanced_theme_cubit.g.dart';
part 'advanced_theme_state.dart';

class AdvancedThemeCubit extends Cubit<AdvancedThemeState> {
  final AppBarThemeCubit appBarThemeCubit;
  final TabBarThemeCubit tabBarThemeCubit;
  final BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;
  final FloatingActionButtonThemeCubit floatingActionButtonThemeCubit;
  final ElevatedButtonThemeCubit elevatedButtonThemeCubit;

  AdvancedThemeCubit({
    required this.appBarThemeCubit,
    required this.tabBarThemeCubit,
    required this.bottomNavigationBarThemeCubit,
    required this.floatingActionButtonThemeCubit,
    required this.elevatedButtonThemeCubit,
  }) : super(AdvancedThemeState());

  void themeDataChanged(ThemeData theme) {
    appBarThemeCubit.themeChanged(theme.appBarTheme);
    tabBarThemeCubit.themeChanged(theme.tabBarTheme);
    bottomNavigationBarThemeCubit.themeChanged(theme.bottomNavigationBarTheme);
    floatingActionButtonThemeCubit.themeChanged(
      theme.floatingActionButtonTheme,
    );
    elevatedButtonThemeCubit.themeChanged(theme.elevatedButtonTheme);

    emit(state.copyWith(themeData: theme));
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
