part of 'slider_theme_cubit.dart';

@CopyWith()
class SliderThemeState extends Equatable {
  final SliderThemeData theme;

  const SliderThemeState({this.theme = const SliderThemeData()});

  @override
  List<Object> get props => [theme];
}
