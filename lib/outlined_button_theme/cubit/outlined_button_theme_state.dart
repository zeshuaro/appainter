part of 'outlined_button_theme_cubit.dart';

@CopyWith()
class OutlinedButtonThemeState extends Equatable {
  final OutlinedButtonThemeData theme;

  const OutlinedButtonThemeState({
    this.theme = const OutlinedButtonThemeData(),
  });

  @override
  List<Object> get props => [theme];
}
