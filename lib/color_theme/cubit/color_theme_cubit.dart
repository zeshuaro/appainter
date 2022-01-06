import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:appainter/services/services.dart';

part 'color_theme_cubit.g.dart';
part 'color_theme_state.dart';

class ColorThemeCubit extends Cubit<ColorThemeState> {
  ColorThemeCubit() : super(ColorThemeState());

  void themeChanged(ThemeData theme) {
    emit(state.copyWith(
      colorScheme: theme.colorScheme,
      primaryColor: theme.primaryColor,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryColorLight: theme.primaryColorLight,
      primaryColorDark: theme.primaryColorDark,
      backgroundColor: theme.backgroundColor,
      bottomAppBarColor: theme.bottomAppBarColor,
      canvasColor: theme.canvasColor,
      cardColor: theme.cardColor,
      dialogBackgroundColor: theme.dialogBackgroundColor,
      disabledColor: theme.disabledColor,
      dividerColor: theme.dividerColor,
      errorColor: theme.errorColor,
      focusColor: theme.focusColor,
      highlightColor: theme.highlightColor,
      hintColor: theme.hintColor,
      hoverColor: theme.hoverColor,
      indicatorColor: theme.indicatorColor,
      scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
      secondaryHeaderColor: theme.secondaryHeaderColor,
      selectedRowColor: theme.selectedRowColor,
      shadowColor: theme.shadowColor,
      splashColor: theme.splashColor,
      toggleableActiveColor: theme.toggleableActiveColor,
      unselectedWidgetColor: theme.unselectedWidgetColor,
    ));
  }

  void primaryColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final primaryColorDark = swatch[700]!;
    final brightness = ThemeData.estimateBrightnessForColor(color);
    final onColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    emit(
      state.copyWith(
        colorScheme: ColorScheme.light(
          primary: color,
          primaryVariant: primaryColorDark,
          onPrimary: onColor,
          secondary: color,
          secondaryVariant: primaryColorDark,
          onSecondary: onColor,
        ),
        primaryColor: color,
        primaryColorBrightness: brightness,
        primaryColorLight: swatch[100],
        primaryColorDark: primaryColorDark,
        backgroundColor: swatch[200],
        indicatorColor: color,
        secondaryHeaderColor: swatch[50],
        toggleableActiveColor: swatch[600],
      ),
    );
  }

  void primaryColorBrightnessChanged(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    emit(state.copyWith(primaryColorBrightness: brightness));
  }

  void primaryColorLightChanged(Color color) {
    emit(state.copyWith(primaryColorLight: color));
  }

  void primaryColorDarkChanged(Color color) {
    emit(state.copyWith(primaryColorDark: color));
  }

  void backgroundColorChanged(Color color) {
    emit(state.copyWith(backgroundColor: color));
  }

  void bottomAppBarColorChanged(Color color) {
    emit(state.copyWith(bottomAppBarColor: color));
  }

  void canvasColorChanged(Color color) {
    emit(state.copyWith(canvasColor: color));
  }

  void cardColorChanged(Color color) {
    emit(state.copyWith(cardColor: color));
  }

  void dialogBackgroundColorChanged(Color color) {
    emit(state.copyWith(dialogBackgroundColor: color));
  }

  void disabledColorChanged(Color color) {
    emit(state.copyWith(disabledColor: color));
  }

  void dividerColorChanged(Color color) {
    emit(state.copyWith(dividerColor: color));
  }

  void errorColorChanged(Color color) {
    emit(state.copyWith(errorColor: color));
  }

  void focusColorChanged(Color color) {
    emit(state.copyWith(focusColor: color));
  }

  void highlightColorChanged(Color color) {
    emit(state.copyWith(highlightColor: color));
  }

  void hintColorChanged(Color color) {
    emit(state.copyWith(hintColor: color));
  }

  void hoverColorChanged(Color color) {
    emit(state.copyWith(hoverColor: color));
  }

  void indicatorColorChanged(Color color) {
    emit(state.copyWith(indicatorColor: color));
  }

  void scaffoldBackgroundColorChanged(Color color) {
    emit(state.copyWith(scaffoldBackgroundColor: color));
  }

  void secondaryHeaderColorChanged(Color color) {
    emit(state.copyWith(secondaryHeaderColor: color));
  }

  void selectedRowColorChanged(Color color) {
    emit(state.copyWith(selectedRowColor: color));
  }

  void shadowColorChanged(Color color) {
    emit(state.copyWith(shadowColor: color));
  }

  void splashColorChanged(Color color) {
    emit(state.copyWith(splashColor: color));
  }

  void toggleableActiveColorChanged(Color color) {
    emit(state.copyWith(toggleableActiveColor: color));
  }

  void unselectedWidgetColorChanged(Color color) {
    emit(state.copyWith(unselectedWidgetColor: color));
  }
}
