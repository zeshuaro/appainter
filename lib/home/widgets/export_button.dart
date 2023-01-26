// ignore_for_file: deprecated_member_use

import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExportButton extends StatelessWidget {
  final Color color;

  const ExportButton({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        MdiIcons.applicationExport,
        color: color,
      ),
      label: Text(
        'Export',
        style: TextStyle(color: color),
      ),
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    final editMode = context.read<HomeCubit>().state.editMode;
    late final ThemeData theme;

    if (editMode == EditMode.basic) {
      theme = context.read<BasicThemeCubit>().state.theme;
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
    final iconTheme = context.read<IconThemeCubit>().state.theme;
    final inputDecorationTheme =
        context.read<InputDecorationThemeCubit>().state.theme;
    final switchTheme = context.read<SwitchThemeCubit>().state.theme;
    final checkboxTheme = context.read<CheckboxThemeCubit>().state.theme;
    final radioTheme = context.read<RadioThemeCubit>().state.theme;
    final sliderTheme = context.read<SliderThemeCubit>().state.theme;
    final fontFamily = context.read<TextThemeCubit>().state.fontFamily;

    final headline1TextStyle =
        context.read<Headline1TextStyleCubit>().state.style;
    final headline2TextStyle =
        context.read<Headline2TextStyleCubit>().state.style;
    final headline3TextStyle =
        context.read<Headline3TextStyleCubit>().state.style;
    final headline4TextStyle =
        context.read<Headline4TextStyleCubit>().state.style;
    final headline5TextStyle =
        context.read<Headline5TextStyleCubit>().state.style;
    final headline6TextStyle =
        context.read<Headline6TextStyleCubit>().state.style;

    final subtitle1TextStyle =
        context.read<Subtitle1TextStyleCubit>().state.style;
    final subtitle2TextStyle =
        context.read<Subtitle2TextStyleCubit>().state.style;
    final bodyText1TextStyle =
        context.read<BodyText1TextStyleCubit>().state.style;
    final bodyText2TextStyle =
        context.read<BodyText2TextStyleCubit>().state.style;

    final buttonTextStyle = context.read<ButtonTextStyleCubit>().state.style;
    final captionTextStyle = context.read<CaptionTextStyleCubit>().state.style;
    final overlineTextStyle =
        context.read<OverlineTextStyleCubit>().state.style;

    return ThemeData(
      colorScheme: colorTheme.colorScheme,
      primaryColor: colorTheme.primaryColor,
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
      iconTheme: iconTheme,
      inputDecorationTheme: inputDecorationTheme,
      switchTheme: switchTheme,
      checkboxTheme: checkboxTheme,
      radioTheme: radioTheme,
      sliderTheme: sliderTheme,
      textTheme: GoogleFonts.getTextTheme(
        fontFamily,
        TextTheme(
          headline1: headline1TextStyle,
          headline2: headline2TextStyle,
          headline3: headline3TextStyle,
          headline4: headline4TextStyle,
          headline5: headline5TextStyle,
          headline6: headline6TextStyle,
          subtitle1: subtitle1TextStyle,
          subtitle2: subtitle2TextStyle,
          bodyText1: bodyText1TextStyle,
          bodyText2: bodyText2TextStyle,
          button: buttonTextStyle,
          caption: captionTextStyle,
          overline: overlineTextStyle,
        ),
      ),
    );
  }
}
