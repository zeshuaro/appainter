part of 'bottom_navigation_bar_theme_cubit.dart';

@CopyWith()
class BottomNavigationBarThemeState extends Equatable {
  final BottomNavigationBarThemeData theme;

  const BottomNavigationBarThemeState({
    this.theme = const BottomNavigationBarThemeData(),
  });

  @override
  List<Object> get props => [theme];
}
