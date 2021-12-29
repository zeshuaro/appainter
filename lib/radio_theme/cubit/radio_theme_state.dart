part of 'radio_theme_cubit.dart';

@CopyWith()
class RadioThemeState extends Equatable {
  final RadioThemeData theme;

  const RadioThemeState({this.theme = const RadioThemeData()});

  @override
  List<Object> get props => [theme];
}
