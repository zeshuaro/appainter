part of 'app_bar_theme_cubit.dart';

@CopyWith()
class AppBarThemeState extends Equatable {
  final AppBarTheme theme;

  const AppBarThemeState({this.theme = const AppBarTheme()});

  @override
  List<Object> get props => [theme];
}
