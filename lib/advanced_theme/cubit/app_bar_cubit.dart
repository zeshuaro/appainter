part of 'advanced_theme_cubit.dart';

extension AppBarCubit on AdvancedThemeCubit {
  void appBarColorChanged(Color color) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(color: color);
    _emitStateWithAppBarTheme(appBarTheme);
  }

  void appBarShadowColorChanged(Color color) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      shadowColor: color,
    );
    _emitStateWithAppBarTheme(appBarTheme);
  }

  void appBarBrightnessChanged(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      brightness: brightness,
    );
    _emitStateWithAppBarTheme(appBarTheme);
  }

  void appBarCenterTitleChanged(bool isCenter) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      centerTitle: isCenter,
    );
    _emitStateWithAppBarTheme(appBarTheme);
  }

  void appBarElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        elevation: elevation,
      );
      _emitStateWithAppBarTheme(appBarTheme);
    }
  }

  void appBarTitleSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        titleSpacing: spacing,
      );
      _emitStateWithAppBarTheme(appBarTheme);
    }
  }

  void appBarIconThemeColorChanged(Color color) {
    final iconTheme = _getAppBarIconTheme().copyWith(color: color);
    _emitStateWithAppBarIconTheme(iconTheme);
  }

  void appBarIconThemeSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final iconTheme = _getAppBarIconTheme().copyWith(size: size);
      _emitStateWithAppBarIconTheme(iconTheme);
    }
  }

  void appBarIconThemeOpacityChanged(String value) {
    final opacity = double.tryParse(value);
    if (opacity != null) {
      final iconTheme = _getAppBarIconTheme().copyWith(opacity: opacity);
      _emitStateWithAppBarIconTheme(iconTheme);
    }
  }

  void appBarTitleTextStyleColorChanged(Color color) {
    final textStyle = _getAppBarTitleTextStyle().copyWith(color: color);
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleBackgroundColorChanged(Color color) {
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      backgroundColor: color,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleFontWeightChanged(String value) {
    final fontWeight = MyFontWeight().enumFromString(value);
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      fontWeight: fontWeight,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleFontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      fontStyle: fontStyle,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleFontSizeChanged(String value) {
    final fontSize = double.tryParse(value);
    if (fontSize != null) {
      final textStyle = _getAppBarTitleTextStyle().copyWith(
        fontSize: fontSize,
      );
      _emitStateWithAppBarTitleTextStyle(textStyle);
    }
  }

  void appBarTitleTextStyleHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final textStyle = _getAppBarTitleTextStyle().copyWith(
        height: height,
      );
      _emitStateWithAppBarTitleTextStyle(textStyle);
    }
  }

  void appBarTitleTextStyleWordSpacingChanged(String value) {
    final wordSpacing = double.tryParse(value);
    if (wordSpacing != null) {
      final textStyle = _getAppBarTitleTextStyle().copyWith(
        wordSpacing: wordSpacing,
      );
      _emitStateWithAppBarTitleTextStyle(textStyle);
    }
  }

  void appBarTitleTextStyleLetterSpacingChanged(String value) {
    final letterSpacing = double.tryParse(value);
    if (letterSpacing != null) {
      final textStyle = _getAppBarTitleTextStyle().copyWith(
        letterSpacing: letterSpacing,
      );
      _emitStateWithAppBarTitleTextStyle(textStyle);
    }
  }

  void appBarTitleTextStyleDecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      decoration: decoration,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleDecorationColorChanged(Color color) {
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      decorationColor: color,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleDecorationStyleChanged(String value) {
    final textDecorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    final textStyle = _getAppBarTitleTextStyle().copyWith(
      decorationStyle: textDecorationStyle,
    );
    _emitStateWithAppBarTitleTextStyle(textStyle);
  }

  void appBarTitleTextStyleDecorationThicknessChanged(String value) {
    final decorationThickness = double.tryParse(value);
    if (decorationThickness != null) {
      final textStyle = _getAppBarTitleTextStyle().copyWith(
        decorationThickness: decorationThickness,
      );
      _emitStateWithAppBarTitleTextStyle(textStyle);
    }
  }

  void _emitStateWithAppBarTheme(AppBarTheme appBarTheme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(appBarTheme: appBarTheme),
      ),
    );
  }

  void _emitStateWithAppBarIconTheme(IconThemeData iconTheme) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      iconTheme: iconTheme,
    );
    _emitStateWithAppBarTheme(appBarTheme);
  }

  void _emitStateWithAppBarTitleTextStyle(TextStyle textStyle) {
    final textTheme = _getAppBarTextTheme().copyWith(headline6: textStyle);
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      textTheme: textTheme,
    );
    _emitStateWithAppBarTheme(appBarTheme);
  }

  IconThemeData _getAppBarIconTheme() {
    return state.themeData.appBarTheme.iconTheme ?? state.themeData.iconTheme;
  }

  TextTheme _getAppBarTextTheme() {
    return state.themeData.appBarTheme.textTheme ?? state.themeData.textTheme;
  }

  TextStyle _getAppBarTitleTextStyle() {
    return state.themeData.appBarTheme.textTheme?.headline6 ??
        state.themeData.primaryTextTheme.headline6!;
  }
}
