part of 'bottom_nav_bar_editor.dart';

// ignore: unused_element
class _SelectedIconThemeEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.bottomNavigationBarTheme.selectedIconTheme !=
            current.themeData.bottomNavigationBarTheme.selectedIconTheme;
      },
      builder: (context, state) {
        final iconTheme =
            state.themeData.bottomNavigationBarTheme.selectedIconTheme;
        return IconThemeCard(
          headerKey: 'Selected',
          color: iconTheme?.color ?? state.themeData.primaryColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarSelectedIconThemeColorChanged(color);
          },
          size: iconTheme?.size ?? kIconThemeSize,
          onSizeChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarSelectedIconThemeSizeChanged(value);
          },
          opacity: iconTheme?.opacity ?? kIconThemeOpacity,
          onOpacityChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarSelectedIconThemeOpacityChanged(value);
          },
        );
      },
    );
  }
}

// ignore: unused_element
class _UnselectedIconThemeEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous
                .themeData.bottomNavigationBarTheme.unselectedIconTheme !=
            current.themeData.bottomNavigationBarTheme.unselectedIconTheme;
      },
      builder: (context, state) {
        final iconTheme =
            state.themeData.bottomNavigationBarTheme.unselectedIconTheme;
        return IconThemeCard(
          headerKey: 'Unselected',
          color: iconTheme?.color ?? state.themeData.unselectedWidgetColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarUnselectedIconThemeColorChanged(color);
          },
          size: iconTheme?.size ?? kIconThemeSize,
          onSizeChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarUnselectedIconThemeSizeChanged(value);
          },
          opacity: iconTheme?.opacity ?? kIconThemeOpacity,
          onOpacityChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .bottomNavBarUnselectedIconThemeOpacityChanged(value);
          },
        );
      },
    );
  }
}
