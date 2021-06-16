part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final ThemeData themeData;
  final ColorScheme colorScheme;

  BasicThemeState({
    this.colorScheme = const ColorScheme.light(),
    ThemeData? themeData,
  }) : themeData = themeData ?? ThemeData.from(colorScheme: colorScheme);

  @override
  List<Object> get props => [themeData, colorScheme];
}
