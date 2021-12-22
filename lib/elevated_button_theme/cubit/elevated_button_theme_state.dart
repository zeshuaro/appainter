part of 'elevated_button_theme_cubit.dart';

@CopyWith()
class ElevatedButtonThemeState extends Equatable {
  final ElevatedButtonThemeData theme;

  const ElevatedButtonThemeState({
    this.theme = const ElevatedButtonThemeData(),
  });

  @override
  List<Object> get props => [theme];
}
