import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _onPressed(context),
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

  void _onPressed(BuildContext context) {
    final editMode = context.read<HomeCubit>().state.editMode;
    late final ThemeData theme;

    if (editMode == EditMode.basic) {
      theme = context.read<BasicThemeCubit>().state.themeData;
    } else {
      theme = _getAdvancedTheme(context);
    }

    context.read<HomeCubit>().themeExported(theme);
  }

  ThemeData _getAdvancedTheme(BuildContext context) {
    final colorTheme = context.read<ColorThemeCubit>().state;
    final appBarTheme = context.read<AppBarThemeCubit>().state.theme;
    final tabBarTheme = context.read<TabBarThemeCubit>().state.theme;
    final bottomNavBarTheme =
        context.read<BottomNavigationBarThemeCubit>().state.theme;
    final floatingActionButtonTheme =
        context.read<FloatingActionButtonThemeCubit>().state.theme;
    final elevatedButtonTheme =
        context.read<ElevatedButtonThemeCubit>().state.theme;
    final outlinedButtonTheme =
        context.read<OutlinedButtonThemeCubit>().state.theme;
    final textButtonTheme = context.read<TextButtonThemeCubit>().state.theme;

    return context.read<AdvancedThemeCubit>().state.themeData.copyWith(
          primaryColor: colorTheme.primaryColor,
          primaryColorBrightness: colorTheme.primaryColorBrightness,
          primaryColorLight: colorTheme.primaryColorLight,
          primaryColorDark: colorTheme.primaryColorDark,
          backgroundColor: colorTheme.backgroundColor,
          bottomAppBarColor: colorTheme.bottomAppBarColor,
          canvasColor: colorTheme.canvasColor,
          cardColor: colorTheme.cardColor,
          dialogBackgroundColor: colorTheme.dialogBackgroundColor,
          disabledColor: colorTheme.disabledColor,
          dividerColor: colorTheme.dividerColor,
          errorColor: colorTheme.errorColor,
          focusColor: colorTheme.focusColor,
          highlightColor: colorTheme.highlightColor,
          hintColor: colorTheme.hintColor,
          hoverColor: colorTheme.hoverColor,
          indicatorColor: colorTheme.indicatorColor,
          scaffoldBackgroundColor: colorTheme.scaffoldBackgroundColor,
          secondaryHeaderColor: colorTheme.secondaryHeaderColor,
          selectedRowColor: colorTheme.selectedRowColor,
          shadowColor: colorTheme.shadowColor,
          splashColor: colorTheme.splashColor,
          toggleableActiveColor: colorTheme.toggleableActiveColor,
          unselectedWidgetColor: colorTheme.unselectedWidgetColor,
          appBarTheme: appBarTheme,
          tabBarTheme: tabBarTheme,
          bottomNavigationBarTheme: bottomNavBarTheme,
          floatingActionButtonTheme: floatingActionButtonTheme,
          elevatedButtonTheme: elevatedButtonTheme,
          outlinedButtonTheme: outlinedButtonTheme,
          textButtonTheme: textButtonTheme,
        );
  }
}
