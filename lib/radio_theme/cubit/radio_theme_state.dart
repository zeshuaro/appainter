part of 'radio_theme_cubit.dart';

@CopyWith()
@immutable
class RadioThemeState extends Equatable {
  final RadioThemeData theme;

  const RadioThemeState({this.theme = const RadioThemeData()});

  factory RadioThemeState.withTheme({
    WidgetStateProperty<Color?>? fillColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
  }) {
    return RadioThemeState(
      theme: RadioThemeData(
        fillColor: fillColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        materialTapTargetSize: materialTapTargetSize,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
