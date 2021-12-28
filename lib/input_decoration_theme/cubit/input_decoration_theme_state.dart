part of 'input_decoration_theme_cubit.dart';

@CopyWith()
class InputDecorationThemeState extends Equatable {
  final InputDecorationTheme theme;

  const InputDecorationThemeState({this.theme = const InputDecorationTheme()});

  @override
  List<Object> get props => [theme];
}
