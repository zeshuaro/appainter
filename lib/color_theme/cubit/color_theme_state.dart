part of 'color_theme_cubit.dart';

@CopyWith()
class ColorThemeState extends Equatable {
  late final Color primaryColor;
  late final Brightness primaryColorBrightness;
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
    ThemeData? theme,
    Color? primaryColor,
    Brightness? primaryColorBrightness,
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
    final themeData = theme ?? ThemeData();
    this.primaryColor = primaryColor ?? themeData.primaryColor;
    this.primaryColorBrightness =
        primaryColorBrightness ?? themeData.primaryColorBrightness;
    this.primaryColorLight = primaryColorLight ?? themeData.primaryColorLight;
    this.primaryColorDark = primaryColorDark ?? themeData.primaryColorDark;
    this.backgroundColor = backgroundColor ?? themeData.backgroundColor;
    this.bottomAppBarColor = bottomAppBarColor ?? themeData.bottomAppBarColor;
    this.canvasColor = canvasColor ?? themeData.canvasColor;
    this.cardColor = cardColor ?? themeData.cardColor;
    this.dialogBackgroundColor =
        dialogBackgroundColor ?? themeData.dialogBackgroundColor;
    this.disabledColor = disabledColor ?? themeData.disabledColor;
    this.dividerColor = dividerColor ?? themeData.dividerColor;
    this.errorColor = errorColor ?? themeData.errorColor;
    this.focusColor = focusColor ?? themeData.focusColor;
    this.highlightColor = highlightColor ?? themeData.highlightColor;
    this.hintColor = hintColor ?? themeData.hintColor;
    this.hoverColor = hoverColor ?? themeData.hoverColor;
    this.indicatorColor = indicatorColor ?? themeData.indicatorColor;
    this.scaffoldBackgroundColor =
        scaffoldBackgroundColor ?? themeData.scaffoldBackgroundColor;
    this.secondaryHeaderColor =
        secondaryHeaderColor ?? themeData.secondaryHeaderColor;
    this.selectedRowColor = selectedRowColor ?? themeData.selectedRowColor;
    this.shadowColor = shadowColor ?? themeData.shadowColor;
    this.splashColor = splashColor ?? themeData.splashColor;
    this.toggleableActiveColor =
        toggleableActiveColor ?? themeData.toggleableActiveColor;
    this.unselectedWidgetColor =
        unselectedWidgetColor ?? themeData.unselectedWidgetColor;
  }

  @override
  List<Object> get props {
    return [
      primaryColor,
      primaryColorBrightness,
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
