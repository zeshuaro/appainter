part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final ColorScheme colorScheme;

  const BasicThemeState({this.colorScheme = const ColorScheme.light()});

  @override
  List<Object> get props => [colorScheme];

  ThemeData get theme {
    return ThemeData.localize(
      ThemeData.from(colorScheme: colorScheme),
      Typography.englishLike2018,
    );
  }
}
