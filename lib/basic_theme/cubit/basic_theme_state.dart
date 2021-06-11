part of 'basic_theme_cubit.dart';

@CopyWith()
@immutable
class BasicThemeState extends Equatable {
  final ThemeData themeData;
  final ColorScheme colorScheme;
  final bool isPrimaryColorDark;
  final bool isAccentColorDark;
  final bool isSurfaceColorDark;
  final bool isBackgroundColorDark;
  final bool isErrorColorDark;

  BasicThemeState({
    this.colorScheme = const ColorScheme.light(),
    ThemeData? themeData,
    bool? isPrimaryColorDark,
    bool? isAccentColorDark,
    bool? isSurfaceColorDark,
    bool? isBackgroundColorDark,
    bool? isErrorColorDark,
  })  : themeData = themeData ?? ThemeData.from(colorScheme: colorScheme),
        isPrimaryColorDark =
            isPrimaryColorDark ?? UtilService.isColorDark(colorScheme.primary),
        isAccentColorDark =
            isAccentColorDark ?? UtilService.isColorDark(colorScheme.secondary),
        isSurfaceColorDark =
            isSurfaceColorDark ?? UtilService.isColorDark(colorScheme.surface),
        isBackgroundColorDark = isBackgroundColorDark ??
            UtilService.isColorDark(colorScheme.background),
        isErrorColorDark =
            isErrorColorDark ?? UtilService.isColorDark(colorScheme.error);

  @override
  List<Object> get props {
    return [
      themeData,
      colorScheme,
      isPrimaryColorDark,
      isAccentColorDark,
      isSurfaceColorDark,
      isBackgroundColorDark,
      isErrorColorDark,
    ];
  }
}
