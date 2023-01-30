part of 'abstract_icon_theme_cubit.dart';

@CopyWith()
class IconThemeState extends Equatable {
  final IconThemeData theme;

  const IconThemeState({this.theme = const IconThemeData()});

  factory IconThemeState.withThemeData({
    Color? color,
    double? size,
    double? opacity,
  }) {
    return IconThemeState(
      theme: IconThemeData(color: color, size: size, opacity: opacity),
    );
  }

  @override
  List<Object> get props => [theme];
}
