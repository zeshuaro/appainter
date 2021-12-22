import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editMode = context.select((HomeCubit cubit) {
      return cubit.state.editMode;
    });
    final basicTheme = context.select((BasicThemeCubit cubit) {
      return cubit.state.themeData;
    });

    final appBarTheme = context.select((AppBarThemeCubit cubit) {
      return cubit.state.theme;
    });
    final tabBarTheme = context.select((TabBarThemeCubit cubit) {
      return cubit.state.theme;
    });
    final bottomNavBarTheme = context.select(
      (BottomNavigationBarThemeCubit cubit) => cubit.state.theme,
    );
    final floatingActionButtonTheme = context.select(
      (FloatingActionButtonThemeCubit cubit) => cubit.state.theme,
    );
    final elevatedButtonTheme = context.select(
      (ElevatedButtonThemeCubit cubit) => cubit.state.theme,
    );
    final advancedTheme = context.select((AdvancedThemeCubit cubit) {
      return cubit.state.themeData;
    }).copyWith(
      appBarTheme: appBarTheme,
      tabBarTheme: tabBarTheme,
      bottomNavigationBarTheme: bottomNavBarTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      elevatedButtonTheme: elevatedButtonTheme,
    );

    return TextButton.icon(
      onPressed: () {
        final theme = editMode == EditMode.basic ? basicTheme : advancedTheme;
        context.read<HomeCubit>().themeExported(theme);
      },
      icon: const FaIcon(
        FontAwesomeIcons.download,
        color: Colors.white,
        size: 20,
      ),
      label: const Text(
        'Export',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
