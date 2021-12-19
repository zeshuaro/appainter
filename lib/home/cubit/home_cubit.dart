import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/home/home.dart';

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

  void themeImported() async {
    emit(state.copyWith(isImportingTheme: true));
    final theme = await repo.importTheme();
    emit(state.copyWith(isImportingTheme: false));
    if (theme != null) {
      advancedThemeCubit.themeDataChanged(theme);
      emit(state.copyWith(editMode: EditMode.advanced));
    }
  }

  void themeExported(ThemeData theme) async => await repo.exportTheme(theme);
}
