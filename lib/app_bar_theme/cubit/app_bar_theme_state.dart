part of 'app_bar_theme_cubit.dart';

@CopyWith()
class AppBarThemeState extends Equatable {
  final AppBarTheme theme;

  const AppBarThemeState({this.theme = const AppBarTheme()});

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
      theme: AppBarTheme(
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
