import 'dart:async';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_theme_cubit.g.dart';
part 'bottom_navigation_bar_theme_state.dart';

const _labelTypeScale = TypeScale.labelLarge;

@ThemeDocs(
  apiClassName: 'BottomNavigationBarThemeData',
  extraPropertyTypes: {'BottomNavigationBarType'},
)
class BottomNavigationBarThemeCubit
    extends Cubit<BottomNavigationBarThemeState> {
  BottomNavigationBarThemeCubit({
    required this.labelTextStyleCubit,
    required this.unselectedLabelTextStyleCubit,
  }) : super(const BottomNavigationBarThemeState()) {
    labelTextStyleCubitSubscription = labelTextStyleCubit.stream.listen(
      (otherState) {
        final theme = state.theme.copyWith(
          selectedLabelStyle: otherState.style,
        );
        emit(state.copyWith(theme: theme));
      },
    );
    unselectedLabelTextStyleCubitSubscription =
        unselectedLabelTextStyleCubit.stream.listen(
      (otherState) {
        final theme = state.theme.copyWith(
          unselectedLabelStyle: otherState.style,
        );
        emit(state.copyWith(theme: theme));
      },
    );
  }

  final BottomNavigationBarLabelTextStyleCubit labelTextStyleCubit;
  final BottomNavigationBarUnselectedLabelTextStyleCubit
      unselectedLabelTextStyleCubit;

  late final StreamSubscription labelTextStyleCubitSubscription;
  late final StreamSubscription unselectedLabelTextStyleCubitSubscription;

  static final defaultLabelTextStyle = kWhiteTextStyles[_labelTypeScale]!;

  @override
  Future<void> close() {
    labelTextStyleCubitSubscription.cancel();
    unselectedLabelTextStyleCubitSubscription.cancel();
    return super.close();
  }

  void themeChanged(BottomNavigationBarThemeData theme) {
    labelTextStyleCubit.styleChanged(
      theme.selectedLabelStyle ?? defaultLabelTextStyle,
    );
    unselectedLabelTextStyleCubit.styleChanged(
      theme.unselectedLabelStyle ?? defaultLabelTextStyle,
    );
    emit(state.copyWith(theme: theme));
  }

  void typeChanged(String? value) {
    final type = UtilService.stringToEnum(
      BottomNavigationBarType.values,
      value,
    );
    final showLabels = type == BottomNavigationBarType.shifting ? false : true;
    final theme = state.theme.copyWith(
      type: type,
      showUnselectedLabels: showLabels,
    );
    emit(state.copyWith(theme: theme));
  }

  void backgroundColorChanged(Color color) {
    final theme = state.theme.copyWith(backgroundColor: color);
    emit(state.copyWith(theme: theme));
  }

  void selectedItemColorChanged(Color color) {
    final theme = state.theme.copyWith(selectedItemColor: color);
    emit(state.copyWith(theme: theme));
  }

  void unselectedItemColorChanged(Color color) {
    final theme = state.theme.copyWith(unselectedItemColor: color);
    emit(state.copyWith(theme: theme));
  }

  void showSelectedLabelsChanged(bool showSelectedLabels) {
    final theme = state.theme.copyWith(showSelectedLabels: showSelectedLabels);
    emit(state.copyWith(theme: theme));
  }

  void showUnselectedLabelsChanged(bool showUnselectedLabels) {
    final theme = state.theme.copyWith(
      showUnselectedLabels: showUnselectedLabels,
    );
    emit(state.copyWith(theme: theme));
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final theme = state.theme.copyWith(elevation: elevation);
      emit(state.copyWith(theme: theme));
    }
  }
}

class BottomNavigationBarLabelTextStyleCubit extends AbstractTextStyleCubit {
  BottomNavigationBarLabelTextStyleCubit()
      : super(typeScale: _labelTypeScale, isBaseStyleBlack: false);
}

class BottomNavigationBarUnselectedLabelTextStyleCubit
    extends AbstractTextStyleCubit {
  BottomNavigationBarUnselectedLabelTextStyleCubit()
      : super(typeScale: _labelTypeScale, isBaseStyleBlack: false);
}
