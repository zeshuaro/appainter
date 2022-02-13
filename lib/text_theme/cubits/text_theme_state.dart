part of 'text_theme_cubit.dart';

@CopyWith()
class TextThemeState extends Equatable {
  final String fontFamily;

  const TextThemeState({this.fontFamily = kDefaultFontFamily});

  @override
  List<Object> get props => [fontFamily];
}
