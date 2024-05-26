part of 'checkbox_theme_cubit.dart';

@CopyWith()
@immutable
class CheckboxThemeState extends Equatable {
  const CheckboxThemeState({this.theme = const CheckboxThemeData()});

  factory CheckboxThemeState.withTheme({
    WidgetStateProperty<Color?>? fillColor,
    WidgetStateProperty<Color?>? checkColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
  }) {
    return CheckboxThemeState(
      theme: CheckboxThemeData(
        fillColor: fillColor,
        checkColor: checkColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        materialTapTargetSize: materialTapTargetSize,
      ),
    );
  }

  final CheckboxThemeData theme;

  @override
  List<Object> get props => [theme];
}
