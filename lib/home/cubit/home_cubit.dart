import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/home/home.dart';

part 'home_cubit.g.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repo;
  final AdvancedThemeCubit advancedThemeCubit;

  HomeCubit(this.repo, this.advancedThemeCubit) : super(const HomeState());

  void editModeChanged(EditMode mode) => emit(state.copyWith(editMode: mode));

  Future<void> themeUsageFetched() async {
    final thtmeUsage = await repo.fetchThemeUsage();
    emit(state.copyWith(themeUsage: thtmeUsage));
  }

  void sdkShowed() => emit(state.copyWith(isSdkShowed: true));

  Future<void> themeImported() async {
    emit(state.copyWith(isImportingTheme: true));
    final theme = await repo.importTheme();
    emit(state.copyWith(isImportingTheme: false));
    if (theme != null) {
      advancedThemeCubit.themeChanged(theme);
      emit(state.copyWith(editMode: EditMode.advanced));
    }
  }

  Future<void> themeExported(ThemeData theme) async {
    await repo.exportTheme(theme);
  }

  Future<void> themeModeFetched() async {
    late final ThemeMode mode;
    final isDark = await repo.getIsDarkTheme();
    if (isDark != null) {
      mode = getThemeMode(isDark);
    } else {
      mode = ThemeMode.system;
    }

    emit(state.copyWith(status: HomeStatus.success, themeMode: mode));
  }

  Future<void> themeModeChanged(bool isDark) async {
    await repo.setIsDarkTheme(isDark);
    emit(state.copyWith(themeMode: getThemeMode(isDark)));
  }

  @visibleForTesting
  ThemeMode getThemeMode(bool isDark) {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
