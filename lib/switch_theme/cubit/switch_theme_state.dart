part of 'switch_theme_cubit.dart';

@CopyWith()
class SwitchThemeState extends Equatable {
  final SwitchThemeData theme;

  const SwitchThemeState({this.theme = const SwitchThemeData()});

  @override
  List<Object> get props => [theme];
}
