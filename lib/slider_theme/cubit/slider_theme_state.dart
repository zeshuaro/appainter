part of 'slider_theme_cubit.dart';

@CopyWith()
class SliderThemeState extends Equatable {
  final SliderThemeData theme;

  const SliderThemeState({this.theme = const SliderThemeData()});

  factory SliderThemeState.withTheme({
    double? trackHeight,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? disabledActiveTrackColor,
    Color? disabledInactiveTrackColor,
    Color? activeTickMarkColor,
    Color? inactiveTickMarkColor,
    Color? disabledActiveTickMarkColor,
    Color? disabledInactiveTickMarkColor,
    Color? thumbColor,
    Color? overlappingShapeStrokeColor,
    Color? disabledThumbColor,
    Color? overlayColor,
    Color? valueIndicatorColor,
  }) {
    return SliderThemeState(
      theme: SliderThemeData(
        trackHeight: trackHeight,
        activeTrackColor: activeTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        disabledActiveTrackColor: disabledActiveTrackColor,
        disabledInactiveTrackColor: disabledInactiveTrackColor,
        activeTickMarkColor: activeTickMarkColor,
        inactiveTickMarkColor: inactiveTickMarkColor,
        disabledActiveTickMarkColor: disabledActiveTickMarkColor,
        disabledInactiveTickMarkColor: disabledInactiveTickMarkColor,
        thumbColor: thumbColor,
        disabledThumbColor: disabledThumbColor,
        overlappingShapeStrokeColor: overlappingShapeStrokeColor,
        overlayColor: overlayColor,
        valueIndicatorColor: valueIndicatorColor,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
