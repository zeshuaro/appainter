part of 'icon_theme_cubit.dart';

@CopyWith()
class IconThemeState extends Equatable {
  final IconThemeData theme;

  const IconThemeState({this.theme = const IconThemeData()});

  @override
  List<Object> get props => [theme];
}
