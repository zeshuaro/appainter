part of 'advanced_theme_cubit.dart';

@CopyWith()
class AdvancedThemeState extends Equatable {
  final bool isDark;

  const AdvancedThemeState({this.isDark = false});

  @override
  List<Object> get props => [isDark];
}
