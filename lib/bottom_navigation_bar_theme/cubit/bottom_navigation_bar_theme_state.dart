part of 'bottom_navigation_bar_theme_cubit.dart';

@CopyWith()
@immutable
class BottomNavigationBarThemeState extends Equatable {
  const BottomNavigationBarThemeState({
    this.theme = const BottomNavigationBarThemeData(),
  });

  factory BottomNavigationBarThemeState.withThemeData({
    Color? backgroundColor,
    double? elevation,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    bool? showSelectedLabels,
    bool? showUnselectedLabels,
    BottomNavigationBarType? type,
  }) {
    return BottomNavigationBarThemeState(
      theme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        elevation: elevation,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        showSelectedLabels: showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels,
        type: type,
      ),
    );
  }

  final BottomNavigationBarThemeData theme;

  @override
  List<Object> get props => [theme];
}
