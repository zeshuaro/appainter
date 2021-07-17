import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:meta/meta.dart';

part 'home_cubit.g.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeState());

  void editModeChanged(EditMode mode) => emit(state.copyWith(editMode: mode));

  Future<void> themeUsageFetched() async {
    final thtmeUsage = await repo.fetchThemeUsage();
    emit(state.copyWith(themeUsage: thtmeUsage));
  }
}
