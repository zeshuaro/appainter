import 'package:flutter/material.dart';
import 'package:flutter_theme/services/services.dart';

import 'advanced_theme_cubit.dart';

extension ColorCubit on AdvancedThemeCubit {
  void primaryColorChanged(Color color) {
    final swatch = UtilService.getColorSwatch(color);
    final primaryColorBrightness = ThemeData.estimateBrightnessForColor(color);
    final appBarTheme = state.themeData.appBarTheme.copyWith(color: color);

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          primaryColor: color,
          primaryColorBrightness: primaryColorBrightness,
          primaryColorLight: swatch[100],
          primaryColorDark: swatch[700],
          accentColor: color,
          accentColorBrightness: primaryColorBrightness,
          backgroundColor: swatch[200],
          indicatorColor: color,
          secondaryHeaderColor: swatch[50],
          toggleableActiveColor: swatch[600],
          appBarTheme: appBarTheme,
        ),
      ),
    );
  }

  void primaryColorBrightnessChanged(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(primaryColorBrightness: brightness),
      ),
    );
  }

  void primaryColorLightChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(primaryColorLight: color),
      ),
    );
  }

  void primaryColorDarkChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(primaryColorDark: color),
      ),
    );
  }

  void accentColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          accentColor: color,
          accentColorBrightness: ThemeData.estimateBrightnessForColor(color),
        ),
      ),
    );
  }

  void accentColorBrightnessChanged(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(accentColorBrightness: brightness),
      ),
    );
  }

  void bgColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(backgroundColor: color),
      ),
    );
  }

  void bottomAppBarColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(bottomAppBarColor: color),
      ),
    );
  }

  void canvasColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(canvasColor: color),
      ),
    );
  }

  void cardColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(cardColor: color),
      ),
    );
  }

  void dialogBgColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(dialogBackgroundColor: color),
      ),
    );
  }

  void disabledColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(disabledColor: color),
      ),
    );
  }

  void dividerColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(dividerColor: color),
      ),
    );
  }

  void errorColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(errorColor: color),
      ),
    );
  }

  void focusColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(focusColor: color),
      ),
    );
  }

  void highlightColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(highlightColor: color),
      ),
    );
  }

  void hintColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(hintColor: color),
      ),
    );
  }

  void hoverColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(hoverColor: color),
      ),
    );
  }

  void indicatorColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(indicatorColor: color),
      ),
    );
  }

  void scaffoldBgColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(scaffoldBackgroundColor: color),
      ),
    );
  }

  void secondaryHeaderColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(secondaryHeaderColor: color),
      ),
    );
  }

  void selectedRowColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(selectedRowColor: color),
      ),
    );
  }

  void shadowColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(shadowColor: color),
      ),
    );
  }

  void splashColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(splashColor: color),
      ),
    );
  }

  void toggleableActiveColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(toggleableActiveColor: color),
      ),
    );
  }

  void unselectedWidgetColorChanged(Color color) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(unselectedWidgetColor: color),
      ),
    );
  }
}
