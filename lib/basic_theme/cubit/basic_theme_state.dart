part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final Color seedColor;
  final ColorScheme colorScheme;
  final bool isDark;
  final bool useMaterial3;

  BasicThemeState({
    Color? seedColor,
    ColorScheme? colorScheme,
    this.isDark = false,
    this.useMaterial3 = false,
  })  : seedColor = seedColor ?? defaultSeedColor,
        colorScheme = colorScheme ?? _colorSchemeLight;

  static const defaultSeedColor = Colors.blue;
  static final _colorSchemeLight = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
  );
  static final _colorSchemeDark = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
    brightness: Brightness.dark,
  );

  @override
  List<Object> get props => [seedColor, colorScheme, isDark, useMaterial3];

  static ColorScheme getColorScheme(bool isDark) {
    return isDark ? _colorSchemeDark : _colorSchemeLight;
  }

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme),
      Typography.englishLike2018,
    ).copyWith(useMaterial3: useMaterial3);
  }

  Brightness get brightness => isDark ? Brightness.dark : Brightness.light;
}
