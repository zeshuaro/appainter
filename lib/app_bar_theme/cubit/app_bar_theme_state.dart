part of 'app_bar_theme_cubit.dart';

@CopyWith()
class AppBarThemeState extends Equatable {
  final AppBarThemeData theme;

  const AppBarThemeState({this.theme = const AppBarThemeData()});

  factory AppBarThemeState.withTheme({
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    Color? shadowColor,
    bool? centerTitle,
    double? titleSpacing,
    double? toolbarHeight,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) {
    return AppBarThemeState(
      theme: AppBarThemeData(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
        toolbarHeight: toolbarHeight,
        systemOverlayStyle: systemUiOverlayStyle,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
