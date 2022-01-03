part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final ColorScheme colorScheme;
  final bool isDark;

  const BasicThemeState({
    this.colorScheme = const ColorScheme.light(),
    this.isDark = false,
  });

  @override
  List<Object> get props => [colorScheme, isDark];

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme),
      Typography.englishLike2018,
    );
  }
}
