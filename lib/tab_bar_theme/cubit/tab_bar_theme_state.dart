part of 'tab_bar_theme_cubit.dart';

@CopyWith()
@immutable
class TabBarThemeState extends Equatable {
  final TabBarThemeData theme;

  const TabBarThemeState({this.theme = const TabBarThemeData()});

  factory TabBarThemeState.withTheme({
    TabBarIndicatorSize? indicatorSize,
    Color? labelColor,
    Color? unselectedLabelColor,
  }) {
    return TabBarThemeState(
      theme: TabBarThemeData(
        labelColor: labelColor,
        unselectedLabelColor: unselectedLabelColor,
        indicatorSize: indicatorSize,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
