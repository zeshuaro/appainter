part of 'outlined_button_theme_cubit.dart';

@CopyWith()
@immutable
class OutlinedButtonThemeState extends Equatable {
  final OutlinedButtonThemeData theme;

  const OutlinedButtonThemeState({
    this.theme = const OutlinedButtonThemeData(),
  });

  factory OutlinedButtonThemeState.withTheme({
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<double?>? elevation,
  }) {
    return OutlinedButtonThemeState(
      theme: OutlinedButtonThemeData(
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
