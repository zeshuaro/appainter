part of 'floating_action_button_theme_cubit.dart';

@CopyWith()
class FloatingActionButtonThemeState extends Equatable {
  final FloatingActionButtonThemeData theme;

  const FloatingActionButtonThemeState({
    this.theme = const FloatingActionButtonThemeData(),
  });

  @override
  List<Object> get props => [theme];
}
