part of 'tab_bar_theme_cubit.dart';

@CopyWith()
class TabBarThemeState extends Equatable {
  final TabBarTheme theme;

  const TabBarThemeState({this.theme = const TabBarTheme()});

  @override
  List<Object> get props => [theme];
}
