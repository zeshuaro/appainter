part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final ColorScheme colorScheme;
  final bool isDark;

  BasicThemeState({
    ColorScheme? colorScheme,
    this.isDark = false,
  }) : colorScheme = colorScheme ?? _colorSchemeLight;

  static const _seedColor = Colors.blue;
  static final _colorSchemeLight = ColorScheme.fromSeed(
    seedColor: _seedColor,
    primary: _seedColor,
  );
  static final _colorSchemeDark = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
    primary: _seedColor,
  );

  @override
  List<Object> get props => [colorScheme, isDark];

  static ColorScheme getColorScheme(bool isDark) {
    return isDark ? _colorSchemeDark : _colorSchemeLight;
  }

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme),
      Typography.englishLike2018,
    );
  }

  Brightness get brightness => isDark ? Brightness.dark : Brightness.light;
}
