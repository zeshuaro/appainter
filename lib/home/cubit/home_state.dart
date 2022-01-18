part of 'home_cubit.dart';

enum HomeStatus { initial, success }

enum EditMode { basic, advanced }

@CopyWith()
@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final EditMode editMode;
  final ThemeUsage? themeUsage;
  final bool isSdkShowed;
  final bool isImportingTheme;
  final ThemeMode themeMode;

  const HomeState({
    this.status = HomeStatus.initial,
    this.editMode = EditMode.basic,
    this.themeUsage,
    this.isSdkShowed = false,
    this.isImportingTheme = false,
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props {
    return [
      status,
      editMode,
      themeUsage,
      isSdkShowed,
      isImportingTheme,
      themeMode,
    ];
  }

  @override
  String toString() {
    return 'HomeState { status: $status, editMode: $editMode, '
        'themeUsage: ${themeUsage != null}, isSdkShowed: $isSdkShowed, '
        'isImportingTheme: $isImportingTheme, themeMode: $themeMode }';
  }
}
