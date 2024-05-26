part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  static const defaultSeedColor = Colors.blue;
  static final _colorSchemeLight = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
  );
  static final _colorSchemeDark = ColorScheme.fromSeed(
    seedColor: defaultSeedColor,
    brightness: Brightness.dark,
  );

  BasicThemeState({
    Color? seedColor,
    ColorScheme? colorScheme,
    this.isDark = false,
    this.useMaterial3 = true,
  })  : seedColor = seedColor ?? defaultSeedColor,
        colorScheme = colorScheme ?? _colorSchemeLight;

  factory BasicThemeState.withColorScheme({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceContainerHighest,
    Color? onSurfaceVariant,
    Color? outline,
    Color? shadow,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
  }) {
    return BasicThemeState(
      colorScheme: _colorSchemeLight.copyWith(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        shadow: shadow,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        inversePrimary: inversePrimary,
      ),
    );
  }

  final Color seedColor;
  final ColorScheme colorScheme;
  final bool isDark;
  final bool useMaterial3;

  @override
  List<Object> get props => [seedColor, colorScheme, isDark, useMaterial3];

  static ColorScheme getColorScheme(bool isDark) {
    return isDark ? _colorSchemeDark : _colorSchemeLight;
  }

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(
        colorScheme: colorScheme,
        useMaterial3: useMaterial3,
      ),
      Typography.englishLike2018,
    );
  }

  Brightness get brightness => isDark ? Brightness.dark : Brightness.light;
}
