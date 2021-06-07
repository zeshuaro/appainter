part of 'app_bar_editor.dart';

// ignore: unused_element
class _TitleTextStyleEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.textTheme?.headline6 !=
            current.themeData.appBarTheme.textTheme?.headline6;
      },
      builder: (context, state) {
        final textStyle = state.themeData.appBarTheme.textTheme?.headline6;
        final appTextStyle = state.themeData.textTheme.headline6!;

        return TextStyleCard(
          headerKey: 'Title',
          color: textStyle?.color ?? state.themeData.colorScheme.onPrimary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleColorChanged(color);
          },
          backgroundColor: textStyle?.backgroundColor ?? Colors.transparent,
          onBackgroundColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleBackgroundColorChanged(color);
          },
          fontWeight: textStyle?.fontWeight ?? appTextStyle.fontWeight!,
          onFontWeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleFontWeightChanged(value!);
          },
          fontStyle: textStyle?.fontStyle ?? FontStyle.normal,
          onFontStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleFontStyleChanged(value!);
          },
          fontSize: textStyle?.fontSize ?? appTextStyle.fontSize!,
          onFontSizeChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleFontSizeChanged(value);
          },
          height: textStyle?.height ?? kTextStyleHeight,
          onHeightChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleHeightChanged(value);
          },
          wordSpacing: textStyle?.wordSpacing ?? kTextStyleWordSpacing,
          onWordSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleWordSpacingChanged(value);
          },
          letterSpacing: textStyle?.letterSpacing ?? kTextStyleLetterSpacing,
          onLetterSpacingChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleLetterSpacingChanged(value);
          },
          decoration: textStyle?.decoration ?? appTextStyle.decoration!,
          onDecorationChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleDecorationChanged(value!);
          },
          decorationColor: textStyle?.decorationColor ??
              state.themeData.colorScheme.onPrimary,
          onDecorationColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleDecorationColorChanged(color);
          },
          decorationStyle:
              textStyle?.decorationStyle ?? TextDecorationStyle.solid,
          onDecorationStyleChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleDecorationStyleChanged(value!);
          },
          decorationThickness:
              textStyle?.decorationThickness ?? kTextDecorationThickness,
          onDecorationThicknessChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarTitleTextStyleDecorationThicknessChanged(value);
          },
        );
      },
    );
  }
}
