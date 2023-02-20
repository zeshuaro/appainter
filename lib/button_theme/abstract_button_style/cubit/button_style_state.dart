part of 'abstract_button_style_cubit.dart';

@CopyWith(copyWithNull: true)
@immutable
class ButtonStyleState extends Equatable {
  const ButtonStyleState({this.style});

  factory ButtonStyleState.withStyle({
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<double?>? elevation,
  }) {
    return ButtonStyleState(
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
      ),
    );
  }

  final ButtonStyle? style;

  @override
  List<Object?> get props => [style];
}
