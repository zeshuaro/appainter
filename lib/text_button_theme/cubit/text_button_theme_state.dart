part of 'text_button_theme_cubit.dart';

@CopyWith()
class TextButtonThemeState extends Equatable {
  final TextButtonThemeData theme;

  const TextButtonThemeState({this.theme = const TextButtonThemeData()});

  @override
  List<Object> get props => [theme];
}
