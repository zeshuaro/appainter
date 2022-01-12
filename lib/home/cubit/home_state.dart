part of 'home_cubit.dart';

enum EditMode { basic, advanced }

@CopyWith()
@immutable
class HomeState extends Equatable {
  final EditMode editMode;
  final ThemeUsage? themeUsage;
  final bool isSdkShowed;
  final bool isImportingTheme;

  const HomeState({
    this.editMode = EditMode.basic,
    this.themeUsage,
    this.isSdkShowed = false,
    this.isImportingTheme = false,
  });

  @override
  List<Object?> get props {
    return [editMode, themeUsage, isSdkShowed, isImportingTheme];
  }

  @override
  String toString() {
    return 'HomeState { editMode: $editMode, '
        'themeUsage: ${themeUsage != null}, isSdkShowed: $isSdkShowed, '
        'isImportingTheme: $isImportingTheme }';
  }
}
