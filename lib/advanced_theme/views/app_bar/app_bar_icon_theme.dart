part of 'app_bar_editor.dart';

// ignore: unused_element
class _IconThemeEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.iconTheme !=
            current.themeData.appBarTheme.iconTheme;
      },
      builder: (context, state) {
        final iconTheme = state.themeData.appBarTheme.iconTheme;
        return IconThemeCard(
          color: iconTheme?.color ?? state.themeData.colorScheme.onPrimary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarIconThemeColorChanged(color);
          },
          size: iconTheme?.size ?? kIconThemeSize,
          onSizeChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarIconThemeSizeChanged(value);
          },
          opacity: iconTheme?.opacity ?? kIconThemeOpacity,
          onOpacityChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarIconThemeOpacityChanged(value);
          },
        );
      },
    );
  }
}
