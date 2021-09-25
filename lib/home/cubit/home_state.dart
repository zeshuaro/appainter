part of 'home_cubit.dart';

enum EditMode { basic, advanced }

@CopyWith()
@immutable
class HomeState extends Equatable {
  final EditMode editMode;
  final ThemeUsage? themeUsage;
  final bool isSdkShowed;

  const HomeState({
    this.editMode = EditMode.basic,
    this.themeUsage,
    this.isSdkShowed = false,
  });

  @override
  List<Object?> get props => [editMode, themeUsage, isSdkShowed];

  @override
  String toString() {
    return 'HomeState { editMode: $editMode, '
        'themeUsage: ${themeUsage != null}, isSdkShowed: $isSdkShowed }';
  }
}
