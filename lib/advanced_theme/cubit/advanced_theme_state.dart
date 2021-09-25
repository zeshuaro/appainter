part of 'advanced_theme_cubit.dart';

@CopyWith()
@immutable
class AdvancedThemeState extends Equatable {
  final ThemeData themeData;

  AdvancedThemeState({ThemeData? themeData})
      : themeData = ThemeData.localize(
          themeData ?? ThemeData(),
          Typography.englishLike2018,
        );

  @override
  List<Object> get props => [themeData];

  bool get isPrimaryColorLight {
    return themeData.primaryColorBrightness == Brightness.light;
  }

  bool get isPrimaryColorDark => !isPrimaryColorLight;

  bool get isAccentColorLight {
    return themeData.accentColorBrightness == Brightness.light;
  }

  bool get isAccentColorDark => !isAccentColorLight;
}
