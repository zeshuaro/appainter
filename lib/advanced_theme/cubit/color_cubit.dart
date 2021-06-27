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
    final theme = ThemeData(primaryColorBrightness: brightness);

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          primaryColorBrightness: brightness,
          primaryIconTheme: theme.primaryIconTheme,
          primaryTextTheme: theme.primaryTextTheme,
        ),
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
    final colorScheme = state.themeData.colorScheme.copyWith(
      primaryVariant: color,
    );
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      colorScheme: colorScheme,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          primaryColorDark: color,
          buttonTheme: buttonTheme,
          colorScheme: colorScheme,
        ),
      ),
    );
  }

  void accentColorChanged(Color color) {
    final colorScheme = state.themeData.colorScheme.copyWith(
      secondary: color,
    );
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      colorScheme: colorScheme,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          accentColor: color,
          accentColorBrightness: ThemeData.estimateBrightnessForColor(color),
          buttonTheme: buttonTheme,
          colorScheme: colorScheme,
          indicatorColor: color,
          toggleableActiveColor: color,
        ),
      ),
    );
  }

  void accentColorBrightnessChanged(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(accentColorBrightness: brightness);

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          accentColorBrightness: brightness,
          accentIconTheme: theme.accentIconTheme,
          accentTextTheme: theme.accentTextTheme,
        ),
      ),
    );
  }

  void bgColorChanged(Color color) {
    final colorScheme = state.themeData.colorScheme.copyWith(
      background: color,
    );
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      colorScheme: colorScheme,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          backgroundColor: color,
          buttonTheme: buttonTheme,
          colorScheme: colorScheme,
        ),
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
        themeData: state.themeData.copyWith(
          canvasColor: color,
          scaffoldBackgroundColor: color,
        ),
      ),
    );
  }

  void cardColorChanged(Color color) {
    final colorScheme = state.themeData.colorScheme.copyWith(
      surface: color,
    );
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      colorScheme: colorScheme,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          cardColor: color,
          buttonTheme: buttonTheme,
          colorScheme: colorScheme,
        ),
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
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      disabledColor: color,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          disabledColor: color,
          buttonTheme: buttonTheme,
        ),
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
    final colorScheme = state.themeData.colorScheme.copyWith(
      error: color,
    );
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      colorScheme: colorScheme,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          errorColor: color,
          buttonTheme: buttonTheme,
          colorScheme: colorScheme,
        ),
      ),
    );
  }

  void focusColorChanged(Color color) {
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      focusColor: color,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          focusColor: color,
          buttonTheme: buttonTheme,
        ),
      ),
    );
  }

  void highlightColorChanged(Color color) {
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      highlightColor: color,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          highlightColor: color,
          buttonTheme: buttonTheme,
        ),
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
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      hoverColor: color,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          hoverColor: color,
          buttonTheme: buttonTheme,
        ),
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
    final buttonTheme = state.themeData.buttonTheme.copyWith(
      splashColor: color,
    );

    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(
          splashColor: color,
          buttonTheme: buttonTheme,
        ),
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
