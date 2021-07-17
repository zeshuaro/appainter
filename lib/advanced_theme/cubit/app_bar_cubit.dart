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

  void _emitStateWithAppBarTheme(AppBarTheme appBarTheme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(appBarTheme: appBarTheme),
      ),
    );
  }
}
