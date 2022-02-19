part of 'simple_theme_cubit.dart';

@CopyWith()
class SimpleThemeState extends Equatable {
  final Color seedColor;
  final ColorScheme colorScheme;
  final bool isDark;

  SimpleThemeState({
    Color? seedColor,
    ColorScheme? colorScheme,
    bool? isDark,
  })  : seedColor = seedColor ?? defaultSeedColor,
        colorScheme = colorScheme ?? _colorSchemeLight,
        isDark = isDark ?? false;

  static const defaultSeedColor = Colors.blue;
  static final _colorSchemeLight = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
  );
  static final _colorSchemeDark = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
    brightness: Brightness.dark,
  );

  static ColorScheme getColorScheme({required bool isDark}) {
    return isDark ? _colorSchemeDark : _colorSchemeLight;
  }

  @override
  List<Object> get props => [seedColor, colorScheme, isDark];

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme),
      Typography.englishLike2018,
    );
  }

  Brightness get brightness => isDark ? Brightness.dark : Brightness.light;
}
