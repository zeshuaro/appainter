part of 'input_decoration_theme_cubit.dart';

@CopyWith()
class InputDecorationThemeState extends Equatable {
  final InputDecorationTheme theme;

  const InputDecorationThemeState({this.theme = const InputDecorationTheme()});

  factory InputDecorationThemeState.withTheme({
    int? helperMaxLines,
    int? errorMaxLines,
    FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
    bool isDense = false,
    bool isCollapsed = false,
    bool filled = false,
    Color? fillColor,
    Color? hoverColor,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? border,
    bool alignLabelWithHint = false,
  }) {
    return InputDecorationThemeState(
      theme: InputDecorationTheme(
        fillColor: fillColor,
        hoverColor: hoverColor,
        alignLabelWithHint: alignLabelWithHint,
        filled: filled,
        isCollapsed: isCollapsed,
        isDense: isDense,
        errorMaxLines: errorMaxLines,
        helperMaxLines: helperMaxLines,
        floatingLabelBehavior: floatingLabelBehavior,
        border: border,
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        errorBorder: errorBorder,
      ),
    );
  }

  @override
  List<Object> get props => [theme];
}
