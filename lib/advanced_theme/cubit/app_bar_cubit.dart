part of 'advanced_theme_cubit.dart';

extension AppBarCubit on AdvancedThemeCubit {
  void appBarBackgroundColorChanged(Color color) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      backgroundColor: color,
    );
    _emitWithAppBarTheme(appBarTheme);
  }

  void appBarForegroundColorChanged(Color color) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      foregroundColor: color,
    );
    _emitWithAppBarTheme(appBarTheme);
  }

  void appBarElevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        elevation: elevation,
      );
      _emitWithAppBarTheme(appBarTheme);
    }
  }

  void appBarShadowColorChanged(Color color) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      shadowColor: color,
    );
    _emitWithAppBarTheme(appBarTheme);
  }

  void appBarCenterTitleChanged(bool isCenter) {
    final appBarTheme = state.themeData.appBarTheme.copyWith(
      centerTitle: isCenter,
    );
    _emitWithAppBarTheme(appBarTheme);
  }

  void appBarTitleSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        titleSpacing: spacing,
      );
      _emitWithAppBarTheme(appBarTheme);
    }
  }

  void appBarToolBarHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        toolbarHeight: height,
      );
      _emitWithAppBarTheme(appBarTheme);
    }
  }

  void appBarSystemUiOverlayStyleChanged(String value) {
    final style = MySystemUiOverlayStyle().enumFromString(value);
    if (style != null) {
      final appBarTheme = state.themeData.appBarTheme.copyWith(
        systemOverlayStyle: style,
      );
      _emitWithAppBarTheme(appBarTheme);
    }
  }

  void _emitWithAppBarTheme(AppBarTheme appBarTheme) {
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(appBarTheme: appBarTheme),
      ),
    );
  }
}
