part of 'home_cubit.dart';

enum EditMode { basic, advanced }

@CopyWith()
@immutable
class HomeState extends Equatable {
  final EditMode editMode;
  final ThemeUsage? themeUsage;

  const HomeState({this.editMode = EditMode.basic, this.themeUsage});

  @override
  List<Object?> get props => [editMode, themeUsage];

  @override
  String toString() {
    return 'HomeState { editMode: $editMode, '
        'themeUsage: ${themeUsage != null} }';
  }
}
