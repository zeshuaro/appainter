part of 'floating_action_button_theme_cubit.dart';

@CopyWith()
class FloatingActionButtonThemeState extends Equatable {
  final FloatingActionButtonThemeData theme;

  const FloatingActionButtonThemeState({
    this.theme = const FloatingActionButtonThemeData(),
  });

  factory FloatingActionButtonThemeState.withTheme({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? focusColor,
    Color? hoverColor,
    Color? splashColor,
    double? elevation,
    double? focusElevation,
    double? hoverElevation,
    double? disabledElevation,
    double? highlightElevation,
  }) {
    return FloatingActionButtonThemeState(
      theme: FloatingActionButtonThemeData(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        elevation: elevation,
        disabledElevation: disabledElevation,
        focusElevation: focusElevation,
        highlightElevation: highlightElevation,
        hoverElevation: hoverElevation,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
