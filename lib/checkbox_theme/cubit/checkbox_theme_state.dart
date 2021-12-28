part of 'checkbox_theme_cubit.dart';

@CopyWith()
class CheckboxThemeState extends Equatable {
  final CheckboxThemeData theme;

  const CheckboxThemeState({this.theme = const CheckboxThemeData()});

  @override
  List<Object> get props => [theme];
}
