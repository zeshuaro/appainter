part of 'text_button_theme_cubit.dart';

@CopyWith()
@immutable
class TextButtonThemeState extends Equatable {
  final TextButtonThemeData theme;

  const TextButtonThemeState({this.theme = const TextButtonThemeData()});

  factory TextButtonThemeState.withTheme({
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<double?>? elevation,
  }) {
    return TextButtonThemeState(
      theme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          overlayColor: overlayColor,
          shadowColor: shadowColor,
          elevation: elevation,
        ),
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
