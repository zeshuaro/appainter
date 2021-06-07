part of 'bottom_nav_bar_cubit.dart';

extension BottomNavBarIconThemeCubit on AdvancedThemeCubit {
  void bottomNavBarSelectedIconThemeColorChanged(Color color) {
    final iconTheme = _getBottomNavBarSelectedIconTheme().copyWith(
      color: color,
    );
    _emitStateWithBottomNavBarSelectedIconTheme(iconTheme);
  }

  void bottomNavBarSelectedIconThemeSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final iconTheme = _getBottomNavBarSelectedIconTheme().copyWith(
        size: size,
      );
      _emitStateWithBottomNavBarSelectedIconTheme(iconTheme);
    }
  }

  void bottomNavBarSelectedIconThemeOpacityChanged(String value) {
    final opacity = double.tryParse(value);
    if (opacity != null) {
      final iconTheme = _getBottomNavBarSelectedIconTheme().copyWith(
        opacity: opacity,
      );
      _emitStateWithBottomNavBarSelectedIconTheme(iconTheme);
    }
  }

  void bottomNavBarUnselectedIconThemeColorChanged(Color color) {
    final iconTheme = _getBottomNavBarUnselectedIconTheme().copyWith(
      color: color,
    );
    _emitStateWithBottomNavBarUnselectedIconTheme(iconTheme);
  }

  void bottomNavBarUnselectedIconThemeSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final iconTheme = _getBottomNavBarUnselectedIconTheme().copyWith(
        size: size,
      );
      _emitStateWithBottomNavBarUnselectedIconTheme(iconTheme);
    }
  }

  void bottomNavBarUnselectedIconThemeOpacityChanged(String value) {
    final opacity = double.tryParse(value);
    if (opacity != null) {
      final iconTheme = _getBottomNavBarUnselectedIconTheme().copyWith(
        opacity: opacity,
      );
      _emitStateWithBottomNavBarUnselectedIconTheme(iconTheme);
    }
  }

  void _emitStateWithBottomNavBarSelectedIconTheme(IconThemeData iconTheme) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      selectedIconTheme: iconTheme,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  void _emitStateWithBottomNavBarUnselectedIconTheme(IconThemeData iconTheme) {
    final theme = state.themeData.bottomNavigationBarTheme.copyWith(
      unselectedIconTheme: iconTheme,
    );
    _emitStateWithBottomNavBarTheme(theme);
  }

  IconThemeData _getBottomNavBarSelectedIconTheme() {
    return state.themeData.bottomNavigationBarTheme.selectedIconTheme ??
        state.themeData.iconTheme;
  }

  IconThemeData _getBottomNavBarUnselectedIconTheme() {
    return state.themeData.bottomNavigationBarTheme.unselectedIconTheme ??
        state.themeData.iconTheme.copyWith(
          color: state.themeData.unselectedWidgetColor,
        );
  }
}
