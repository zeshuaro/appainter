import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/services/services.dart';

part 'color_theme_cubit.g.dart';
part 'color_theme_state.dart';

class ColorThemeCubit extends Cubit<ColorThemeState> {
  ColorThemeCubit() : super(ColorThemeState.defaultState());

  void themeChanged(ThemeData themeData) {
    emit(state.copyWith(
      primaryColor: themeData.primaryColor,
      primaryColorBrightness: themeData.primaryColorBrightness,
      primaryColorLight: themeData.primaryColorLight,
      primaryColorDark: themeData.primaryColorDark,
      backgroundColor: themeData.backgroundColor,
      bottomAppBarColor: themeData.bottomAppBarColor,
      canvasColor: themeData.canvasColor,
      cardColor: themeData.cardColor,
      dialogBackgroundColor: themeData.dialogBackgroundColor,
      disabledColor: themeData.disabledColor,
      dividerColor: themeData.dividerColor,
      errorColor: themeData.errorColor,
      focusColor: themeData.focusColor,
      highlightColor: themeData.highlightColor,
      hintColor: themeData.hintColor,
      hoverColor: themeData.hoverColor,
      indicatorColor: themeData.indicatorColor,
      scaffoldBackgroundColor: themeData.scaffoldBackgroundColor,
      secondaryHeaderColor: themeData.secondaryHeaderColor,
      selectedRowColor: themeData.selectedRowColor,
      shadowColor: themeData.shadowColor,
      splashColor: themeData.splashColor,
      toggleableActiveColor: themeData.toggleableActiveColor,
      unselectedWidgetColor: themeData.unselectedWidgetColor,
    ));
  }

  void primaryColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final backgroundColor = swatch[200]!;
    final brightness = ThemeData.estimateBrightnessForColor(color);

    emit(
      state.copyWith(
        primaryColor: color,
        primaryColorBrightness: brightness,
        primaryColorLight: swatch[100],
        primaryColorDark: swatch[700],
        backgroundColor: backgroundColor,
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
