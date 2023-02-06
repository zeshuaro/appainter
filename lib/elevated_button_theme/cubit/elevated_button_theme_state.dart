part of 'elevated_button_theme_cubit.dart';

@CopyWith()
@immutable
class ElevatedButtonThemeState extends Equatable {
  final ElevatedButtonThemeData theme;

  const ElevatedButtonThemeState({
    this.theme = const ElevatedButtonThemeData(),
  });

  factory ElevatedButtonThemeState.withTheme({
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<double?>? elevation,
  }) {
    return ElevatedButtonThemeState(
      theme: ElevatedButtonThemeData(
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
