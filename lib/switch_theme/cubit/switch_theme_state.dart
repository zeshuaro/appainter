part of 'switch_theme_cubit.dart';

@CopyWith()
@immutable
class SwitchThemeState extends Equatable {
  final SwitchThemeData theme;

  const SwitchThemeState({this.theme = const SwitchThemeData()});

  factory SwitchThemeState.withTheme({
    MaterialStateProperty<Color?>? thumbColor,
    MaterialStateProperty<Color?>? trackColor,
    MaterialStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
  }) {
    return SwitchThemeState(
      theme: SwitchThemeData(
        thumbColor: thumbColor,
        trackColor: trackColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        materialTapTargetSize: materialTapTargetSize,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
