part of 'advanced_theme_cubit.dart';

@CopyWith()
class AdvancedThemeState extends Equatable {
  final bool isDark;
  final bool useMaterial3;

  const AdvancedThemeState({
    this.isDark = false,
    this.useMaterial3 = true,
  });

  @override
  List<Object> get props => [isDark, useMaterial3];
}
