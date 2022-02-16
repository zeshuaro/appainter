part of 'color_theme_cubit.dart';

@CopyWith()
class ColorThemeState extends Equatable {
  late final ColorScheme colorScheme;

  late final Color primaryColor;
  late final Color primaryColorLight;
  late final Color primaryColorDark;
  late final Color backgroundColor;
  late final Color bottomAppBarColor;
  late final Color canvasColor;
  late final Color cardColor;
  late final Color dialogBackgroundColor;
  late final Color disabledColor;
  late final Color dividerColor;
  late final Color errorColor;
  late final Color focusColor;
  late final Color highlightColor;
  late final Color hintColor;
  late final Color hoverColor;
  late final Color indicatorColor;
  late final Color scaffoldBackgroundColor;
  late final Color secondaryHeaderColor;
  late final Color selectedRowColor;
  late final Color shadowColor;
  late final Color splashColor;
  late final Color toggleableActiveColor;
  late final Color unselectedWidgetColor;

  ColorThemeState({
    ColorScheme? colorScheme,
    Color? primaryColor,
    Color? primaryColorLight,
    Color? primaryColorDark,
    Color? backgroundColor,
    Color? bottomAppBarColor,
    Color? canvasColor,
    Color? cardColor,
    Color? dialogBackgroundColor,
    Color? disabledColor,
    Color? dividerColor,
    Color? errorColor,
    Color? focusColor,
    Color? highlightColor,
    Color? hintColor,
    Color? hoverColor,
    Color? indicatorColor,
    Color? scaffoldBackgroundColor,
    Color? secondaryHeaderColor,
    Color? selectedRowColor,
    Color? shadowColor,
    Color? splashColor,
    Color? toggleableActiveColor,
    Color? unselectedWidgetColor,
  }) {
    final theme = ThemeData();
    this.colorScheme = colorScheme ?? theme.colorScheme;

    this.primaryColor = primaryColor ?? theme.primaryColor;
    this.primaryColorLight = primaryColorLight ?? theme.primaryColorLight;
    this.primaryColorDark = primaryColorDark ?? theme.primaryColorDark;
    this.backgroundColor = backgroundColor ?? theme.backgroundColor;
    this.bottomAppBarColor = bottomAppBarColor ?? theme.bottomAppBarColor;
    this.canvasColor = canvasColor ?? theme.canvasColor;
    this.cardColor = cardColor ?? theme.cardColor;
    this.dialogBackgroundColor =
        dialogBackgroundColor ?? theme.dialogBackgroundColor;
    this.disabledColor = disabledColor ?? theme.disabledColor;
    this.dividerColor = dividerColor ?? theme.dividerColor;
    this.errorColor = errorColor ?? theme.errorColor;
    this.focusColor = focusColor ?? theme.focusColor;
    this.highlightColor = highlightColor ?? theme.highlightColor;
    this.hintColor = hintColor ?? theme.hintColor;
    this.hoverColor = hoverColor ?? theme.hoverColor;
    this.indicatorColor = indicatorColor ?? theme.indicatorColor;
    this.scaffoldBackgroundColor =
        scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor;
    this.secondaryHeaderColor =
        secondaryHeaderColor ?? theme.secondaryHeaderColor;
    this.selectedRowColor = selectedRowColor ?? theme.selectedRowColor;
    this.shadowColor = shadowColor ?? theme.shadowColor;
    this.splashColor = splashColor ?? theme.splashColor;
    this.toggleableActiveColor =
        toggleableActiveColor ?? theme.toggleableActiveColor;
    this.unselectedWidgetColor =
        unselectedWidgetColor ?? theme.unselectedWidgetColor;
  }

  @override
  List<Object> get props {
    return [
      colorScheme,
      primaryColor,
      primaryColorLight,
      primaryColorDark,
      backgroundColor,
      bottomAppBarColor,
      canvasColor,
      cardColor,
      dialogBackgroundColor,
      disabledColor,
      dividerColor,
      errorColor,
      focusColor,
      highlightColor,
      hintColor,
      hoverColor,
      indicatorColor,
      scaffoldBackgroundColor,
      secondaryHeaderColor,
      selectedRowColor,
      shadowColor,
      splashColor,
      toggleableActiveColor,
      unselectedWidgetColor,
    ];
  }
}
