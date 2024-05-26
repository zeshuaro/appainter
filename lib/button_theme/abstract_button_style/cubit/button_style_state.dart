part of 'abstract_button_style_cubit.dart';

@CopyWith(copyWithNull: true)
@immutable
class ButtonStyleState extends Equatable {
  const ButtonStyleState({this.style});

  factory ButtonStyleState.withStyle({
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<Color?>? foregroundColor,
    WidgetStateProperty<Color?>? overlayColor,
    WidgetStateProperty<Color?>? shadowColor,
    WidgetStateProperty<double?>? elevation,
    WidgetStateProperty<OutlinedBorder?>? shape,
  }) {
    return ButtonStyleState(
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        shape: shape,
      ),
    );
  }

  final ButtonStyle? style;

  @override
  List<Object?> get props => [style];
}
